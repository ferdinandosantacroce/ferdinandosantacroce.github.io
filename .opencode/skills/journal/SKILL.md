---
name: journal
description: Use when closing a work session on this blog, when Nando asks to note or remember what was done, or after a significant change (new article, infrastructure fix, decision). Writes a dated entry in JOURNAL.md with facts, decisions and open items, without duplicating the plan or the ADRs.
---

# Journal — ferdinandosantacroce.github.io

Il journal racconta **cosa è successo in una sessione**, in ordine cronologico. Non è il piano (che dice cosa resta da fare), non è un ADR (che spiega perché una scelta è stata presa). Se un'informazione appartiene al piano o a un ADR, va lì, e il journal ci rimanda.

## Quando scrivere

- A fine sessione di lavoro, anche breve.
- Dopo un intervento significativo: un articolo pubblicato, un workflow cambiato, una migrazione.
- Quando Nando dice "annota", "scrivi nel journal", "ricordati di questo".

Non scrivere una voce per ogni commit: il journal non è un log di git.

## Procedura

1. **Raccogli i fatti**, non i ricordi: `git log --oneline` della sessione, `git status`, i file toccati. Se un numero è citabile (parole, articoli, immagini), misuralo.
2. **Apri `JOURNAL.md`** nella radice del repository. La voce nuova va **in cima**, subito dopo l'intestazione e il separatore, perché l'ordine è dal più recente al più vecchio.
3. **Scrivi la voce** con questa struttura, in italiano:

   ```markdown
   ## YYYY-MM-DD

   ### Fatto
   - Cosa è cambiato, con i riferimenti: file, commit, URL.

   ### Decisioni
   - Solo se ne sono state prese, con il link all'ADR corrispondente.

   ### Problemi aperti
   - Cosa resta in sospeso, e cosa serve per sbloccarlo.

   ### Prossimo passo
   - Una riga, concreta.
   ```

4. **Niente duplicazioni.** Se una decisione ha un ADR, scrivi "vedi ADR NNNN" senza ripetere il ragionamento. Se un task è nel piano, cita l'ID (`C5`, `F3`) invece di descriverlo.
5. **Verifica i riferimenti**: nessun percorso a cartelle che non esistono più, nessun nome di file rinominato, nessun comando che non funziona. Il journal invecchia male se cita cose morte.
6. **Controlla la voce precedente** solo se è diventata fuorviante: correggila con una nota, non riscrivere la storia.

## Regole

- Date assolute (`2026-10-20`), mai "ieri" o "la settimana scorsa".
- Verbi al passato per ciò che è fatto, al presente per lo stato.
- Le misure contano più degli aggettivi: "13 articoli, 30.360 parole" invece di "molto materiale".
- Se la sessione non ha prodotto nulla di utile, non scrivere nulla: un journal di rumore è peggio di un journal corto.

## Cosa non mettere

- Segreti, token, credenziali, dati di clienti.
- Dettagli interni non pubblicabili su progetti riservati.
- La prosa degli articoli: quella vive in `content/`.
