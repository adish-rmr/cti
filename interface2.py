import os
import functions as f
import json

"""
path = "D:\cartelle"
for filename in os.listdir(path):
    file_path = os.path.join(path, filename)
    with open(file_path, mode='r') as file:
        data = json.load(file)
    db, collection, client = f.connect()
    echa_col = db.echa
    echa_col.insert_one(data)
"""


saved = f.saved_ingredients('echa')
for ingredient in saved:
    if nome in ingredient:
        doc = f.output_ingredient(nome, 'echa')
        st.write(**{doc['name']}**)
        st.write(f"Via inhalation: {doc['ViaInhalationRoute']}")
        st.write(f"Via Dermal: {doc['ViaDermalRoute']}")
    else:
        doc = False
