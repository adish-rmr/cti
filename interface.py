import streamlit as st
import functions as f

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
            st.write("Nessun elemento trovato, prova a cercare su ECHA e PubChem")
            selector = "Chemical Compound (ECHA/PubChem)"
    if selector == "Chemical Compound (ECHA/PubChem)":
        saved = f.saved_echa()
        for ingredient in saved:
            if ingredient.startswith(t_input) or t_input in ingredient:
                doc = f.output_echa(ingredient)
                st.write(f"### **{doc['name']}**")
                st.write(f"Via inhalation: {doc['ViaInhalationRoute']}")
                st.write(f"Via Dermal: {doc['ViaDermalRoute']}")
            else:
                doc = False



