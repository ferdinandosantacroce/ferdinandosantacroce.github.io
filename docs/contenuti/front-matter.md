# Front matter

Schema dei metadati per i contenuti del sito. Un solo posto da leggere quando si crea o si migra un contenuto. Riferimento: task C3 del piano.

## Campi

| Campo | Tipo | Obbligatorio | Dove | Note |
| --- | --- | --- | --- | --- |
| `title` | string | sì | ovunque | Nella lingua del file |
| `description` | string | sì | post, talks, works, pagine | Una riga: cosa porta a casa il lettore. Appare in liste e risultati |
| `slug` | string | consigliato | post e pagine | Minuscolo, trattini, niente date. Può differire tra IT e EN |
| `date` | datetime | sì | ovunque | Data originale di pubblicazione. Non si falsifica per far sembrare nuovo un contenuto |
| `lastmod` | date | no | post | Data dell'ultima revisione reale |
| `image` | string | no | post, talks, works | File dentro il bundle, referenziato per nome |
| `categories` | list | sì | post | Oggi l'unica categoria dei post è `Software` |
| `tags` | list | sì | post | Riusare il vocabolario esistente quando possibile |
| `series` | string | no | post | Nome della serie, identico in tutte le parti e in entrambe le lingue |
| `part` | int | con `series` | post | Numero della parte |
| `source` | url | no | post | Solo per le ripubblicazioni: URL dell'originale |
| `source_date` | date | con `source` | post | Data di pubblicazione originale fuori dal sito |
| `group` | string | sì | works | `book` oppure `article`, guida il raggruppamento nella pagina Works |
| `weight` | int | no | works, pagine | Ordine manuale dentro un gruppo |
| `params.video` | url | no | talks | Registrazione dell'intervento |
| `draft` | bool | no | ovunque | Vedi la regola sulla parità qui sotto |
| `toc` | bool | no | pagine | Mostra l'indice laterale |
| `menu` | map | no | pagine | Voce di menu con `weight` e `params.icon` |

Non esiste un campo `translation_status`: lo stato della traduzione si legge da `draft: true` sul file inglese. Due indicatori finirebbero per divergere.

## Esempi

### Post semplice

```yaml
---
title: "Elastic Pair Programming"
description: "An alternative way to do pair programming"
slug: elastic-pair-programming
date: 2021-04-12
categories:
    - Software
tags:
    - extreme programming
    - pair programming
image: cover.jpg
---
```

### Post di una serie, ripubblicato

```yaml
---
title: "Git, the stupid content tracker (parte 2)"
description: "Installare Git su Windows e capire cosa fa il primo commit"
slug: git-stupid-content-tracker-2
date: 2016-10-11
lastmod: 2026-10-20
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

### Talk

```yaml
---
title: "Navigating the world of software, between models and reality"
description: "Talk at Italian Agile Days 2023 about user stories, technical debt and DDD"
slug: 2023-iad-modelli-realta
date: 2023-11-10
categories: ["conference", "software models"]
tags:
    - agile
    - DDD
params:
    video: "https://vimeo.com/manage/videos/907009037"
---
```

### Opera (libro o articolo)

```yaml
---
title: "Git Essentials, 2nd Edition"
description: "The second edition of my Git book, plus its Italian translation"
date: 2022-03-06
group: book
weight: 2
image: git-essentials-2nd-edition-small.png
---
```

## Regole

- **Parità stretta.** Ogni bundle ha `index.en.md` e `index.it.md` dal primo commit. L'inglese può restare `draft: true` mentre la traduzione è in corso, ma il file esiste.
- **Date vere.** `date` è la data di pubblicazione originale, `lastmod` la revisione. Nessuna delle due si usa per posizionare un contenuto in cima alla home.
- **Slug.** Minuscolo e con trattini, uno solo per bundle, uguale in italiano e inglese. Non è una scelta stilistica: le risorse del bundle, comprese le immagini, vengono pubblicate una volta sola sotto il percorso della lingua di default, quindi due slug diversi producono riferimenti incrociati tra le lingue e immagini che dipendono dalla pagina inglese.
- **Immagini.** Dentro il bundle, accanto al Markdown, referenziate per nome (`fig01.jpg`, `cover.jpg`). Mai percorsi assoluti, mai cartelle condivise per immagini di un singolo articolo.
- **Serie.** `series` è una tassonomia: Hugo genera `/series/<nome>/`. Il valore deve essere identico in ogni parte e in entrambe le lingue, altrimenti si ottengono due serie.
- **Categorie.** Non si inventa una categoria nuova per ogni tema. Prima si guarda cosa esiste in `content/categories/`; i tag servono a distinguere.
