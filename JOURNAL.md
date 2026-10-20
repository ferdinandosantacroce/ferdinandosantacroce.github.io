# Journal — ferdinandosantacroce.github.io

---

## 2026-10-20

### Posts worked on
- Importati in italiano e inglese, non ancora pubblicati online: tutti e 13 gli articoli MokaByte, cioè "Sono uno sviluppatore mediocre" (A1), la serie Git completa (G1-G11) e "Working Software Conference 2019" (A2). C5 chiuso.
- Fact-check di questa sessione: G10 aveva i prompt che saltavano da `[3]` a `[6]` e poi a `[24]`, e le opzioni con trattino lungo; G11 partiva da `[27]` e usava `—` per il doppio trattino. Entrambi rinumerati e normalizzati. In G11 corretto anche "detaching HEAD" in "detached HEAD".
- Fact-check: in G4 il contenuto di `file01.txt` era "File 01" ma l'hash `4bc92d9` corrisponde a "File 00", come in G5; allineato a "File 00". In G6 il passo 4 della lista parlava di un file "txt" invece di `file01.txt`. In G7 il comando di creazione di `snack.txt` era duplicato e la numerazione dei prompt è stata resa continua.
- Rilievo per I3: la pagina di serie pagina 5 articoli per volta e li ordina dal più recente, quindi la parte 1 non è in cima.
- Refusi e fact-check fatti articolo per articolo: comandi Git corretti, rimandi numerati morti sostituiti con link stabili, artefatto MOLONGUI rimosso. "Nota 2026" su default branch `main`, `git restore` e `git switch`.

### Hugo/theme/config changes
- Deploy: le pull request costruiscono e non pubblicano più; action aggiornate alle major correnti; gruppo di `concurrency`; cache delle risorse con chiave per run.
- Tema: aggiornamento settimanale, build come cancello prima del commit, commit automatico con `[ci skip]`.
- Config: rimosso `disqusShortname`; `go.mod` e `go.sum` ripuliti dai residui v3; favicon unico in `assets/img`, eliminato il duplicato in `static/`.
- Licenza: nuovo `CONTENT-LICENSE.md` (CC BY-NC-SA 4.0), codice MIT in `LICENSE`, README allineato.
- Archivio: rimossi i placeholder "Under construction" da EN e IT.
- `.idea/` tolto dal repo e aggiunto a `.gitignore`.
- Documentazione: README riscritto, AGENTS.md aggiornato, TODO ridotto a indice, `specs/` marcato come archivio completato.
- Decisioni: introdotti gli ADR in `docs/adr/`, con le sette decisioni prese finora registrate una per file. Il piano ora rimanda agli ADR invece di duplicarli.
- Skill: create `journal` e `adr` in `.opencode/skills/`, e la skill `wrap-up` rimanda alla prima invece di avere un formato suo.
- Serie: `layouts/term.html` elenca le parti per `part` crescente senza paginare, e ogni articolo mostra una barra con tutte le parti per saltare da una puntata all'altra. Il paginatore del tema è disattivato per le serie.
- CSS: `assets/css/custom.css` non veniva caricato da Stack v4, che si aspetta `assets/scss/custom.scss`. Aggiunto `layouts/_partials/head/custom.html` che compila e include il file; rimossa la regola sul font, rimasta dormiente fino a oggi. Tolto `params.assets.customCSS`, inutilizzato in v4.
- Guardrail: `scripts/check-content.sh` verifica coppie bilingui, front matter per sezione, immagini (Markdown e HTML), slug duplicati, continuità delle serie e link interni; genera `docs/contenuti/debito-traduzioni.md`. In CI gira subito dopo il build. Prima esecuzione: una talk senza `description`, corretta.
- Config: `defaultContentLanguage` e `defaultContentLanguageInSubdir` erano scritti dentro `[taxonomies]`, quindi Hugo li leggeva come tassonomie chiamate `en` e `false` e generava `/it/en/` e `/it/false/`. Spostati al livello radice: le due pagine spurie sono sparite.
- Architettura informativa (I1): scritto `docs/architettura-informativa.md` con mappa degli URL, menu a sei voci, footer, hub "Lavora con me", categorie del blog e ordine di implementazione.
- Contatti e igiene (I5): pagina `/contact/` e `/it/contatti/` con mailto, CTA in fondo ai soli articoli, footer con Archivio, Risorse, Cerca e Contatti più la licenza. Aggiunti `static/robots.txt`, `layouts/404.html` con link utili e `assets/img/og-default.png` per le pagine senza copertina. Tolto il falso handle Twitter dalla configurazione OpenGraph.
- Il footer è un override di `footer/footer.html`, non l'hook `footer/custom.html`: quest'ultimo viene reso dopo il contenitore e finiva sotto il minimo di 100vh, staccato dal resto.

