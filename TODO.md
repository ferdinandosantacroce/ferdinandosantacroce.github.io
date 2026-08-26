# TODO

Piano di pulizia e migrazione del blog (Hugo + Stack). Le fasi sono ordinate per
sicurezza: Fase 2 (tema v4) prima di Fase 3 (QA visiva), così la revisione non
viene sprecata sul tema vecchio.

## Fase 0 — Baseline
- [x] 0.1 realineare `main` con `origin/main` → merge `-s ours` (mantenuto OpenCode, annullato Crush). Push futuro sarà fast-forward.
- [x] 0.2 versioni registrate: Hugo locale 0.162.1 / CI 0.140.2; Go locale 1.26.6 / CI ^1.23.0; Stack v3.34.2 (vedi AGENTS.md per i pin CI).
- [x] 0.3 build di baseline `hugo --minify --gc` → OK (exit 0; warning deprecation da tema v3, risolti in Fase 2).

## Fase di migrazione (Fase 1) — verifica completezza
- [x] 1.1 mapping old→new: talks 1:1 (30=30); pagine statiche presenti; asset 36/37 migrati (1 rinominato).
- [x] 1.2 pagine statiche OK: about/archives/search/works (en+it); resources è section con oop/ + tdd/ (en+it).
- [x] 1.3 asset: 36/37 presenti (1 rinominato); 15 orfani in `assets/img`+`static` (da pulire in Fase 3).
- [x] 1.4 post mancante `git-essentials-on-book-authority` migrato (en+it, draft).
- [x] 1.5 `elastic-pair-programming` completo (cover.jpg + dilbert png + en/it).
- [x] 1.6 30 talks verificate 1:1 col vecchio `talks.md` (0 mancanti, 0 extra).
- [x] 1.7 list-pages Jekyll (archive/categories/tags) gestite dal tema (archives/search esistono; categories/tags generate).
- [ ] 1.8 `_languages.toml` rimosso; **da decidere**: `origin/dev` è uno branch obsoleto pre-cleanup con `talks_archive_backup` ridondante → proporre cancellazione (serve OK Nando + push).

## Fase 2 — Versioni e tema v4
- [x] 2.1 Go: `go.mod` 1.17→1.27 + CI `^1.23`→`1.27.x`
- [x] 2.2 Hugo CI 0.140.2→0.165.0 extended
- [x] 2.3 verifica build antes del tema
- [x] 2.4 `module.toml` → `/v4` + `hugo mod tidy`
- [x] 2.5 migrare i parametri di config v4
- [x] 2.6 spostare gli override di layout nei nuovi path
- [x] 2.7 sistemare la build
- [x] 2.8 `update-theme.yml` `/v3`→`/v4`
- [x] 2.9 aggiornare AGENTS.md + skill `hugo-expert`

## Fase 3 — Pubblicazione e QA
- [ ] 3.1 audit dei 70 file `draft: true` → decidere cosa pubblicare
- [ ] 3.2 audit parità bilingue
- [ ] 3.3 audit link rotti
- [ ] 3.4 audit immagini
- [ ] 3.5 revisione visiva EN+IT (home, post, talks, works, resources, about, archives, search, 404)
- [ ] 3.6 fix dalla revisione in commit piccoli
- [ ] 3.7 legacy: date in formato italiano + auto-link tra lingue
- [ ] 3.8 decisione finale → rimuovere i draft approvati → push `main` → deploy

## Fase 4 — Skills/agent
- [ ] 4.1 skill `post-research` (fonti + outline, NON la prosa)
- [ ] 4.2 skill `bilingual-parity-check`
- [ ] 4.3 agent di ricerca in `.opencode/agents/`
- [ ] 4.4 aggiornare gli skill esistenti

## Fase 5 — Pipeline dei contenuti
- [ ] 5.1 definire dove sta il materiale non pubblicato (TBD)
- [ ] 5.2 inventario materiale → idee di articoli
- [ ] 5.3 `backlog.md` con priorità
- [ ] 5.4 research pack + outline per articolo (la prosa la scrive Nando)

## Legacy (da integrare nelle fasi sopra)
- [ ] vedere come impostare le date in formato italiano per la lingua italiana
- [ ] impostare l'auto-link di articoli in diverse lingue
