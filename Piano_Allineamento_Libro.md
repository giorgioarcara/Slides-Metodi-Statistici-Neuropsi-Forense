# Piano di allineamento delle slide al libro "Oltre i punteggi"

Tracker per l'allineamento progressivo dei deck `.qmd` italiani di questo corso alla terminologia,
al framing e alle soglie usate nel libro **"Oltre i punteggi. Elementi di psicometria e statistica
per la neuropsicologia clinica"** (Giorgio Arcara), repo:
`/Users/giorgioarcara/Documents/Projects/2025-Book-Psychometrics/oltre-i-punteggi-elementi/`.

Usato dal comando [`/aggiorna_slides`](.claude/commands/aggiorna_slides.md): il comando legge questo
file per capire a quale capitolo/sezione del libro corrisponde un deck, e spunta la riga quando il
deck è stato effettivamente allineato e renderizzato con successo.

Le slide in inglese (`ENG-*`) **non** sono in scope per questo tracker.

Aggiornato: 2026-09-14. Stato del libro: solo i capitoli 1–3 sono scritti (il cap. 3 solo in parte);
i capitoli 4–11 sono ancora abbozzati o assenti in `oltre-i-punteggi-elementi/index.qmd`.

## Livello 1 — capitolo del libro scritto, pronto per l'allineamento

| Fatto | Deck | Capitolo libro | File libro | Note |
|---|---|---|---|---|
| [x] | `04c_Affidabilità_formule.qmd` | Cap.2, parte Affidabilità (formule) | `chapters/Validita-Affidabilita.qmd` §Affidabilità (L356–537) | Fatto in sessione precedente (commit `4ef7ff7` + `8af72f4`). Changelog: `review/04c-changelog.md` — usare come modello di riferimento. |
| [x] | `02-Cornice_teorica.qmd` | Cap.1 Misurazione | `chapters/Misurazione.qmd` | Fatto: framing "perché misurare", attribuzione Suppes e Zinnes corretta, caveat procedura/oggettività, riassunto ampliato. Changelog: `review/02-Cornice_teorica-changelog.md` |
| [x] | `04a-Validità_e_affidabilità_teoria.qmd` | Cap.2 Validità e Affidabilità (teoria) | `chapters/Validita-Affidabilita.qmd` §Validità + §Affidabilità (intro) | Fatto: framing Standards, 3 nuove slide (processi risposta, costrutto/criterio, conseguenze testing), Inter-rater agreement, omega/Spearman-Brown, slide Riferimenti. Changelog: `review/04a-Validità_e_affidabilità_teoria-changelog.md` |
| [x] | `04b-Validità_formule.qmd` | Cap.2, parte Validità (formule) | `chapters/Validita-Affidabilita.qmd` §Validità | Fatto: framing Standards, corretta soglia criterio (0.9→0.70-0.80, era disallineata), slide Riferimenti. Changelog: `review/04b-Validità_formule-changelog.md` |
| [x] | `05a_Valutare_deficit_e_danni.qmd` | Cap.3 Dati normativi/deficit/peggioramento (teoria) | `chapters/Dati-Normativi.qmd` | Fatto: verificato — solo Introduzione + §Deficit e peggioramento sono scritti (L1-935); il resto del capitolo è solo titoli vuoti (vedi nota su 05b sotto). Applicati: inevitabilità 5% sani sotto soglia, sottotipi compromissione/declino, indipendenza deficit-danno, citazioni. Changelog: `review/05a_Valutare_deficit_e_danni-changelog.md` |

## Verifica leggera — front matter scritto, contenuto perlopiù organizzativo

| Fatto | Deck | Riferimento libro | Note |
|---|---|---|---|
| [x] | `01-Introduzione.qmd` | Introduzione (front matter) | Verificato: nessun disallineamento terminologico. Applicate 2 migliorie facoltative (citazione Baayen, terza parte metafora auto/motore). Changelog: `review/01-Introduzione-changelog.md` |

## Rimandati — capitolo del libro non ancora scritto (bloccati)

