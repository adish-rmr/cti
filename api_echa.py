import requests
from bs4 import BeautifulSoup
import urllib.parse
import streamlit as st


def search_dossier(substance):
    base_url = 'https://chem.echa.europa.eu'

    # search for substance
    search_url = f'{base_url}/api-substance/v1/substance?pageIndex=1&pageSize=100&searchText={urllib.parse.quote(substance)}'
    req_0_json = requests.get(search_url).json()

    try:
        item = req_0_json['items'][0]['substanceIndex']
        rml_id, rml_name = item['rmlId'], item['rmlName']
    except (IndexError, KeyError):
        st.write('There is no toxicological summary for this substance.')
        return False

    # search for dossier
    for status in ['Active', 'Inactive']:
        dossier_url = f'{base_url}/api-dossier-list/v1/dossier?pageIndex=1&pageSize=100&rmlId={rml_id}&registrationStatuses={status}'
        req_1_json = requests.get(dossier_url).json()
        if req_1_json['items']:
            st.write(f"Found dossiers {'active' if status == 'Active' else 'inactive'} for '{rml_name}'")
            break
    else:
        st.write(f"No dossier exists for '{rml_name}'")
        return False

    # dossier information
    item = req_1_json['items'][0]
    asset_external_id = item['assetExternalId']

    # index page
    index_url = f'{base_url}/html-pages/{asset_external_id}/index.html'
    index = BeautifulSoup(requests.get(index_url).text, 'html.parser')

    # toxicological information
    tox_div = index.find("div", id='id_7_Toxicologicalinformation')
    if not tox_div or not tox_div.find('a', href=True):
        st.write('No toxicological information available for this substance.')
        return False

    uic = tox_div.find('a', href=True)['href']

    # acute toxicity
    acute_tox_div = index.find('div', id='id_72_AcuteToxicity')
    if acute_tox_div and acute_tox_div.find('a', href=True):
        acute_tox_id = acute_tox_div.find('a', href=True)['href']
        acute_tox_link = f'{base_url}/html-pages/{asset_external_id}/documents/{acute_tox_id}.html'

    final_url = f'{base_url}/html-pages/{asset_external_id}/documents/{uic}.html'
    return final_url, acute_tox_link
