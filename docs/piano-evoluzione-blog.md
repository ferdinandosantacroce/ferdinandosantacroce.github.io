# Piano di evoluzione del blog ferdinandosantacroce.it

**Repo:** `ferdinandosantacroce.github.io`
**Creato:** 2026-10-20
**Stato:** piano approvato nelle linee guida, da eseguire un passo alla volta
**Documento interno:** non viene pubblicato sul sito, vive solo nel repository

**Come si usa:** si parte dall'Orizzonte 1 in ordine. Ogni task ha un ID, i file toccati e un criterio di completamento. Spuntare la casella solo quando il criterio è verificato. Le decisioni prese stanno nella sezione 2 e non si rimettono in discussione senza motivo.

---

## 1. Contesto verificato (audit del 2026-10-20)

Fatti misurati sul repo, non impressioni.

- Build di produzione pulita: `hugo --minify --gc` → 154 pagine EN, 157 IT, 122 immagini processate, zero warning, 487 ms. Hugo locale 0.165.0 extended, Go 1.27.2, Stack v4.0.3.
- Contenuti pubblicati: **1 post** (`content/post/elastic-pair-programming`), 30 talk in leaf bundle, 8 works, 4 pagine statiche (about, archives, search, resources), 2 risorse (oop, tdd).
- Parità bilingue EN/IT: **100%**. L'unico file spaiato è `content/_index.it.md`, normale perché `content/_index.md` è la versione EN di default.
- Nessun `draft: true` dentro `content/`.
- Materiale non pubblicato: `raw/mokabyte/` con **13 file** (11 parti della serie "Git, the stupid content tracker" + "Lo sviluppatore mediocre" + "Working Software Conf 19"), 2.890 righe, solo italiano, 32 immagini in `raw/mokabyte/images/`.
- Documenti editoriali: `docs/piano-editoriale/` (piano editoriale, mappa delle idee importate, registro note vocali) più la nota vocale `articolo-the-savant.md`, ancora non tracciata.
- Git: `main` avanti 1 (documenti editoriali, `f7eaa9c`) e indietro 1 (`49cc1bd CI: Update theme`). Non tracciati: `.serena/` e `docs/piano-editoriale/articolo-the-savant.md`.
- Migrazione Jekyll: **finita**. Il repo vecchio (`~/Source/personal/GitHub/jesuswasrasta/jesuswasrasta.github.io`) ha un solo post in `_posts/`, già migrato; `_pages/talks.md` è stato spacchettato in 30 bundle; `_resources/` e `works.md` sono migrati; l'unico post in `_archive/` è stato eliminato per scelta di Nando (`389b388`).
- Config leftover: `disqusShortname = "hugo-theme-stack"` con commenti disabilitati; `go.sum` contiene ancora le righe v3; `go.mod` marca Stack v4 come `// indirect`.
- `content/page/archives/index.{en,it}.md` contengono ancora "Under construction 👨‍💻".
- Licenza incoerente: `LICENSE` è MIT, il README dice contenuti CC BY-NC 4.0, il sito mostra CC BY-NC-SA 4.0.
- `custom.css` contiene 3 righe (solo font-family per le emoji). Layout custom: `talks/list.html`, `works/list.html`, `_internal/google_analytics.html` (vuoto).
- `README.md` parla ancora di Stack v3 e non menziona mise, `[ci skip]`, i permalink `/p/:slug/`, le sezioni talk/works/resources né `docs/`.
- `JOURNAL.md` è fermo al 2026-02-26 e cita `.claude/skills/` e `.gemini/skills/`, rimossi in `8042fec`.
- `specs/000-003`: la 003 è completata nei task ma è ancora `Status: Draft`, e il `plan.md` ha i placeholder del template e cita Stack v3.
- Bug nel deploy: `deploy.yml` parte anche su `pull_request` verso `main` e lo step di deploy non ha condizione, quindi una PR dallo stesso repo pubblicherebbe su `gh-pages`, cioè in produzione.
- Rischio manutenzione: il cron notturno aggiorna Stack v4 (pre-1.0) e il commit `CI: Update theme` non ha `[ci skip]`, quindi ogni aggiornamento del tema pubblica automaticamente in produzione senza build di verifica.

### 1.1 Documenti editoriali di riferimento

