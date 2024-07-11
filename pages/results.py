import streamlit as st
import requests
from bs4 import BeautifulSoup
import functions as f

ai_ready = True
nome = st.session_state.nome
link = st.session_state.link
st.subheader(nome, divider="blue")

saved = f.saved_ingredients()
for ingredient in saved:
    if nome == ingredient:
        doc = f.output_ingredient(nome)
        st.write(doc['testo'])
    else:
        doc = False

response = requests.get(link)
soup = BeautifulSoup(response.text, 'html.parser')
lista_pdf = []
pdf = soup.find_all("a")
for pd in pdf:
    if ".." in pd["href"]:
        lista_pdf.append(pd["href"])
last_pdf = lista_pdf[0]

url = "https://cir-reports.cir-safety.org" + last_pdf[2:]
label = "Download last report"
st.link_button(label, url)
st.link_button("Back", "http://localhost:8501/")

if not doc:
    response = requests.get(url)
    if response.status_code == 200:
        with open(f"./data/documento", "wb") as file:
            file.write(response.content)
    else:
        st.write("Failed to download PDF.")
    testo = f.read("documento")
    if ai_ready:
        f.ai(testo)
        st.write(st.session_state.testo)
        st.write(st.session_state.phrases)
        f.upload()

