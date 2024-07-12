#LINK

https://cosmetic-tox-info.streamlit.app/

# Spiegazione files

main files:
- interface.py = interfaccia principale
  1) pages/results.py = interfaccia per CIR
  2) pages/text.py = interfaccia multi analyzer

- cir_data_extraction.py = pipeline di estrazione dati da CIR attraverso scraping
- functions.py = varie funzioni di utilità (non usate tutte)
- echa_extraction.py = pipeline per estrarre dati in bulk da files i6z
- iuclid.py = pipeline di supporto per estrarre files da i6d (i dossier)
- api_echa.py = pipeline per fare scraping da sito echa
- pipeline update json cir.py = pipeline per aggiornare i documenti mongodb
- data/ = vari files di utilità/testing
	
Jul 12, 2024
