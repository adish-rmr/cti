import pandas as pd
import zipfile
from bs4 import BeautifulSoup
from iuclid import data_extraction
import json

df = pd.read_excel("./data/data_echa.xlsx")
lista = []
for i in range(1600, 2000):
    lista.append((df.loc[i, 'uuid'], df.loc[i, 'substance']))

for each in lista:
    try:
        with zipfile.ZipFile(fr"D:/dossier/{each[0]}.i6z", 'r') as zip_ref:
            zip_ref.extractall(f'extractedi6z/{each[1]}_{each[0]}')
    except Exception as e:
        print("Estrazione fallita")
        pass
    try:
        with open(f'./extractedi6z/{each[1]}_{each[0]}/manifest.xml', 'r', encoding='utf-8') as manifest:
            data = manifest.read()
    except Exception as e:
        print("Lettura fallita")


    try:
        soup = BeautifulSoup(data, features='lxml')
        documents = soup.find_all('document')
        tags_content = [a.find_all({'subtype': 'DataTox', 'name': ''}) for a in documents]
    except Exception as e:
        print("Parsing fallito (1)")
        pass

    try:
        DataTox_content = [b for b in tags_content if 'DataTox' in b[0]][0]
        DataTox_content_link = DataTox_content[1]
        DataTox_uuid = DataTox_content_link.attrs['xlink:href']
    except Exception as e:
        print("Parsing fallito (2)")
        pass

    try:
        scheda = data_extraction(DataTox_uuid[:-4], each[1], each[0])
        with open(f'D:/cartelle/{each[1]}_{each[0]}.json', 'w') as json_file:
            json.dump(scheda, json_file, indent=4)
    except Exception as e:
        print("Creazione scheda fallita")