### Motore dei contenuti
- M3: `scripts/new-post.sh` crea il bundle bilingue in bozza con front matter completo; opzioni `--en-slug`, `--series`, `--part`. Rifiuta slug non validi e cartelle esistenti.
- `check-content.sh` ora rifiuta anche `title`, `description` e `slug` vuoti o con sole virgolette: lo scaffold nasce con la descrizione vuota e il controllo lo segnala.
- M2: skill `translation` con voce approvata, procedura, glossario, falsi amici, checklist e verifica.
- M5: `docs/piano-editoriale/backlog.md` con le 21 mappe e i 19 articoli del piano, ID da E01 a E47, stato, priorità, fonte e destinazione. Registrata la nota "the savant" come E30.

### Content decisions
- D1: i 13 MokaByte vanno ripubblicati sul blog personale, in tre gruppi editoriali, per non dipendere più dalla magazine.
- D2: parità stretta. Italiano primario, inglese può arrivare dopo, ma il file `index.en.md` esiste dal primo commit.
- D3: grafica sobria, `custom.css` e override mirati; fork del tema solo se necessario.
- D4: il sito è il biglietto da visita professionale, non solo un blog.
- D5: pubblicazione sospesa finché il sito non è pronto. Ogni commit porta `[ci skip]`; si pubblica solo con un commit vuoto dedicato.
- D8 (ADR 0009): un solo blog con categorie tematiche, niente sezioni per tema. Menu a sei voci e Archivio, Risorse e Ricerca nel footer.
- Contatti: solo mailto, niente form finché non c'è traffico.
- Analytics: nessuno per ora, si decide al lancio.
- Backlog editoriale: un file unico, le quattro ondate diventano priorità.

### Open items for next session
- M2, M3 e M5 chiusi. Orizzonte 4 a 3/8.
- Prossimo: M1 (skill `post-research`) e M4 (pipeline note vocali), oppure I3 quando ci sarà materiale per progetti e corsi.
- I2 (inventario carriera) resta rimandato: richiede materiale di Nando.
- Il menu resta a sette voci finché Percorso e Lavora con me non esistono: cambiarlo prima produce 404.
- Il sito online è fermo al deploy del 21 marzo 2026: quando sarà pronto serve un commit di pubblicazione.

---

## 2026-02-26

### Posts worked on
- None this session.

### Hugo/theme/config changes
- Imported and adapted skills from `.claude/skills/` to `.gemini/skills/`.
- Created `.gemini/skills/wrap-up.md`: adapted the session closing workflow for this blog.
- Updated `.gemini/skills/hugo-expert.md`: enhanced with detailed asset pipeline patterns and diagnostic commands for modern Hugo (v0.154+).

### Content decisions
- None this session.

### Skills & tooling
- Created project-specific `wrap-up` skill at `.claude/skills/wrap-up/SKILL.md`.
  - Journal entries go to `JOURNAL.md` at repo root (this file).
  - Blog-specific entry format: posts, Hugo changes, content decisions, open items.
  - Phase 5 corrected: push `origin main` (not `upstream`) to trigger GitHub Pages deploy.
  - Project-local skill overrides the global `~/.claude/skills/wrap-up` — no merging, clean precedence.
- Ported and enhanced Hugo/Wrap-up skills for Gemini CLI in `.gemini/skills/`.

### Open items for next session
- Verify the new skills in a real-world scenario.
- Address pending Italian date formatting and auto-linking articles across languages (from `GEMINI.md`).
