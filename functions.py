import pickle
import datetime
import os
import re
import requests
from pypdf import PdfReader
from bs4 import BeautifulSoup
from pymongo import MongoClient
import ollama
import streamlit as st



"""DATABASE MANAGEMENT CIR"""


def import_data():
    url = [
        "https://cir-reports.cir-safety.org/FetchCIRReports/?&pagingcookie=%26lt%3bcookie%20page%3d%26quot%3b1%26quot%3b%26gt%3b%26lt%3bpcpc_name%20last%3d%26quot%3bPEG-50%20Stearate%26quot%3b%20first%3d%26quot%3b1%2c10-Decanediol%26quot%3b%20%2f%26gt%3b%26lt%3bpcpc_ingredientidname%20last%3d%26quot%3bPEG-50%20Stearate%26quot%3b%20first%3d%26quot%3b1%2c10-Decanediol%26quot%3b%20%2f%26gt%3b%26lt%3bpcpc_cirrelatedingredientsid%20last%3d%26quot%3b%7bC223037E-F278-416D-A287-2007B9671D0C%7d%26quot%3b%20first%3d%26quot%3b%7b940AF697-52B5-4A3A-90A6-B9DB30EF4A7E%7d%26quot%3b%20%2f%26gt%3b%26lt%3b%2fcookie%26gt%3b&page=1",
        "https://cir-reports.cir-safety.org/FetchCIRReports/?&pagingcookie=%26lt%3bcookie%20page%3d%26quot%3b1%26quot%3b%26gt%3b%26lt%3bpcpc_name%20last%3d%26quot%3bPEG-50%20Stearate%26quot%3b%20first%3d%26quot%3b1%2c10-Decanediol%26quot%3b%20%2f%26gt%3b%26lt%3bpcpc_ingredientidname%20last%3d%26quot%3bPEG-50%20Stearate%26quot%3b%20first%3d%26quot%3b1%2c10-Decanediol%26quot%3b%20%2f%26gt%3b%26lt%3bpcpc_cirrelatedingredientsid%20last%3d%26quot%3b%7bC223037E-F278-416D-A287-2007B9671D0C%7d%26quot%3b%20first%3d%26quot%3b%7b940AF697-52B5-4A3A-90A6-B9DB30EF4A7E%7d%26quot%3b%20%2f%26gt%3b%26lt%3b%2fcookie%26gt%3b&page=2"
    ]
    database = {}
    ingredient = {}

    for i in url:
        richiesta = requests.get(i)
        data = richiesta.json()
        for e in data["results"]:
            database[e["pcpc_ingredientname"]] = e["pcpc_ingredientid"]

    for a, b in database.items():
        ingredient[a] = "https://cir-reports.cir-safety.org/cir-ingredient-status-report/?id=" + b

    with open('./data/ingredient.pkl', 'wb') as pickle_file:
        pickle.dump(ingredient, pickle_file)

    return True


def open_data():
    try:
        with open("./data/ingredient.pkl", "rb") as pickle_file:
            ingredient = pickle.load(pickle_file)
    except Exception as e:
        with open("./data/cir_rep.html", encoding="utf8") as cir:
            soup = BeautifulSoup(cir, 'html.parser')

        table = soup.find('table', class_='table')

        for row in table.find_all('tr')[1:]:  # il primo elemento è "ingrediente as used.." e va saltato
            link = row.find('a')
            name = link.text
            url = link['href']
            ingredient[name] = url
    return ingredient


def check_update():
    if not os.path.isfile('./data/ingredient.pkl'):
        import_data()

    creation_time = os.path.getctime('./data/ingredient.pkl')
    creation_time_readable = datetime.datetime.fromtimestamp(creation_time)

    if datetime.datetime.now() > creation_time_readable + datetime.timedelta(days=30):
        import_data()
        return True
    return False


"""PDF READ and PARSE"""


def read(name_doc):
    reader = PdfReader(f"./data/{name_doc}")
    text_pdf = ""
    for page in reader.pages:
        text_pdf += page.extract_text() + "\n"
    text = text_pdf.replace('\n', ' ')
    return text


def extract_phrases(text):
    keywords = ["NOAEL", "LD50"]
    match_list = []
    num = 1

    pattern = re.compile(rf'.{0,200}{keywords[0]}.{0,200}\d+.{0,200}', re.IGNORECASE)
    matches = pattern.findall(text)

    for quote in matches:
        print(quote)
        x = f"{num}) + {quote}"
        match_list.append(x)
        num += 1
    return match_list


def ai(text):
    extracted_phrases = extract_phrases(text)
    content = " ".join(extracted_phrases)

    if len(extracted_phrases) > 1:
        response = ollama.chat(model="llama3", messages=[
            {
                'role': 'user',
                'content':f"What is the NOAEL and LD50 or DNEL or LOAEL value in this text? {content}",
            },
        ])

        st.write(response['message']['content'])
        st.session_state.phrases = extracted_phrases
        st.session_state.testo = response['message']['content']


"""UTILITY STREAMLIT FUNCTIONS"""


def navigate_to(page):
    st.session_state.page = page


def search_ingredients(search):
    check_update()

    with open("./data/ingredient.pkl", "rb") as pickle_file:
        ingredient = pickle.load(pickle_file)

    risultati = []
    for nome, url in ingredient.items():
        if search.lower() in nome.lower():
            ingredient_selection = [nome, url]
            risultati.append(ingredient_selection)
    return risultati


def show_results(risultati):
    selected_ingredient = None
    for nome, url in risultati:
        if st.button(nome, on_click=navigate_to, args=("results",)):
            selected_ingredient = (nome, url)
    return selected_ingredient


"""DATABASE CIR"""


def upload():
    db, collection, client = connect()

    element = {
        "ingrediente": st.session_state.nome,
        "testo": st.session_state.testo
    }

    if collection.count_documents({"ingrediente": st.session_state.nome}) == 0:
        collection.insert_one(element)
        client.close()
        return True
    else:
        client.close()
        return False


def connect():
    client = MongoClient(
        "mongodb+srv://giorgio2006:TWoA7kZsvL30k6Ua@cluster0563.wr9rvs7.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0563")
    db = client.ingredients
    collection = db.noael
    return db, collection, client


def saved_ingredients():
    db, collection, client = connect()
    ingredients = collection.distinct('ingrediente')
    client.close()
    return ingredients


def output_ingredient(nome):
    db, collection, client = connect()
    document = collection.find_one({'ingrediente': nome})
    client.close()
    return document


def saved_echa():
    db, collection, client = connect()
    echa_col = db.echa
    ingredients = echa_col.distinct('name')
    client.close()
    return ingredients


def output_echa(nome):
    db, collection, client = connect()
    echa_col = db.echa
    document = echa_col.find_one({'name': nome})
    client.close()
    return document


