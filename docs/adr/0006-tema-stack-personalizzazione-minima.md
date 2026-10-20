# 0006. Stack con personalizzazione minima

**Stato:** accettato · **Data:** 2026-10-20

## Contesto

Il tema Stack v4 arriva come modulo Go e si aggiorna da solo ogni settimana. Il sito ha un solo foglio di stile personalizzato, `assets/css/custom.css`, di tre righe, e due override di lista. Non ci sono esigenze grafiche urgenti e non c'è un'identità visiva definita.

## Decisione

Restare sul tema, personalizzando con `custom.css` e override mirati dei template. Nessun fork finché non emerge un'esigenza che gli override non coprono. Quando servirà un'identità visiva, si parte da colori, tipografia e favicon, non dal fork.

## Conseguenze

- Gli aggiornamenti del tema restano indolori, che è il motivo principale della scelta.
- Il sito somiglia molto allo standard del tema: va bene ora, diventerà un limite quando il sito sarà il biglietto da visita professionale.
- Ogni override è un debito verso il tema: va scritto il meno possibile e verificato a ogni aggiornamento.
- Un fork resta possibile, ma diventa un ADR a sé con un costo di manutenzione esplicito.
