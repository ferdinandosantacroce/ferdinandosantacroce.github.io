# 0008. Tassonomia `series` per gli articoli in più parti

**Stato:** accettato · **Data:** 2026-10-20

## Contesto

La serie Git è composta da undici articoli pubblicati tra il 2016 e il 2018. Hugo non raggruppa i contenuti in serie: senza una struttura dedicata restano undici post sparsi nell'archivio, difficili da seguire nell'ordine giusto.

## Decisione

Attivare la tassonomia `series` accanto a `categories` e `tags`. Ogni parte dichiara `series` (nome identico in tutte le parti e in entrambe le lingue) e `part` (numero). Hugo genera `/series/<nome>/` con l'elenco delle parti.

Alternative scartate: una pagina indice scritta a mano (da aggiornare a ogni parte, e si scorda); un campo `weight` e un layout ad hoc (più codice per un risultato simile).

## Conseguenze

- Undici articoli diventano una serie navigabile, con una pagina per lingua.
- Il valore di `series` deve essere identico ovunque: un refuso in una parte crea una seconda serie. Il controllo contenuti dovrà verificarlo.
- La pagina usa il layout di lista generico del tema: funziona, ma non è progettata per una serie. Un layout dedicato è lavoro dell'Orizzonte grafico, non di adesso.
- `series` diventa una tassonomia pubblica: le pagine sono indicizzabili e vanno tenute ordinate.
