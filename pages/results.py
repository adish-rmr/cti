import streamlit as st
import requests
from bs4 import BeautifulSoup
import functions as f

ai_ready = True
nome = st.session_state.nome
link = st.session_state.link
st.subheader(nome, divider="blue")

cir = st.session_state.cir
document = cir.find_one({'ingrediente': nome})
if document:
    st.write(document['testo'])
    st.download_button("Download last report", document['link'])
else:
    response = requests.get(link)
    soup = BeautifulSoup(response.text, 'lxml')
    pdf_link = soup.find('a', href=lambda href: href and '..' in href)
    if pdf_link:
        url = f"https://cir-reports.cir-safety.org{pdf_link['href'][2:]}"
        st.link_button("Download last report", url)
        response = requests.get(url)
        if response.status_code == 200:
            with open(f"./data/documento", "wb") as file:
                file.write(response.content)
                testo = f.read("documento")
                search_terms = ['NOAEL', 'LD50', 'LD 50']
                result = f.find_toxicity(testo, search_terms)
                st.write(result)
                if ai_ready:
                    f.ai(testo)
                    testo = st.session_state.testo_ai
                    st.write(testo)
                    cir.insert_one({'ingrediente': nome, "testo": testo, 'link': url})

