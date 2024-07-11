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
    reader = PdfReader(f"./data/documento")
    text_pdf = ""
    for page in reader.pages:
        text_pdf += page.extract_text() + "\n"
    text = text_pdf.replace('\n', ' ')
    return text


def find_toxicity(text, search_terms):
    pattern = re.compile(
        r'(.{0,200}(' + '|'.join(map(re.escape, search_terms)) + r').{0,200}\d+.{0,200})',
        re.IGNORECASE
    )
    matches = pattern.findall(text)

    return [f"{i + 1}) {match[0]}" for i, match in enumerate(matches)]


def ai(phrases):
    content = " ".join(phrases)

    if len(phrases) > 1:
        response = ollama.chat(model="llama3", messages=[
            {
                'role': 'user',
                'content':f"What is the NOAEL and LD50 (or LOAEL) value in this text? {content}",
            },
        ])

        text = response['message']['content']
        st.session_state.testo_ai = text


"""UTILITY STREAMLIT FUNCTIONS"""


def navigate_to(page):
    st.session_state.page = page


def search_ingredients(search):
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





