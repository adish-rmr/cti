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
        if os.path.isfile(f"I:\pdfs\{nome}"):
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
                    with open(f"I:\pdfs\{nome}", "wb") as file:
                        file.write(response.content)
                else:
                    print("Failed to download PDF.")

                testo = read2(f"{nome}")


                def find_toxicity_values(text, search_terms):
                    # Create a combined pattern for all search terms
                    pattern = re.compile(
                        r'(.{0,200}(' + '|'.join(map(re.escape, search_terms)) + r').{0,200}\d+.{0,200})',
                        re.IGNORECASE
                    )

                    # Find all matches in the text
                    matches = pattern.findall(text)

                    # Format matches with numbering, taking the full match (index 0)
                    return [f"{i + 1}) {match[0]}" for i, match in enumerate(matches)]

                # Example usage
                search_terms = ['NOAEL', 'LD50', 'LD 50']
                result = find_toxicity_values(testo, search_terms)

                if len(result) > 1:
                    content = " ".join(result)
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
                        "testo": response['message']['content'],
                        "link": url2
                    }

                    if collection.count_documents({"ingrediente": nome}) < 1:
                        collection.insert_one(element)
                        print("item inserted")
                    else:
                        pass

