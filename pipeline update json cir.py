import functions as f
from bs4 import BeautifulSoup
import requests
import ollama
from pymongo import MongoClient
import re
from pypdf import PdfReader
import os

ingredienti = f.open_data()


def read2(name_doc):
    reader = PdfReader(f"I:\pdfs\{name_doc}")
    text_pdf = ""
    for page in reader.pages:
        text_pdf += page.extract_text() + "\n"
    text = text_pdf.replace('\n', ' ')
    return text


for nome, url in ingredienti.items():
    if nome.startswith("A"):
        nome = nome.replace("/", "_")
        response = requests.get(url)
        soup = BeautifulSoup(response.text, 'html.parser')
        lista_pdf = []

        print(nome)

        pdf = soup.find_all("a")
        for pd in pdf:
            if ".." in pd["href"]:
                lista_pdf.append(pd["href"])

        if lista_pdf:
            last_pdf = lista_pdf[0]
            url2 = "https://cir-reports.cir-safety.org" + last_pdf[2:]
            response = requests.get(url2)
            print(url2)

            client = MongoClient(
                "mongodb+srv://giorgio2006:TWoA7kZsvL30k6Ua@cluster0563.wr9rvs7.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0563")
            db = client.ingredients
            collection = db.noael

            filter_db = {"ingrediente": nome}

            element = {
                "$set":{
                    "link": url2
                }
            }

            result = collection.update_one(filter_db, element)
            print(f"Modified {result.modified_count} document")

            if result.modified_count == 0:
                collection.insert_one({"ingrediente": nome, "link": url2})
