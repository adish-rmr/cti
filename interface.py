import pymongo
import time
import streamlit as st
import functions as f
from api_echa import search_dossier


#PAGE ELEMENTS

if "page" not in st.session_state:
    st.session_state.page = "home"

st.title(body="Cosmetic ToxInfo", anchor="titolo")
st.subheader('Search', divider='blue')

toggle_label = (
    "Nascondi"
    if st.session_state.get("my_toggle", False)
    else "Quick guide and options"
)
toggle_value = st.session_state.get("my_toggle", False)
is_toggle = st.toggle(toggle_label, value=toggle_value, key="my_toggle")

if is_toggle:
    multi = """
    :blue-background[Come funziona?]  
    Scrivi un ingrediente cosmetico e avrai in output i valori NOAL o LD50.  
    :blue-background[Da dove prende i dati?]  
    I dati provengono dal [Cosmetic Ingredient Review (CIR)](https://cir-safety.org/), [ECHA](https://chem.echa.europa.eu/), [PUBCHEM](https://pubchem.ncbi.nlm.nih.gov/)
    :blue-background[Viene impiegata l'intelligenza artificiale?]  
    Sì, il modulo AI è [Meta Llama3](https://llama.meta.com/llama3/) con 8 miliardi di parametri, è stato ottimizzato per la ricerca dei NOAL/LD50.  
    """
    st.markdown(multi)
    update = st.button("Update database", key="update", help="L'aggiornamento del database viene effettuato automaticamente ogni 30 gg, se si vuole aggiornare ora cliccare il bottone")
    if update:
        f.check_update()

t_input = st.text_input("Name of the ingredient as used", placeholder="'Formaldehyde'", max_chars=100,
                        key="barra_input")

selector = st.radio("Search by:", ["Ingredient (CIR)", "Chemical Compound (ECHA/PubChem)"], horizontal=True)

#DATABASE LOADING

uri = "mongodb+srv://giorgio2006:TWoA7kZsvL30k6Ua@cluster0563.wr9rvs7.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0563"
client = pymongo.MongoClient(uri)
db = client.ingredients
cir = db.noael
echa = db.echa
st.session_state.echa = echa
st.session_state.cir = cir
echa_list = echa.distinct('name')
f.check_update()

#INPUT PATH

if t_input:
    if selector == "Ingredient (CIR)":
        risultati = f.search_ingredients(t_input)
        if risultati:
            st.write("Please select the ingredient by clicking on the name.")
            elemento_ricercato = f.show_results(risultati)
            if elemento_ricercato:
                el = st.session_state.link = f'{elemento_ricercato[1]}'
                il = st.session_state.nome = f'{elemento_ricercato[0]}'
                st.switch_page("pages/results.py")
        else:
            st.write("No element found, try ECHA or PubChem")
            selector = "Chemical Compound (ECHA/PubChem)"
            time.sleep(1)
    if selector == "Chemical Compound (ECHA/PubChem)":
        try:
            datatox, acutetox = search_dossier(t_input)
            if datatox:
                st.link_button("ECHA Tox Summary", datatox)
            if acutetox:
                st.link_button("ECHA Acute Toxicity report", acutetox)
        except Exception as e:
            st.link_button("Google Search", f"https://www.google.com/search?&q={t_input}+noael+ld50+loael+dnel")
        for ingredient in echa_list:
            if ingredient.startswith(t_input):
                document = echa.find_one({'name': ingredient})
                st.write(f"### {document['name']}")
                st.write(f"Via inhalation: {document['ViaInhalationRoute']}")
                st.write(f"Via Dermal: {document['ViaDermalRoute']}")