Il piano editoriale in `docs/piano-editoriale/` è la fonte per **cosa** scrivere e con quale voce. Questo documento è la fonte per **come** pubblicarlo e in che ordine tecnico. Quando i due sembrano divergere vince il documento che copre il tema: le idee e la voce stanno nel piano editoriale, le scelte tecniche e l'ordine di esecuzione stanno qui.

| Documento | Contenuto | Dove entra in questo piano |
| --- | --- | --- |
| `piano-editoriale-ferdinando-santacroce.md` | tesi editoriale, struttura consigliata delle sezioni, 19 articoli in cinque fasi, informazioni da confermare, architettura editoriale, protocollo note vocali | I1, I2, I4, M1, M4, M5 |
| `appunti-importati-e-mappa-articoli.md` | 21 mappe di idee con potenziale, priorità in quattro ondate, elenco del materiale che non è un articolo | M5 |
| `registro-note-vocali.md` | scheda per nota, domande aperte Q01-Q05, incoerenze C01, contenuti potenziali P01-P04 | I2, M4 |
| `articolo-the-savant.md` | nota vocale del 2026-10-02 sulla metafora del savant applicata ai modelli AI | candidato articolo, da registrare in M4 e M5 |

Regole che ne derivano:

- Nessun articolo nuovo parte se non è nel backlog di M5 con fonte, destinazione editoriale e stato.
- Le quattro ondate dell'appunti sono la priorità di partenza dopo il corpus MokaByte: prima la voce personale, poi la competenza tecnica, poi comunità e organizzazioni, infine i temi contemporanei.
- Il format in sette punti del piano editoriale (§3) diventa il modello di outline per la skill `post-research` (M1).
- Le sezioni consigliate dal piano editoriale (Racconti, Software, Team, Comunità, Talk e libri, Risorse) e quelle del personal branding (Percorso, Progetti, Corsi, Workshop, Servizi) sono due proposte distinte: vanno riconciliate in I1, non sommate.
- Le "informazioni da confermare" del §5 sono prerequisito di I2 e I4: senza quelle risposte About, Percorso e Servizi restano generici.
- Il materiale della wiki che non è un articolo (board, value proposition, appunti tecnici) resta fuori dal blog; nessuna credenziale va copiata nei documenti del repo.

---

## 2. Decisioni prese

Le decisioni sono registrate come ADR in `docs/adr/`, ognuno con contesto, decisione e conseguenze. Qui resta l'indice, così il piano si legge senza duplicare il ragionamento.

| ID | Decisione | ADR |
| --- | --- | --- |
| D1 | Ripubblicare i 13 articoli MokaByte, self-canonical, testo originale con la "Nota 2026" | [0002](adr/0002-ripubblicare-gli-articoli-mokabyte.md) |
| D2 | Parità bilingue stretta, con debito di traduzione tracciato | [0003](adr/0003-parita-bilingue-stretta.md) |
| D3 | Tema Stack con personalizzazione minima, fork solo se necessario | [0006](adr/0006-tema-stack-personalizzazione-minima.md) |
| D4 | Il sito è un hub professionale, non solo un blog | [0007](adr/0007-sito-come-hub-professionale.md) |
| D5 | Pubblicazione sospesa, rilascio esplicito e `[ci skip]` su ogni commit | [0005](adr/0005-pubblicazione-sospesa.md) |
| D6 | Inglese alla radice, italiano sotto `/it/` | [0004](adr/0004-inglese-alla-radice.md) |
| D7 | Tassonomia `series` per gli articoli in più parti | [0008](adr/0008-tassonomia-series.md) |
| D8 | Blog unico con categorie tematiche, menu a sei voci, secondarie nel footer | [0009](adr/0009-blog-unico-e-menu-professionale.md) |

### 2.1 Cosa significa "parità stretta" (definizione operativa)

Parità stretta non significa "due file sempre pubblicati nello stesso istante". Significa tre cose verificabili:

1. **Struttura:** ogni bundle di contenuto ha sempre i due file, `index.it.md` e `index.en.md`. Non esiste un bundle con un solo file, mai, nemmeno in bozza. Così nessuna traduzione viene dimenticata.
2. **Pubblicazione:** una lingua può essere pubblicata mentre l'altra è ancora in lavorazione, con due meccanismi possibili:
   - **Opzione A, default:** il file EN esiste ma è `draft: true`. La pagina IT mostra un badge "traduzione inglese in arrivo"; il sito EN non elenca ancora l'articolo. Semplice, nessun contenuto finto, ma il lettore inglese non trova nulla.
   - **Opzione B, per gli articoli importanti:** il file EN viene pubblicato come scheda ponte, con titolo, abstract in inglese e link all'originale italiano. Più lavoro editoriale, ma il sito EN resta completo e indicizzabile.
