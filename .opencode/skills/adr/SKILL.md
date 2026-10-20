---
name: adr
description: Use when a decision about the site's structure, URLs, language, deploy, theme or content model is taken, or when Nando asks why something is the way it is. Writes a numbered Architecture Decision Record in docs/adr/ with context, decision and consequences.
---

# Architecture Decision Record

Un ADR registra **perché** una scelta è stata fatta, non cosa fare domani. Vive in `docs/adr/`, numerato, con stato, contesto, decisione e conseguenze. Il piano operativo dice cosa resta da fare; il piano editoriale dice cosa pubblicare; l'ADR dice perché il sistema è fatto così.

## Quando scrivere un ADR

- La decisione è costosa o lenta da invertire (lingua e URL, deploy, licenze, tassonomia).
- Un lettore futuro, o un agente, se ne chiederebbe il motivo, e senza traccia la "correggerebbe".
- Sono state scartate alternative ragionevoli.
- Cambia il modo di lavorare, non solo un file.

## Quando non scriverlo

- Scelte editoriali puntuali: titolo, tag, ordine degli articoli. Stanno nel piano editoriale.
- Task, stato dei lavori, checklist: stanno nel piano.
- Cose ovvie o reversibili in un minuto.

## Procedura

1. **Numera**: guarda `docs/adr/README.md`, prendi il primo numero libero, quattro cifre.
2. **Nomina il file** in italiano, kebab-case, senza data: `NNNN-titolo-breve.md`.
3. **Parti da `docs/adr/template.md`** e compila:
   - **Contesto**: fatti verificabili, con numeri e percorsi. Niente "secondo me".
   - **Decisione**: una frase chiara, più le alternative scartate e perché.
   - **Conseguenze**: cosa diventa facile, cosa difficile, cosa resta aperto. Anche i costi.
4. **Aggiorna l'indice** in `docs/adr/README.md`.
5. **Collega**: se il piano o un documento citano quella decisione, aggiorna il riferimento. Se una regola operativa ne deriva (`AGENTS.md`), scrivila anche lì, in forma breve.
6. **Commit** con `[ci skip]`, messaggio `docs(adr): ...`.

## Stati

- `proposto`: scritto, non ancora adottato.
- `accettato`: è la regola corrente.
- `superato`: non più valido, sostituito da un altro ADR che lo cita.
- `rifiutato`: valutato e scartato, resta come memoria del perché.

## Regole

- Un ADR accettato **non si riscrive**. Se la decisione cambia, si scrive un ADR nuovo con `Supera il NNNN` e si aggiorna lo stato del vecchio a `superato`.
- Un ADR per decisione: niente documenti-omnia che mescolano cinque scelte.
- Nel dubbio tra ADR e piano: se la frase risponde a "perché", è un ADR; se risponde a "cosa manca", è il piano.
- Gli ADR sono interni: non finiscono sul sito.
