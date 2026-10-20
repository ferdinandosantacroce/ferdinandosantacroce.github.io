# Journal — ferdinandosantacroce.github.io

---

## 2026-10-20

### Posts worked on
- Importati in italiano e inglese, non ancora pubblicati online: "Sono uno sviluppatore mediocre" (A1), la serie Git parti 1, 2 e 3 (G1, G2, G3) e "Working Software Conference 2019" (A2). Cinque articoli su tredici.
- Materiale in attesa: gli altri otto articoli MokaByte in `raw/mokabyte/`, cioè le parti 4-11 della serie Git.
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

### Content decisions
- D1: i 13 MokaByte vanno ripubblicati sul blog personale, in tre gruppi editoriali, per non dipendere più dalla magazine.
- D2: parità stretta. Italiano primario, inglese può arrivare dopo, ma il file `index.en.md` esiste dal primo commit.
- D3: grafica sobria, `custom.css` e override mirati; fork del tema solo se necessario.
- D4: il sito è il biglietto da visita professionale, non solo un blog.
- D5: pubblicazione sospesa finché il sito non è pronto. Ogni commit porta `[ci skip]`; si pubblica solo con un commit vuoto dedicato.

### Open items for next session
- Continuare C5 con le parti 4 e 5 della serie Git (`2017-02-14-git-4.md`, `2017-04-10-git-5.md`), entrambe senza immagini.
- C6 non iniziato: `scripts/check-content.sh` per parità bilingui, front matter, immagini e link interni.
- Il sito online è fermo al deploy del 21 marzo 2026: quando sarà pronto serve un commit di pubblicazione.
- Domande aperte da sciogliere prima di C4: canonical verso MokaByte o self-canonical, aggiornare o ripubblicare fedeli i testi Git del 2016-2018.
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