3. **Debito tracciato:** ogni coppia con un lato in bozza finisce in un report generato (`docs/contenuti/debito-traduzioni.md`) e in CI. Il debito è visibile, ha una data, e non può crescere in silenzio.

La differenza rispetto a una parità "morbida" è che qui la coppia di file è obbligatoria e il debito è contato, mentre nella parità morbida le traduzioni semplicemente non esistono e nessuno se ne accorge. Proposta: Opzione A per tutto il corpus MokaByte, Opzione B per gli articoli che devono posizionarsi anche in inglese.

Costo dichiarato: 2.890 righe di italiano. Tradurle tutte significa un lavoro stimabile in 25-35 ore uomo, molto meno con una prima traduzione assistita e una revisione umana mirata su voce e termini tecnici.

---

## 3. Orizzonte 1, fondamenta e igiene (settimane 1-2)

Obiettivo: repo coerente, documenti veri, deploy sicuro, zero task fantasma. Nessun contenuto nuovo in questa fase.

### F1. Allineamento git (fatto 2026-10-20)
- [x] `git fetch origin && git rebase origin/main`, risolto senza conflitti; `go.sum` ora contiene solo v4.
- [x] Committato `docs/piano-editoriale/articolo-the-savant.md` (`de3a576`).
- [x] `.serena/project.yml` e `.serena/.gitignore` tracciati, `project.local.yml` e `cache` restano ignorati (`88bf853`).
- **Done:** `git status` pulito, storia lineare sopra `49cc1bd`, build verde.

### F2. Deploy sicuro (fatto 2026-10-20)
File: `.github/workflows/deploy.yml`
- [x] Deploy condizionato a `github.event_name != 'pull_request'`, così le PR costruiscono e basta. Aggiunti `workflow_dispatch` e un gruppo di `concurrency` per non sovrapporre due deploy.
- [x] Action aggiornate: `actions/checkout@v4`, `actions/cache@v4` (chiave per run più `restore-keys`), `actions/setup-go@v5`, `peaceiris/actions-hugo@v3`.
- [x] Validato con `actionlint`, nessun errore.
- **Done:** una PR esegue solo il build; un push su `main` esegue build e deploy. Verifica reale al primo push.

### F3. Build gate sull'aggiornamento tema (fatto 2026-10-20)
File: `.github/workflows/update-theme.yml`
- [x] Dopo `hugo mod get -u` e `hugo mod tidy`, il workflow esegue `hugo --minify --gc`; se il build fallisce il job si ferma e non committa nulla.
- [x] Cadenza settimanale (lunedì 00:00 UTC) e commit automatico con `[ci skip]`, quindi l'aggiornamento non pubblica da solo.
- [x] Action aggiornate: `checkout@v4`, `setup-go@v5`, `actions-hugo@v3`, `git-auto-commit-action@v5`. Validato con `actionlint`.
- **Done:** un tema rotto non arriva su `main`; un tema sano arriva su `main` ma non in produzione.

### F4. Pulizia configurazione (fatto 2026-10-20)
File: `config/_default/config.toml`, `go.mod`, `go.sum`, `static/`
- [x] Rimosso `disqusShortname`, residuo dello starter: i commenti sono disabilitati.
- [x] `hugo mod tidy` eseguito; `go.sum` contiene solo v4 e il `// indirect` è stato tolto a mano da `go.mod` (Hugo non lo rimuove).
- [x] Favicon: unica fonte `assets/img/favicon.ico`, referenziata da `params.favicon` e servita come `/img/favicon.ico`. Rimosso `static/favicon.png`, che era un duplicato orfano.
- Nota: il favicon è un 16x16. Il set completo (SVG, 32, 180, 512) richiede un sorgente vettoriale o almeno un'immagine più grande, quindi arriva con l'Orizzonte grafico, non qui.
- **Done:** nessun riferimento a v3, build verde, un solo favicon servito.

### F5. Chiudere i placeholder (fatto 2026-10-20)
File: `content/page/archives/index.en.md`, `content/page/archives/index.it.md`
- [x] "Under construction" sostituito da una riga che spiega cosa contiene l'archivio, in EN e IT.
- **Done:** `grep -ri "under construction" content/` non restituisce nulla.

