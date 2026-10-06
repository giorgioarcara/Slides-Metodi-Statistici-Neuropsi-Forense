---
description: Allinea un deck di slide italiano al libro "Oltre i punteggi" — prima produce un piano, poi lo esegue solo su conferma
argument-hint: <nome-file.qmd>
---

Raw arguments: `$ARGUMENTS`

(L'harness di questo comando ha mostrato in passato una sostituzione poco affidabile di placeholder
posizionali come `$1`/`$2` — non fare mai riferimento a quelli. Se `$ARGUMENTS` sopra compare come il
testo letterale `$ARGUMENTS` invece del vero argomento, usa il testo grezzo dell'argomento/comando
presente altrove nella conversazione — es. un tag `<command-args>` — invece di indovinare.)

## 1. Risolvi il deck target

`$ARGUMENTS` è il nome (o un frammento del nome) di un file `.qmd` italiano di questo corso (mai un
file `ENG-*` — quelli sono fuori scope per questo comando). Cerca tra i file `.qmd` nella root del
repo che NON iniziano con `ENG-` una corrispondenza per nome file o sottostringa.

- Se non trovi nessuna corrispondenza, o ne trovi più di una, elenca i candidati trovati e chiedi
  all'utente quale intendeva — non indovinare.
- Se `$ARGUMENTS` è vuoto, chiedi per quale deck eseguire l'allineamento.

Leggi il file `.qmd` risolto per intero.

## 2. Consulta il tracker

Apri `Piano_Allineamento_Libro.md` (root del repo) e trova la riga di mappatura per questo deck.

- **Se il deck è nella tabella "Rimandati"** (capitolo del libro non ancora scritto): **fermati qui**.
  Spiega all'utente perché (capitolo assente o solo bozza) citando lo stato riportato nella tabella, e
  non modificare nulla. Non procedere agli step successivi.
- **Se il deck non è in nessuna tabella del tracker** (non è né in Livello 1, né in "Verifica leggera",
  né in "Rimandati", né negli "Esclusi"): fermati e chiedi all'utente come classificarlo, prima di
  proseguire — non assumere che sia pronto per l'allineamento.
- **Se il deck è negli "Esclusi"**: avvisa che questo deck è escluso dal tracking (nessun contenuto da
  allineare) e fermati.
- **Se la riga è già spuntata `[x]`**: avvisa l'utente che questo deck risulta già allineato (indica il
  changelog esistente in `review/`) e chiedi se procedere comunque con un nuovo giro.
- Altrimenti (Livello 1 non spuntato, o "Verifica leggera"), annota il capitolo/file del libro mappato
  e prosegui.

## 3. Leggi le fonti

Prima di proporre qualunque modifica, leggi per intero:

1. Il capitolo/sezione del libro mappato in `oltre-i-punteggi-elementi/chapters/<file>.qmd` (repo:
   `/Users/giorgioarcara/Documents/Projects/2025-Book-Psychometrics/oltre-i-punteggi-elementi/`) —
   se il tracker indica un range di righe, parti da lì ma leggi anche il contesto immediatamente
   circostante se la sezione continua oltre il range annotato.
2. `oltre-i-punteggi-elementi/chapters/Appendici/definizioni.qmd` (glossario) — per i termini
   coinvolti in questo deck, per verificare la terminologia canonica del libro.
3. Se il deck riguarda formule/soglie, controlla anche `oltre-i-punteggi-elementi/references.bib` per
   le chiavi di citazione degli autori che compaiono nel capitolo, così da poter citare correttamente
   (es. `slick2006psychometrics`, `sattler2001assessment`, `aera2014standards`).
4. Se esiste già `review/04c-changelog.md`, usalo come modello di formato per il piano che produrrai
   allo step 4 (non copiarne il contenuto, solo lo schema tabellare Slide/Prima/Dopo/Riferimento).

## 4. Produci il piano di aggiornamento (senza applicarlo)

Confronta il deck con la sezione del libro letta, slide per slide. Per ogni slide dove l'allineamento
è opportuno, valuta quali delle "mosse di allineamento" elencate in `Piano_Allineamento_Libro.md`
(swap di framing, tabella soglie, rinomina terminologia, definizioni dal libro, vocabolario nuovo,
specifica di modello statistico, caveat/limiti, soglie per-metodo, slide Riferimenti, glossari
formule) si applicano.

