# FPW_Project

Benvenuto nel repository **FPW_Project**!

Questo progetto è stato realizzato per il corso di Fondamenti di Programmazione Web (FPW) e raccoglie il codice e le risorse sviluppate durante il percorso.

## Descrizione

Il progetto FPW_Project ha lo scopo di mettere in pratica le conoscenze acquisite riguardo lo sviluppo web, attraverso la realizzazione di un'applicazione web completa. Il repository contiene sia il frontend che il backend, oltre a risorse di configurazione e documentazione.

## Caratteristiche principali

- **Frontend**: Interfaccia utente moderna e responsive.
- **Backend**: Gestione delle API, autenticazione e logica di business.
- **Database**: Persistenza dei dati per utenti e contenuti.
- **Autenticazione**: Sistema di registrazione e login.

## Tecnologie utilizzate

- HTML5, CSS3, JavaScript
- Node.js / Express.js (o altra tecnologia backend se differente)
- Database SQL/PostgreSQL (specificare quale, ad esempio MongoDB, MySQL)

## Struttura del progetto

```
├── Server/          # Codice lato server (, DB, autenticazione)
├── travel_io/       # Codice lato client (UI/UX)
├── README.md        # Questo file
└── ...              # Altre cartelle/file
```

## Come iniziare

1. **Clona il repository**
   ```bash
   git clone https://github.com/diiego-s/FPW_Project.git
   cd FPW_Project
   ```
2. **Installa le dipendenze**
   - Per il backend:
     ```bash
     cd Server
     npm install
     ```
   - Per il frontend (se necessario):
     ```bash
     cd ../travel_io
     npm install
     ```
3. **Avvia il progetto**
   - Avvia il backend:
     ```
     npm run start
     ```
   - Avvia il frontend:
     ```
     npm run dev
     ```

## Contribuire

Sono benvenute pull request e suggerimenti! Per favore apri un'issue per discutere i cambiamenti che vorresti apportare.

---

_Progetto sviluppato per il corso di Fondamenti di Programmazione Web_
