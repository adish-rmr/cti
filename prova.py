import functions as f
from bs4 import BeautifulSoup
import requests
import ollama
from pymongo import MongoClient
import re

ingredienti = f.open_data()

for nome, url in ingredienti.items():
    if nome.startswith("A"):
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

            if response.status_code == 200:
                with open(f"./data/documento", "wb") as file:
                    file.write(response.content)
            else:
                print("Failed to download PDF.")

            testo = f.read(f"documento")

            # Define a regex pattern to match the word "NOAEL" followed by any characters and numbers
            pattern = re.compile(r'.{0,200}NOAEL.{0,200}\d+.{0,200}', re.IGNORECASE)
            pattern2 = re.compile(r'.{0,200}LD50.{0,200}\d+.{0,200}', re.IGNORECASE)

            # Find all matches in the text
            matches = pattern.findall(testo)
            matches2 = pattern2.findall(testo)
            matches = matches + matches2
            match_list = []

            ide = 1

            for each in matches:
                a = f"{ide}) +{each}"
                match_list.append(a)
                ide += 1

            if len(match_list) > 1:
                content = " ".join(match_list)
                response = ollama.chat(model="llama3", messages=[
                    {
                        'role': 'user',
                        'content': f"What is the NOAEL and LD50 value in this text? {content}",
                    },
                ])

                client = MongoClient(
                    "mongodb+srv://giorgio2006:TWoA7kZsvL30k6Ua@cluster0563.wr9rvs7.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0563")
                db = client.ingredients
                collection = db.noael

                element = {
                    "ingrediente": nome,
                    "testo": response['message']['content']
                }

                if collection.count_documents({"ingrediente": nome}) < 2:
                    collection.insert_one(element)
                    print("item inserted")
                else:
                    pass

