# Architecture Decision Records

Qui vivono le decisioni che riguardano **come funziona il sito** e **come ci si lavora**: lingua e URL, pubblicazione, tema, parità bilingue, tassonomia, ripubblicazione dei contenuti storici. Ogni decisione ha un file, con il contesto che l'ha generata e le conseguenze che si porta dietro.

Un ADR non dice cosa fare domani: dice perché una certa strada è stata scelta, così tra sei mesi nessuno la rimette in discussione per caso. Il piano operativo è `../piano-evoluzione-blog.md`, il backlog editoriale è `../piano-editoriale/`.

## Quando scrivere un ADR

- La decisione è difficile da invertire, o costosa.
- Un lettore futuro si chiederebbe "perché è fatto così?".
- Ci sono alternative ragionevoli che sono state scartate.
- Tocca URL, lingua, deploy, dipendenze, struttura dei contenuti.

## Quando non scriverlo

- Scelte editoriali puntuali: quale articolo, quale titolo, quale tag. Stanno nel piano editoriale.
- Stato dei lavori e task aperti: stanno nel piano.
- Cose ovvie o reversibili in un minuto.

## Formato

```markdown
# NNNN. Titolo della decisione

**Stato:** accettato · **Data:** YYYY-MM-DD

## Contesto
Cosa ha reso necessaria la decisione, con i fatti che la sostengono.

## Decisione
Cosa si è deciso, in una frase chiara.

## Conseguenze
Cosa diventa più facile, cosa più difficile, cosa resta aperto.
```

Stati ammessi: `proposto`, `accettato`, `superato`, `rifiutato`. Un ADR accettato non si riscrive: se la decisione cambia, se ne scrive uno nuovo che dichiara `Supera il NNNN`.

## Indice

| ADR | Decisione | Stato |
| --- | --- | --- |
| [0001](0001-usare-gli-adr.md) | Usare gli ADR per registrare le decisioni | accettato |
| [0002](0002-ripubblicare-gli-articoli-mokabyte.md) | Ripubblicare i 13 articoli MokaByte sul blog | accettato |
| [0003](0003-parita-bilingue-stretta.md) | Parità bilingue stretta con debito tracciato | accettato |
| [0004](0004-inglese-alla-radice.md) | Inglese alla radice, italiano sotto `/it/` | accettato |
| [0005](0005-pubblicazione-sospesa.md) | Pubblicazione sospesa e rilascio esplicito | accettato |
| [0006](0006-tema-stack-personalizzazione-minima.md) | Stack con personalizzazione minima | accettato |
| [0007](0007-sito-come-hub-professionale.md) | Il sito è un hub professionale, non solo un blog | accettato |
| [0008](0008-tassonomia-series.md) | Tassonomia `series` per gli articoli in più parti | accettato |
