import streamlit as st
import re
import pymongo
from api_echa import search_dossier


cir = st.session_state.cir
echa = st.session_state.echa

text = st.text_area("Paste the list of ingredients here, each ingredient must be separated by a comma. *Avoid Aqua or similar*")

pattern = r'^[^,]+|(?<=,)[^,]+(?=,)|[^,]+$'
lista = re.findall(pattern, text)
st.write(lista)

for each in lista:
    st.write(f"### {each}")
    doc = cir.find_one({"ingrediente": each})
    if doc:
        st.write(doc)
    doc = echa.find_one({"name": each})
    if doc:
        st.write(doc)
    try:
        datatox, acutetox = search_dossier(each)
        if datatox:
            st.link_button("ECHA Tox Summary", datatox)
        if acutetox:
            st.link_button("ECHA Acute Toxicity report", acutetox)
    except Exception as e:
        st.link_button("Google Search", f"https://www.google.com/search?&q={each}+noael+ld50+loael+dnel")