### F6. Licenza unica (fatto 2026-10-20)
File: `LICENSE`, `CONTENT-LICENSE.md`, `README.md`, `config/_default/params.toml`
- [x] Codice MIT in `LICENSE`, contenuti CC BY-NC-SA 4.0 nel nuovo `CONTENT-LICENSE.md`, con nota sui materiali di terzi (copertine, loghi, screenshot).
- [x] README allineato e collegato ai due file; il sito già mostrava CC BY-NC-SA 4.0.
- Nota: se in futuro preferisci CC BY-NC senza ShareAlike, cambiano tre punti: `CONTENT-LICENSE.md`, README e `params.toml`.
- **Done:** i tre punti dicono la stessa cosa.

### F7. Riscrivere README (fatto 2026-10-20)
File: `README.md`
- [x] Struttura nuova: stack e versioni, setup con `mise`, comandi, mappa del repository, regole sui contenuti, front matter per tipo, policy bilingue, pubblicazione con `[ci skip]`, documentazione, licenza.
- [x] Corretti i riferimenti a Stack v3 e aggiunti i permalink, le sezioni talks/works/resources e i documenti interni.
- **Done:** una persona nuova pubblica un post senza fare domande.

### F8. Aggiornare AGENTS.md (fatto 2026-10-20)
File: `AGENTS.md`
- [x] Aggiunti `.opencode/skills/` (hugo-expert, wrap-up), il map di `docs/`, `raw/` come materiale sorgente, `specs/` come archivio.
- [x] Corretto lo stato reale e la mappa dei contenuti: talks e works sono section di primo livello, resources è un branch bundle.
- [x] Aggiunte la parità stretta e la regola D5 sulla pubblicazione sospesa. Il comando di verifica contenuti arriverà con C6.
- **Done:** nessuna affermazione falsa, nessun percorso inesistente, nessun documento chiave mancante.

### F9. TODO e specs (fatto 2026-10-20)
File: `TODO.md`, `specs/`, `.gitignore`
- [x] `TODO.md` ridotto a indice: rimanda al piano e tiene solo quattro voci fuori perimetro.
- [x] `specs/README.md` creato; le quattro spec marcate `Status: Completed`; corretto l'intestazione placeholder di `003/plan.md` con nota storica su Stack v3.
- [x] `.idea/` tolto dal repo e aggiunto a `.gitignore`, insieme al vecchio `.iml` col nome `jesuswasrasta`.
- **Done:** nessun task aperto che sia già stato fatto altrove.

### F10. Journal (fatto 2026-10-20)
File: `JOURNAL.md`, `.opencode/skills/wrap-up/SKILL.md`
- [x] Voce 2026-10-20 con audit, decisioni D1-D5, modifiche e prossimi passi.
- [x] Corretta la skill `wrap-up`, che chiedeva di pushare per pubblicare: ora rispetta la sospensione e il commit di pubblicazione esplicito.
- **Done:** l'ultima voce descrive lo stato attuale e non cita cartelle inesistenti.

---

## 4. Orizzonte 2, i MokaByte e la macchina bilingue (settimane 2-6)

Obiettivo: portare online il corpus MokaByte, definire il workflow di traduzione, rendere la parità misurabile. Questa fase produce contenuti veri, non infrastruttura.

### C1. Inventario e mappatura (bozza pronta 2026-10-20)
- [x] Tabella di mappatura dei 13 file: slug, titolo IT e EN, data, categoria, tag, `series`, `part`, immagini. Salvata in `docs/contenuti/mappatura-mokabyte.md`.
- [x] Verificate le 32 immagini: tutte referenziate, tutte presenti, nessuna orfana, dimensioni e pesi accettabili.
- [x] Approvazione delle decisioni editoriali della sezione 5 del documento, che sono il vero contenuto di C2.
- **Done:** tabella approvata, salvata in `docs/contenuti/mappatura-mokabyte.md`.

Raggruppamento confermato: serie Git in 11 parti, "Sono uno sviluppatore mediocre", "Working Software Conference 2019".

