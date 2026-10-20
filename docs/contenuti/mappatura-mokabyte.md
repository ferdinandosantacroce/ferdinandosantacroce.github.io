# Mappatura degli articoli MokaByte

Documento di lavoro per il task C1 del piano (`docs/piano-evoluzione-blog.md`). Serve a decidere una volta sola slug, titoli, date, immagini e schema dei metadati dei 13 articoli da ripubblicare. Non pubblica nulla: sono solo decisioni da approvare prima di toccare `content/`.

**Fonte:** `raw/mokabyte/`, tredici file, 2.890 righe, tutti in italiano, tutti `draft: true`.
**Verifiche fatte:** 32 immagini referenziate, 32 presenti in `raw/mokabyte/images/`, nessuna mancante e nessuna orfana.

## 1. Sintesi dei tredici articoli

### Serie "Git, the stupid content tracker", 11 parti

| # | File sorgente | Slug proposto | Titolo IT | Titolo EN | Data | Immagini |
| --- | --- | --- | --- | --- | --- | --- |
| G1 | `2016-09-12-git-1.md` | `git-stupid-content-tracker-1` | Git, the stupid content tracker | Git, the stupid content tracker | 2016-09-12 | 0 |
| G2 | `2016-10-11-git-2.md` | `git-stupid-content-tracker-2` | Git, the stupid content tracker (parte 2) | Git, the stupid content tracker (part 2) | 2016-10-11 | 10 |
| G3 | `2017-01-13-git-3.md` | `git-stupid-content-tracker-3` | Git, the stupid content tracker (parte 3) | Git, the stupid content tracker (part 3) | 2017-01-13 | 4 |
| G4 | `2017-02-14-git-4.md` | `git-stupid-content-tracker-4` | Git, the stupid content tracker (parte 4) | Git, the stupid content tracker (part 4) | 2017-02-14 | 0 |
| G5 | `2017-04-10-git-5.md` | `git-stupid-content-tracker-5` | Git, the stupid content tracker (parte 5) | Git, the stupid content tracker (part 5) | 2017-04-10 | 0 |
| G6 | `2017-05-15-git-6.md` | `git-stupid-content-tracker-6` | Git, the stupid content tracker (parte 6) | Git, the stupid content tracker (part 6) | 2017-05-15 | 1 |
| G7 | `2017-07-15-git-7.md` | `git-stupid-content-tracker-7` | Git, the stupid content tracker (parte 7) | Git, the stupid content tracker (part 7) | 2017-07-15 | 0 |
| G8 | `2017-10-15-git-8.md` | `git-stupid-content-tracker-8` | Git, the stupid content tracker (parte 8) | Git, the stupid content tracker (part 8) | 2017-10-15 | 0 |
| G9 | `2017-12-15-git-9.md` | `git-stupid-content-tracker-9` | Git, the stupid content tracker (parte 9) | Git, the stupid content tracker (part 9) | 2017-12-15 | 1 |
| G10 | `2018-01-14-git-10.md` | `git-stupid-content-tracker-10` | Git, the stupid content tracker (parte 10) | Git, the stupid content tracker (part 10) | 2018-01-14 | 2 |
| G11 | `2018-02-13-git-11.md` | `git-stupid-content-tracker-11` | Git, the stupid content tracker (parte 11) | Git, the stupid content tracker (part 11) | 2018-02-13 | 3 |

### Articoli autonomi

| # | File sorgente | Slug IT | Slug EN | Titolo IT | Titolo EN | Data | Immagini |
| --- | --- | --- | --- | --- | --- | --- | --- |
| A1 | `2018-11-17-sviluppatoremediocre.md` | `lo-sviluppatore-mediocre` | `i-am-a-mediocre-developer` | Sono uno sviluppatore mediocre | I am a mediocre developer | 2018-11-17 | 5 |
| A2 | `2019-07-20-workingsoftwareconf19.md` | `working-software-conference-2019` | `working-software-conference-2019` | Working Software Conference 2019 | Working Software Conference 2019 | 2019-07-20 | 6 |

