# LINK

https://cosmetic-tox-info.streamlit.app/

## Funzionalità

-Ricerca tramite nome ingrediente o chemical compound
-Risultati in tempo 0 per ingredienti CIR da lettera A a I, resto work in progress
-Risultati in tempo 0 per chemical compund di ECHA (fatti 2000 su 22000 per ordine di inventario)
-Risultati in tempo 0 per API Echa (acute e data tox)
-Automazione di elaborazione testi AI + upload su mongoDB (quindi basta fare parsing testo una volta e poi è tempo 0)
-Automazione di aggiornamento indici ingredienti CIR ogni 30gg, possibilità di forzare automaticamente
-Opzioni per inserire più ingredienti insieme per fare una ricerca in bulk di più ingredienti
-Ricerca tramite Google Search in casi estremi
-Possibilità di cercare con "in" o "startswith"
-UI semplice e intuitiva 
-Online non funziona AI
-Requisito per installazioni locali: server ollama 8b

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