### C2. Decisioni editoriali sulla ripubblicazione (fatto 2026-10-20)
- [x] Canonical: self-canonical con nota "originariamente pubblicato su Mokabyte il …" e link all'originale.
- [x] Testo: ripubblicare l'originale, con la "Nota 2026" dove qualcosa è cambiato. Le schermate del 2016 restano, con la nota che lo dice.
- [x] Date originali più `lastmod`; nessuna copertina nuova per ora; categoria `Software` e tag coerenti con il vocabolario esistente.
- [x] Tassonomia `series` attivata in `config/_default/config.toml` e verificata con un post di prova.
- **Done:** decisioni registrate in `docs/contenuti/mappatura-mokabyte.md`, sezione 6, e pronte da applicare in C5.

### C3. Schema front matter esteso (fatto 2026-10-20)
File: `docs/contenuti/front-matter.md`, `README.md`, `AGENTS.md`
- [x] Documentati i campi: `title`, `description`, `slug`, `date`, `lastmod`, `image`, `categories`, `tags`, `series`, `part`, `source`, `source_date`, con esempi per post, serie, talk, works e pagine.
- [x] Nessun `translation_status`: lo stato della traduzione si legge da `draft: true`.
- [x] README e AGENTS.md rimandano allo schema.
- **Done:** schema scritto una volta e usato da tutti i nuovi contenuti.

### C4. Pilota end-to-end (fatto 2026-10-20)
- [x] Articolo campione: A1, "Sono uno sviluppatore mediocre", senza tempo e senza screenshot da aggiornare.
- [x] Bundle creato, cinque immagini spostate e rinominate, front matter completo, nota sulla fonte, refusi corretti, rimandi a note inesistenti rimossi.
- [x] Traduzione inglese completa, pubblicata come `index.en.md`.
- [x] Tempi misurati: 4.015 parole in italiano, 4.117 in inglese. Il corpus MokaByte completo è di 30.360 parole.
- **Done:** articolo online in due lingue, tempi misurati, problema del flusso individuato.

Il pilota ha misurato una cosa che cambia il piano: tradurre tutto il corpus significa circa 30.000 parole. A 2.000 parole a settimana sono tre-quattro mesi di lavoro solo per l'inglese. Le opzioni sono tre, da decidere prima di C5: tradurre tutto con calma e accettare il debito nel frattempo, tradurre solo gli articoli strategici con la scheda ponte in inglese, oppure ripensare la regola di parità stretta per il solo corpus storico.

### C5. Pubblicazione del corpus
- [x] Pubblicare i restanti 8 articoli con la cadenza concordata (proposta: 2 a settimana per la serie Git, così la serie resta leggibile e il blog prende corpo in un mese).
- [x] Verificare che la pagina di serie (`/series/<nome>/`) elenchi tutte le parti nell'ordine giusto. `layouts/term.html` ordina per `part` e non pagina; ogni articolo ha la barra di navigazione della serie. Verificato con le 11 parti.
- **Done:** 13 articoli online, 26 file, parità completa o debito dichiarato.

**Chiuso 2026-10-20:** tutti e 13 gli articoli sono in `content/post/`, ognuno con `index.it.md` e `index.en.md` completi. La serie Git ha 11 parti, la pagina `/series/git-the-stupid-content-tracker/` le elenca da 1 a 11 in ordine e ogni articolo mostra la barra con tutte le parti. Restano da fare la verifica automatica e il debito traduzioni (C6), che oggi è zero.

### C6. Guardrail di parità e qualità
File: `scripts/check-content.sh` (o equivalente Go), `.github/workflows/deploy.yml`
- [x] Lo script verifica: coppia `index.it.md` e `index.en.md` presente in ogni bundle; front matter minimo; immagini referenziate esistenti; link interni rotti; elenco delle coppie con un lato in `draft`.
- [x] Genera `docs/contenuti/debito-traduzioni.md`.
- [x] Integrarlo nel workflow, subito dopo il build (non prima: i link interni e le immagini si verificano su `public/`).
- **Done:** una coppia mancante fa fallire la CI, il debito è leggibile in un file.
- **Fatto 2026-10-20:** lo script copre anche slug duplicati per lingua e continuità delle serie. Il report è rigenerato a ogni esecuzione ed è vuoto. Prima esecuzione: trovata una talk senza `description`, corretta.

---

## 5. Orizzonte 3, architettura per il personal branding (mesi 2-3)

Obiettivo: il sito smette di essere solo un blog e diventa biglietto da visita professionale. Richiede una decisione di architettura prima di scrivere contenuti.