Nota sugli slug: ogni lingua ha lo slug nella propria lingua. Per la serie Git e per A2 i due slug coincidono perché titoli e termini sono già in inglese; A1 è il caso in cui differiscono, `lo-sviluppatore-mediocre` e `i-am-a-mediocre-developer`. Hugo pubblica le immagini del bundle una volta sola sotto il percorso della lingua di default, quindi entrambe le pagine le referenziano da `/p/i-am-a-mediocre-developer/`. Non è un problema finché la pagina inglese esiste, e il controllo contenuti di C6 verificherà che ogni immagine referenziata esista nel build.

Totale: 13 bundle, 26 file Markdown, 32 immagini. La numerazione `G1..G11` e `A1..A2` serve solo in questo documento, per parlare degli articoli senza citare i nomi dei file.

## 2. Schema dei metadati

Per la serie, ogni articolo usa lo stesso blocco, cambiando parte, titolo, data e fonte:

```yaml
---
title: "Git, the stupid content tracker (parte 2)"
description: "Da scrivere: una riga che dica al lettore cosa porta a casa"
slug: git-stupid-content-tracker-2
date: 2016-10-11
lastmod: 2026-10-20        # data dell'ultima revisione
categories:
    - Software
tags:
    - git
    - version control
series: "Git, the stupid content tracker"
part: 2
source: https://mokabyte.it/2016/10/11/git-2/
source_date: 2016-10-11
---
```

Note sullo schema:

- `description` va scritta a mano per ogni articolo: è la riga che appare nelle liste e nei risultati di ricerca, e una descrizione generica si nota subito.
- `part` è solo un numero, utile per ordinare e per mostrare "parte 2 di 11" quando ci sarà un layout di serie.
- `translation_status` non serve: il debito di traduzione si ricava da `draft: true` sul file inglese, che è l'unica fonte di verità. Due indicatori diversi finirebbero per divergere.
- Gli articoli autonomi non hanno `series` né `part`, ma mantengono `source` e `source_date`.

### Tassonomia `series`, da valutare

Hugo permette di aggiungere una tassonomia `series` in `config/_default/config.toml`:

```toml
[taxonomies]
category = "categories"
tag = "tags"
series = "series"
```

Con quella, ogni serie ottiene una pagina `/series/git-the-stupid-content-tracker/` che elenca automaticamente le parti. Il tema ha un `layouts/list.html` generico, quindi la pagina funziona senza scrivere codice. È il modo più economico per dare continuità a una serie di 11 articoli, che altrimenti restano undici post scollegati in mezzo all'archivio.

## 3. Piano delle immagini

Le immagini si spostano dentro il bundle dell'articolo e vengono rinominate in modo uniforme. Nei Markdown i riferimenti passano da `images/git-2_fig01.png` a `fig01.png`.

| Articolo | Da `raw/mokabyte/images/` | A `content/post/<slug>/` | Rinomina |
| --- | --- | --- | --- |
| G2 | `git-2_fig01.png` … `git-2_fig10.png` | 10 file | `fig01.png` … `fig10.png` |
| G3 | `git-3_fig01.jpg` … `git-3_fig04.jpg` | 4 file | `fig01.jpg` … `fig04.jpg` |
| G6 | `git-6_fig01.jpg` | 1 file | `fig01.jpg` |
| G9 | `git-9_fig01.jpg` | 1 file | `fig01.jpg` |
| G10 | `git-10_tab01.jpg`, `git-10_tab02.jpg` | 2 file | `tab01.jpg`, `tab02.jpg` |
| G11 | `git-11_fig01.jpg` … `git-11_fig03.jpg` | 3 file | `fig01.jpg` … `fig03.jpg` |
| A1 | `sviluppatoremediocre_fig01.jpg` … `_fig05.jpg` | 5 file | `fig01.jpg` … `fig05.jpg` |
| A2 | `workingsoftwareconf19_fig01.jpg` … `_fig06.jpg` | 6 file | `fig01.jpg` … `fig06.jpg` |
| G1, G4, G5, G7, G8 | nessuna | | |

