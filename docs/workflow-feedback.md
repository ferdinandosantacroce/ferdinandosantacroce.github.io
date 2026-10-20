# Feedback di workflow, candidati skill e agenti

**Documento interno.** Raccoglie l'attrito osservato lavorando davvero su questo repository, per trasformarlo in skill e agenti OpenCode quando il pattern è chiaro. Non è una lista di desideri: ogni voce deve avere un'evidenza e un costo.

## Come si usa

- Durante il lavoro si annota solo l'attrito, senza fermarsi a progettare la soluzione.
- A fine sessione o a fine orizzonte si guarda il file e si decide cosa diventa una skill, cosa un agente, cosa uno script in CI, cosa niente.
- Una voce diventa una skill quando è una procedura ripetibile con passi stabili. Diventa un agente quando serve un contesto separato e un contratto di output, per esempio una revisione in sola lettura o una traduzione con glossario.
- Una voce che può essere verificata da una macchina diventa uno script in CI, non una skill: le skill servono a decidere, gli script a impedire.

## Criterio per scegliere il contenitore

| Contenitore | Quando |
| --- | --- |
| Script in CI | La regola è oggettiva e verificabile: parità dei file, front matter, link rotti, immagini mancanti |
| Skill | La procedura è ripetibile ma richiede giudizio: pubblicare un articolo, importare un pezzo, tradurre con la voce giusta |
| Agente | Serve un contesto isolato e un output strutturato: audit del sito, revisione di una traduzione, ricognizione fonti |
| Niente | È un caso unico, o il costo di manutenzione supera il beneficio |

## Osservazioni raccolte

### 2026-10-20, audit e primi passi del piano

| # | Attrito osservato | Evidenza | Contenitore proposto | Priorità |
| --- | --- | --- | --- | --- |
| 1 | I documenti di riferimento derivano dal codice: README parlava di Stack v3, JOURNAL citava cartelle rimosse, TODO duplicava il piano | README, JOURNAL, TODO al 2026-10-20 | Skill `repo-doctor` con checklist di allineamento documenti | Alta |
| 2 | Nessun controllo automatico della parità bilingue | 89 file in `content/`, nessuno script | Script in CI più skill di revisione | Alta |
| 3 | Il workflow di pubblicazione vive solo in AGENTS.md e in testa a Nando: `[ci skip]`, quando togliere `draft`, quando fare il commit di publish | Conversazione del 2026-10-20 | Skill `publish-post` con checklist | Alta |
| 4 | Importare e ripubblicare un articolo MokaByte è un lavoro ripetitivo: bundle, immagini, front matter, serie, parte, nota sulla fonte | 13 file in `raw/mokabyte/` | Skill `import-article` o script `new-post` esteso | Alta |
| 5 | La traduzione EN non ha glossario né criteri di revisione, quindi la qualità dipende dall'umore della sessione | D2, parità stretta | Skill `translate-post` con glossario in `docs/contenuti/glossario.md` | Media |
| 6 | Gli audit del sito (link, immagini pesanti, build, accessibilità) sono manuali e non ripetibili | Audit del 2026-10-20 | Agente `site-auditor` in sola lettura | Media |
| 7 | Le note vocali hanno un protocollo scritto ma nessuna pipeline: trascrizione, scheda nel registro, outline | `registro-note-vocali.md`, `articolo-the-savant.md` | Skill `voice-note-intake` | Media |
| 8 | Il piano di evoluzione va tenuto vivo: task spuntati, stato aggiornato, altrimenti diventa un documento morto come TODO.md | TODO.md come precedente | Skill `plan-sync` o parte di `repo-doctor` | Bassa |
| 9 | Nella sessione ho usato `find`, `grep` e shell per esplorare un sito statico: Serena e ast-grep servono poco qui, servono molto quando arriveranno script e template | Sessione del 2026-10-20 | Nessuna azione, annotato per non sovraingegnerizzare | Bassa |
| 10 | Le action GitHub invecchiano in silenzio: i workflow usavano major del 2023 e niente lo segnalava | `deploy.yml`, `update-theme.yml` al 2026-10-20 | Parte di `repo-doctor`: controllo delle major delle action | Media |
| 11 | La procedura di pubblicazione è invisibile: "commit vuoto senza marcatore" non si scopre da solo, e una dimenticanza pubblica per sbaglio | AGENTS.md non lo diceva prima del 2026-10-20; richiesta esplicita di Nando | Skill `publish-post` con checklist e conferma | Alta |
| 12 | Una skill può contraddire le regole del repo: `wrap-up` diceva di pushare per pubblicare mentre la pubblicazione è sospesa | `.opencode/skills/wrap-up/SKILL.md`, corretto il 2026-10-20 | Controllo periodico delle skill dentro `repo-doctor` | Media |

## Candidati già previsti dal piano

- `post-research` (M1): fonti, verifica, outline, senza scrivere la prosa.
- `translation-review` (M2): checklist di revisione della traduzione.
- `check-content` (C6): script, non skill.

## Decisioni

- Preferire poche skill stabili a molte skill fragili. Ogni skill deve avere un caso d'uso reale già accaduto almeno due volte.
- Gli agenti restano in sola lettura finché non c'è un motivo forte per farli scrivere.
- Ogni nuova skill va provata su un caso vero prima di essere considerata utile.