### I1. Architettura informativa e URL
- [x] Riconciliare le sezioni del piano editoriale con quelle del personal branding: un solo blog con categorie tematiche, le sezioni professionali come pagine (ADR 0009).
- [x] Definire le sezioni: Home, About, Percorso, Lavora con me (hub), Progetti, Corsi, Workshop, Servizi, Blog, Talk, Works, Risorse, Archivio, Cerca, Contatti.
- [x] Mappare su Hugo: pagine in `content/page/`, nuove sezioni `projects`, `courses`, `workshops`; tabella completa in `docs/architettura-informativa.md`.
- [x] Menu: sei voci, secondarie nel footer. Progettati la pagina hub e il footer nel documento di architettura (ADR 0009).
- **Done:** albero degli URL e menu approvati, scritti in `docs/architettura-informativa.md`.

### I2. Inventario della carriera
- [ ] Compilare l'inventario interno: aziende, periodi, ruoli, contesti, livello di visibilità (pubblico, anonimo, riservato). Rispondere a Q01-Q05 del registro note vocali.
- [ ] Usare le "informazioni da confermare" del §5 del piano editoriale come checklist: ruolo e azienda attuali, rapporti con Agile Reloaded, Intré e Madisoft, ruolo in Working Software Conference e Italian Agile Movement, formulazione del percorso dal 1998.
- [ ] Usare il §10 del piano editoriale come elenco dei quattro lavori continuativi: inventario carriera, schede progetti, catalogo corsi e workshop, curriculum narrativo.
- [ ] Non pubblicare nulla finché l'inventario non è completo: senza dati, le pagine diventano generiche.
- **Done:** inventario completo, anche solo interno.

### I3. Template delle sezioni professionali
- [ ] `layouts/projects/list.html` con griglia di schede, e single con i campi: periodo, settore, ruolo, problema, contributo, risultato, apprendimento, visibilità.
- [ ] `layouts/courses/list.html` con catalogo: titolo, destinatari, durata, formato, prerequisiti, obiettivi, programma.
- [x] Pagina di serie: `layouts/term.html` ordina per `part` crescente, mostra tutte le parti e non pagina. Il paginatore del tema è disattivato per le serie in `layouts/_partials/helper/paginator.html`. Ogni articolo mostra una barra con tutte le parti (`layouts/_partials/article/components/series-nav.html`), così si salta da una puntata all'altra senza tornare all'indice.
- **Done:** un progetto e un corso pubblicati come esempio funzionante.

### I4. Pagine pilota
- [ ] About riscritta in chiave branding, con link a Percorso, Progetti e Contatti (oggi è buona ma isolata).
- [ ] Percorso: pagina cronologica narrativa.
- [ ] Servizi: come si avvia una collaborazione, cosa serve per un primo confronto, cosa non rientra nel modo di lavorare.
- **Done:** tre pagine online IT+EN.

### I5. Contatti e call to action
- [x] Pagina contatti: `/contact/` e `/it/contatti/`, solo mailto (decisione Q7).
- [x] CTA in fondo agli articoli e link Contatti nel footer di ogni pagina.
- **Done:** da ogni pagina si arriva a un contatto in due click.
- **Fatto 2026-10-20:** il footer contiene Archivio, Risorse, Cerca e Contatti, più la licenza. Il contatto è raggiungibile da qualunque pagina in un click. Aggiunti anche `robots.txt`, 404 personalizzata e immagine OpenGraph di default per le pagine senza copertina.

---

## 6. Orizzonte 4, motore dei contenuti e crescita (mesi 3-6)

Obiettivo: pubblicare con continuità senza ricominciare da zero ogni volta.

Il lavoro su questo orizzonte nasce dal feedback raccolto in `docs/workflow-feedback.md`: lì finiscono gli attriti osservati, che poi diventano skill, agenti o script in CI.

### M1. Skill `post-research`
- [ ] Creare `.opencode/skills/post-research/SKILL.md`: raccoglie fonti, verifica fatti, produce outline e domande. Non scrive la prosa, che resta di Nando.
- [ ] Alimentarla con il format in sette punti del piano editoriale e con le osservazioni di `docs/workflow-feedback.md`.

### M2. Skill di traduzione e parità
- [ ] `translation-review`: checklist per revisionare una traduzione EN (voce, idiomi, termini tecnici, esempi culturali).
- [ ] Estendere `check-content` con il controllo parità già previsto in C6.

