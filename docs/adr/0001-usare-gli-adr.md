# 0001. Usare gli ADR per registrare le decisioni

**Stato:** accettato · **Data:** 2026-10-20

## Contesto

A ottobre 2026 le decisioni su questo sito erano sparse in tre posti: il piano, il journal, `AGENTS.md`, e in parte solo nella conversazione. Chi riprende il lavoro dopo un mese non sa se una scelta sia stata deliberata o sia un residuo. Esempio concreto: la lingua di default è l'inglese, e senza una traccia scritta sembra una svista da correggere.

## Decisione

Ogni decisione che riguarda come funziona il sito o come ci si lavora diventa un file in `docs/adr/`, numerato, con contesto, decisione e conseguenze. Le scelte editoriali puntuali restano nel piano editoriale, lo stato dei lavori nel piano operativo.

## Conseguenze

- Il "perché" sopravvive alle sessioni, e le decisioni non vengono riaperte per caso.
- Un po' di manutenzione in più: ogni decisione seria costa cinque minuti di scrittura.
- Rischio di burocrazia se si scrive un ADR per tutto: la soglia è che la decisione sia costosa da invertire o che un lettore futuro se ne chiederebbe il motivo.
- Gli ADR sono immutabili una volta accettati: cambiarli significa scriverne uno nuovo che li supera.