| Deck | Capitolo libro previsto | Stato capitolo |
|---|---|---|
| `03-Scelta_dei_test.qmd` | Cap.8 Scegliere i test neuropsicologici | outline + bozza in `Diario di Sviluppo/APPROFONDIMENTI-TECNICI/PARAGRAPHS/CAP 8...qmd`, non definitivo |
| `05b_Valutare_deficit_e_danni_formule.qmd` | Cap.3, parte formule (percentili, z-score, t-test di Crawford, regressioni, Punteggi Equivalenti) | verificato leggendo `Dati-Normativi.qmd` per intero: da "L'utilità pragmatica delle soglie" in avanti sono **solo titoli di sezione vuoti**, nessuna prosa pubblicata — spostato qui da Livello 1 il 2026-09-14. (Refuso "Sokhal e Rohlf" → Sokal e Rohlf già corretto nel giro di pulizia typo del 2026-09-14.) |
| `06_Identificare condizioni di interesse.qmd` | Cap.4 (gold standard/sensibilità-specificità/ROC) + Cap.9 (Bayes) | da scrivere |
| `07_Simulazione_e_validità_di_performance.qmd` | Cap.7 Valutazioni forensi e simulazione | da scrivere |
| `08_altri_utilizzi_test.qmd` | Cap.5 (cambiamenti nel tempo) + Cap.6 (confronto punteggi) | outline + bozza Cap.5 in `Diario di Sviluppo/...CAP 5...qmd`; Cap.6 da scrivere |
| `09-Scelta_dei_test_valutazione.qmd` | Cap.8 Scegliere i test neuropsicologici | vedi 03 |
| `10-Interpretazione.qmd` | Cap.10 Interpretare i risultati | da scrivere |

Quando uno di questi capitoli verrà scritto nel libro, spostare la riga corrispondente nella tabella
"Livello 1" sopra.

## Esclusi dal tracking

- `00-Template.qmd` — nessun contenuto reale (scaffold Beamer/Quarto)
- `A1-Contenuti_corso.qmd` — indice/sillabo, non contenuto da allineare

## Checklist delle "mosse di allineamento" (ricavata da 04c, commit `8af72f4`)

Il comando `/aggiorna_slides` valuta, per ogni slide del deck target, se si applica una o più di
queste mosse (non tutte si applicano sempre — dipende dal contenuto del capitolo del libro):

1. **Swap di framing/citazione guida** — sostituire una classificazione/framing datata con quella
   usata dal libro (es. principio unitario invece di tassonomia, standard di riferimento citato).
2. **Tabella soglie/coefficienti** — aggiungere/aggiornare tabelle di interpretazione numerica con le
   fonti citate dal libro.
3. **Rinomina terminologia** — titoli di sezione/slide allineati al lessico del libro (es. "Affidabilità
   inter-rater" → "Inter-rater agreement").
4. **Definizioni riprese dal libro** — sostituire definizioni informali con la formulazione del libro.
5. **Vocabolario tecnico nuovo** — introdurre termini che il libro usa e la slide non nominava.
6. **Specifica di modello statistico precisa** — dove il libro raccomanda un modello/metodo specifico
   (es. tipo di ICC), sostituire un rimando generico con la specifica esatta e le citazioni a supporto.
7. **"Perché" prima del "cosa"** — anteporre la motivazione/mecccanismo alla soluzione, se il libro lo fa.
8. **Caveat/limiti** — aggiungere le avvertenze che il libro sottolinea (assunzioni, quando non si applica).
9. **Soglie per-metodo puntuali** — non solo una tabella riassuntiva, ma soglie al punto d'uso per ogni
   metodo trattato.
10. **Slide "Riferimenti" finale** — aggiungere/aggiornare l'elenco delle fonti citate in coda al deck.
11. **Glossari delle formule** — tradurre/compattare i glossari dei simboli in italiano.
12. **Invariante**: formule e ordine delle slide **non cambiano**, salvo necessità dichiarata — l'allineamento
    riguarda framing/terminologia/soglie/riferimenti, non la matematica sottostante né la struttura del deck.

## Artefatti di revisione

Ogni allineamento produce, in `review/<nome-deck>-plan.md` (proposta, prima della conferma) e poi
`review/<nome-deck>-changelog.md` (dopo l'applicazione) — cartella gitignored, non committata.
Modello di riferimento: `review/04c-changelog.md`.