### M3. Scaffold nuovo post
- [ ] Comando o script `new-post <slug>` che crea il bundle con `index.it.md` e `index.en.md`, front matter completo, cartella immagini.

### M4. Pipeline note vocali
- [ ] Trascrizione, scheda nel registro, estrazione fatti e interpretazioni, outline, bozza.

### M5. Backlog editoriale operativo
- [ ] Trasformare le 21 mappe di `docs/piano-editoriale/appunti-importati-e-mappa-articoli.md` e i 19 articoli del piano editoriale in un unico backlog con ID, titolo, gruppo, fonte, destinazione (post, serie, pagina, scheda progetto, corso), priorità e stato.
- [ ] Registrare la nota "the savant" come candidato articolo, con il suo angolo: la metafora del savant applicata ai modelli AI, alternativa al "genio" di Kent Beck.
- [ ] Prima ondata proposta, coerente con l'appunti: "Padroneggiare uno strumento significa sapere quando non usarlo", "Il medico da campo e il cardiochirurgo", "Il geometra del software", "Io porto le brioches".
- [ ] Segnare esplicitamente le idee da verificare, per esempio "Waterfall non significa quello che molti pensano", "I want XP back" e "RAL commisurata all'esperienza", per non pubblicarle senza fonti e senza una decisione di tono.
- **Done:** `docs/piano-editoriale/backlog.md` esiste, con una sola priorità leggibile.

### M6. Misurazione
- [ ] Decidere analytics privacy-friendly (Plausible, GoatCounter o Umami) oppure nessuna analytics.
- [ ] Search Console, sitemap, RSS già presenti: verificare e documentare.

### M7. Distribuzione
- [ ] Cross-posting su Mastodon e LinkedIn con link all'articolo, non testo integrale, per non disperdere il segnale.

### M8. Manutenzione
- [ ] Checklist mensile: link rotti, aggiornamenti tema, immagini pesanti, parità, Lighthouse.

---

## 7. Idee future, non pianificate

- Newsletter (solo se c'è cadenza stabile).
- Podcast o versione audio degli articoli.
- Ricerca full-text più ricca.
- Commenti (oggi disabilitati; da riaprire solo con una decisione esplicita su moderazione).
- Tema custom o fork, solo se `custom.css` e gli override non bastano più.

---

## 8. Domande aperte

| ID | Domanda | Stato o proposta |
| --- | --- | --- |
| Q1 | "Tre articoli" MokaByte | Risolta: 13 articoli in tre gruppi |
| Q2 | Canonical verso Mokabyte o self-canonical? | Risolta: self-canonical con nota e link all'originale (ADR 0002) |
| Q3 | Ripubblicare fedele o aggiornare i testi Git del 2016-2018? | Risolta: testo originale più "Nota 2026" (ADR 0002) |
| Q4 | Cadenza di pubblicazione? | Risolta: il corpus è già importato, la cadenza riguarda solo il rilascio |
| Q5 | Come produrre le traduzioni EN? | Risolta: prima stesura assistita, revisione umana, mai pubblicare senza revisione |
| Q6 | Analytics? | Risolta 2026-10-20: nessuno per ora, si decide al lancio |
| Q7 | Form contatti o solo mailto? | Risolta 2026-10-20: solo mailto, form statico solo se arriva traffico |
| Q8 | Gerarchia del menu? | Risolta 2026-10-20: sei voci principali, Archivio, Risorse e Ricerca nel footer (ADR 0009) |
| Q9 | Come si riconciliano le sezioni editoriali con quelle professionali? | Risolta 2026-10-20: un blog unico con categorie tematiche, sezioni professionali come pagine (ADR 0009) |
| Q10 | Il backlog di M5 sostituisce le quattro ondate dell'appunti? | Risolta 2026-10-20: backlog unico, le ondate diventano priorità |

---

## 9. Stato di avanzamento

| Orizzonte | Task totali | Completati |
| --- | --- | --- |
| 1, fondamenta | 10 | 10 |
| 2, contenuti MokaByte | 6 | 6 |
| 3, personal branding | 5 | 2 |
| 4, motore | 8 | 0 |

**Stato al 2026-10-20:** Orizzonti 1 e 2 chiusi. Tutti e 13 gli articoli MokaByte sono in `content/`, bilingui, con la serie Git ordinata e navigabile. Il controllo contenuti gira in CI e il debito traduzioni è a zero. Prossimo passo: Orizzonte 3, da I1.
