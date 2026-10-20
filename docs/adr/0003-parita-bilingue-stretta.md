# 0003. Parità bilingue stretta con debito tracciato

**Stato:** accettato · **Data:** 2026-10-20

## Contesto

Il sito è bilingue. Scrivo in italiano per primo, l'inglese arriva dopo. La regola precedente diceva "nessun contenuto monolingue", ma senza un meccanismo che rendesse visibile il lavoro mancante: il rischio era pubblicare bundle italiani e dimenticare la traduzione, senza accorgersene.

## Decisione

Parità stretta in tre punti: ogni bundle ha `index.it.md` e `index.en.md` dal primo commit; una lingua può essere pubblicata mentre l'altra è `draft: true`; il debito di traduzione è generato e contato dalla verifica contenuti in CI, non affidato alla memoria.

## Conseguenze

- Nessuna traduzione può sparire in silenzio: il debito è un numero in un report.
- Nessun contenuto finto: se l'inglese non c'è, il file è in bozza e non viene pubblicato, invece di esistere come pagina vuota.
- Il lettore inglese che arriva prima della traduzione non trova l'articolo, e questo va accettato o compensato con una scheda ponte.
- Lo stato della traduzione si legge da `draft: true` e da nessun'altra parte: non esiste un campo `translation_status`, due indicatori divergerebbero.