Qualità: le immagini vanno da 88 KB a 240 KB, con larghezze tra 513 e 960 pixel. Vanno bene così: Hugo le ridimensiona e le converte in WebP in build. Non serve ricomprimerle a mano.

## 4. Rilievi editoriali

Dati misurati sui tredici file, utili per decidere quanto lavoro serve prima di pubblicare.

- **Il vocabolario Git è del 2016-2018.** Nei testi compaiono 218 occorrenze di `master`, 41 di `git checkout`, 27 di `git reset`, 70 di `git add`. Nulla è falso: `git checkout` funziona ancora, ma oggi è sovraccarico e Git suggerisce `git restore` e `git switch`. Il default branch, dal 2020, è `main`.
- **Le dieci schermate di G2 sono il vero problema.** Sono screenshot dell'installer di Git per Windows del 2016. L'interfaccia è cambiata e chi segue le immagini oggi non ritrova le stesse schermate.
- **Nessun collegamento interno a MokaByte da riscrivere.** Le uniche occorrenze di "mokabyte" nel corpo sono un esempio di `git hash-object` in G5; il resto sono i campi `source`. Buona notizia: non ci sono link che portano fuori.
- **Due articoli su tredici sono senza tempo.** G1 (storia e nome di Git) e G11 (le tre aree, staging e history) invecchiano poco. A1 e A2 non parlano di comandi: sono riflessioni su carriera e comunità, e reggono bene.
- **G4, G5, G7, G8 sono i più tecnici e i più lunghi** (332, 189, 303, 296 righe): sono anche quelli in cui un errore di aggiornamento si nota di più.
- **Tutti e tredici i file finiscono con un artefatto di WordPress**: `MOLONGUI AUTHORSHIP PLUGIN 5.2.9` più un URL. Va rimosso.
- **I rimandi alle note sono rotti anche sull'originale.** I marcatori `[1]`, `[3]`, `[4]` e così via non hanno una sezione di note né nel file né sulla pagina MokaByte: sono stati rimossi, e dove il rimando introduceva una risorsa utile è stato messo un link stabile.

## 5. Decisioni per C2

Il task C2 chiedeva tre decisioni, più due collaterali. Sono state prese il 2026-10-20: qui sotto restano il motivo e il costo, perché tra sei mesi serviranno a ricordare il perché.

### 5.1 Canonical

**Deciso:** self-canonical, con una riga in testa a ogni articolo del tipo "Originariamente pubblicato su Mokabyte il 12 settembre 2016" e il link all'originale.

Motivo: l'obiettivo dichiarato è mantenere il controllo del contenuto. Se il canonical puntasse a MokaByte, il blog personale direbbe a Google che la versione autorevole è quella della magazine, cioè l'opposto. La nota e il link mantengono la correttezza verso la testata, e il giorno in cui MokaByte chiudesse non ci sarebbe nulla da cambiare.

### 5.2 Testo: ripubblicare o aggiornare

**Deciso:** ripubblicare il testo originale, con due aggiunte:

1. un blocco "Nota 2026" in testa agli articoli dove qualcosa è cambiato, breve e concreto: default branch `main`, `git restore` e `git switch`, installer diverso;
2. un paragrafo nuovo di apertura in G1 che spiega che la serie è stata scritta tra il 2016 e il 2018 e che alcuni comandi hanno oggi un'alternativa.

Motivo: riscrivere 218 `master` e 41 `git checkout` significherebbe rifare la serie, con il rischio di introdurre errori in un testo che funziona. Il lettore non ha bisogno di un testo riscritto, ha bisogno di sapere cosa è cambiato.

Costo stimato: 4-6 ore per le note e le rifiniture su tutti e tredici gli articoli. La riscrittura completa costerebbe 20-25 ore e cambierebbe la voce originale.