Rispetta l'invariante: **le formule matematiche e l'ordine delle slide non cambiano**, salvo un motivo
specifico legato al libro che vada dichiarato esplicitamente nel piano.

Scrivi il piano in `review/<nome-deck-senza-estensione>-plan.md` (la cartella `review/` è già in
`.gitignore`, non verrà committata) con questo schema:

```markdown
# <nome-deck> — piano di allineamento (bozza, non applicato)

Libro: <file>.qmd, §<sezione> (righe L<inizio>–L<fine>)

## Modifiche proposte

| Slide | Prima | Dopo (proposto) | Riferimento libro | Mossa |
|---|---|---|---|---|
| ... | ... | ... | L... | (numero/nome mossa) |

## Non toccato (deliberatamente)
- ...

## Note/incertezze
- ... (punti dove serve una decisione dell'utente, es. terminologia ambigua o contenuto del libro incompleto)
```

Poi mostra all'utente in chat un riassunto conciso di questo piano (non l'intero file) — quante slide
toccate, quali le modifiche principali, ed eventuali note/incertezze.

## 5. Chiedi conferma prima di modificare

Non modificare il deck `.qmd` in questo passo. Chiedi esplicitamente all'utente se vuole:
- applicare il piano ora così com'è,
- discuterne/modificarne alcune voci prima di applicarlo, oppure
- lasciarlo solo come proposta in `review/` per ora (nessuna applicazione).

Procedi al passo 6 solo se l'utente conferma di voler applicare (eventualmente dopo modifiche al piano).

## 6. Applica il piano confermato

1. Modifica il file `.qmd` secondo il piano (aggiornato con eventuali correzioni dell'utente).
2. Esegui `quarto render "<nome-deck>.qmd"` e verifica che il render sia pulito (nessun errore
   LaTeX/Quarto). Se il render fallisce, correggi e ripeti prima di proseguire.
3. Scrivi `review/<nome-deck-senza-estensione>-changelog.md` con lo stesso schema di
   `review/04c-changelog.md` (tabella Slide/Prima/Dopo/Perché-o-Riferimento, sezione "Non cambiato
   deliberatamente", stato del render).
4. In `Piano_Allineamento_Libro.md`, spunta `[x]` la riga di questo deck nella tabella corrispondente
   (Livello 1 o Verifica leggera) — non toccare altre righe.
## 7. Commit (nessun push)

Se il branch corrente è `main` (o comunque il branch di default), crea prima un nuovo branch
topic (es. `book-alignment-<nome-deck>`) prima di committare — non committare direttamente su `main`.
Altrimenti resta sul branch corrente.

Fai **un solo commit** che copre esclusivamente questo allineamento:

1. `git add` solo di: il deck `.qmd`/`.tex`/`.pdf` appena rigenerato, eventuali nuove figure aggiunte
   in `Figures/` per questo deck, e `Piano_Allineamento_Libro.md` (la riga appena spuntata).
   **Non aggiungere altro** — in particolare non toccare file `ENG-*` o altri file non tracciati già
   presenti nella working tree che non fanno parte di questo allineamento (verifica con
   `git status --short` prima di `git add` cosa stai effettivamente includendo).
2. Messaggio nello stile dei commit già presenti nella storia del repo (es. `refactor(<nn>): align
   <argomento> framing/terminology/thresholds with the book`), con un elenco puntato delle modifiche
   principali (stesso livello di detaglio del changelog in `review/`).
3. **Non fare `git push`.** Il push resta una decisione esplicita dell'utente.

Se il piano non è stato applicato (ci si è fermati prima, o l'utente ha scelto di lasciarlo solo come
proposta), non c'è nulla da committare in questo passo.

## 8. Riepilogo finale

Riporta: quale deck è stato allineato (o perché ci si è fermati prima, se non applicato), quante slide
sono state modificate, esito del render, che il tracker è stato aggiornato, l'hash del commit creato
(se fatto), e — se il piano è stato solo proposto senza applicazione — dove si trova il file di piano
in `review/`. Se questo deck era in Livello 1, suggerisci il prossimo deck non spuntato in quella
tabella come possibile prossimo passo.