Sulle schermate di G2: restano quelle del 2016, con la nota che lo dice. Le immagini sono già tutte in `raw/mokabyte/images/`, quindi non c'è nulla da recuperare da MokaByte. Gli originali di Nando servono solo se in futuro decideremo di rigenerare le schermate.

### 5.3 Date

**Deciso:** mantenere la data originale di pubblicazione, aggiungere `lastmod` con la data della revisione.

Motivo: le date finte sono una piccola bugia che si vede subito nell'archivio, e l'archivio è una sezione del sito. Il fatto che la home mostri come ultimo articolo quello del 2021 non si risolve falsificando le date: si risolve con la home dell'Orizzonte 3, che avrà un blocco "da dove cominciare" e uno della serie.

### 5.4 Copertine

**Deciso:** niente copertine nuove per ora. Usare come `image` solo uno screenshot che si legge bene in piccolo, se esiste; per gli altri, nessuna immagine finché non ci sarà un'identità grafica. Una copertina brutta è peggio di nessuna copertina.

### 5.5 Categoria e tag

**Deciso:** tutti in categoria `Software`, che è già l'unica categoria del sito. I tag riusano il vocabolario esistente dove possibile (`git`, `software development`, `legacy`, `agile`, `career`, `community`, `conference`) e aggiungono `version control` per la serie.

Motivo: creare categorie nuove per tredici articoli frammenta un sito che ha già una sola categoria e rende più difficile orientarsi. I tag bastano a distinguere serie, carriera e comunità.

## 6. Decisioni prese il 2026-10-20

| # | Domanda | Decisione |
| --- | --- | --- |
| 1 | Canonical | Self-canonical con nota e link all'originale |
| 2 | Testo | Ripubblicare l'originale con la "Nota 2026" dove serve |
| 3 | Schermate di G2 | Restano quelle del 2016, con la nota che lo dice |
| 4 | Tassonomia `series` | Attivata in `config/_default/config.toml`, verificata con un post di prova |
| 5 | Titolo inglese di A1 | "I am a mediocre developer" |

Nota tecnica sulla tassonomia: con `series = "series"` in `[taxonomies]`, Hugo genera `/series/<nome>/` per ogni serie. Verificato che il layout di lista del tema regge la pagina senza codice aggiuntivo. Per i contenuti in italiano la pagina vive sotto `/it/series/<nome>/`.

## 7. Checklist di importazione

Questa sequenza è il candidato naturale per la futura skill `import-article`. Va provata su un articolo (C4) prima di diventare una skill.

1. Creare `content/post/<slug>/`, con lo slug italiano nella cartella e lo slug di ogni lingua nel proprio file.
2. Copiare il Markdown italiano come `index.it.md`, sostituire il front matter con lo schema della sezione 2.
3. Pulire il file: via l'artefatto `MOLONGUI AUTHORSHIP PLUGIN` in coda, via i rimandi a note che non esistono, corretti i refusi evidenti.
4. Copiare le immagini nel bundle e rinominarle secondo la sezione 3.
5. Riscrivere i riferimenti alle immagini nel Markdown.
6. Scrivere `description`.
7. Aggiungere la nota sulla fonte e, se serve, la "Nota 2026".
8. Creare `index.en.md` con la traduzione completa; se la traduzione non è pronta, il file resta `draft: true`.
9. Build locale e controllo visivo di IT e EN.
10. Verificare che le immagini si vedano e i link siano corretti.
11. Commit con `[ci skip]`.

## 8. Stato

- [x] Inventario dei tredici file e dei metadati.
- [x] Verifica delle 32 immagini.
- [x] Proposta di slug, titoli, date.
- [x] Decisioni editoriali approvate il 2026-10-20.
- [x] Tassonomia `series` attivata e verificata.
- [ ] Applicazione a `content/` (C4 e C5): A1 e G1 pubblicati in italiano e inglese, restano 11 articoli.
