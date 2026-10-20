---
name: post-research
description: Use before writing an article, when a backlog item has a source or a voice note and needs facts, sources and an outline. Collects material, separates facts from opinions, verifies claims and produces questions for Nando. It does not write the prose.
---

# Post research

La ricerca prepara l'articolo, non lo scrive. La prosa resta di Nando: questa skill produce materiale verificato, un outline e le domande che mancano. Se il risultato assomiglia a un articolo, è andata troppo avanti.

## Quando usarla

- Un elemento del backlog (`docs/piano-editoriale/backlog.md`) ha abbastanza materiale per diventare una scaletta.
- C'è una nota vocale trascritta da cui partire.
- Un articolo esistente va aggiornato e servono fonti aggiornate.

## Input

- L'ID del backlog, per esempio `E13`.
- I file sorgente indicati nella colonna Fonte, dentro `raw/mokabyte/` o `docs/piano-editoriale/`.
- La trascrizione, se esiste, in `docs/piano-editoriale/registro-note-vocali.md`.

## Procedura

1. **Leggi il backlog e le fonti.** Annota cosa è già detto e cosa manca. Non riassumere tutto: individua la scena, la tesi e i punti scoperti.
2. **Separa i fatti dalle interpretazioni.** Crea due colonne: cose successe (con date, luoghi, nomi, numeri) e cose pensate (giudizi, ipotesi, lezioni apprese). Nel dubbio, un fatto va nella colonna delle interpretazioni.
3. **Verifica ciò che è verificabile:**
   - comandi e codice: eseguili, non fidarti della memoria;
   - versioni dei software e date: documentazione ufficiale del progetto;
   - citazioni e teorie: fonte primaria (libro, paper, talk originale), non un riassunto;
   - storia dell'informatica: Wikipedia va bene come punto di partenza, mai come unica fonte.
4. **Annota ogni fonte** con URL, titolo e data di consultazione. Se una fonte non si trova, il fatto resta "da verificare" e non entra nell'articolo come certo.
5. **Costruisci l'outline in sette punti**, dal piano editoriale:
   1. scena iniziale concreta;
   2. problema o tensione;
   3. ipotesi iniziale;
   4. esperimento o decisione;
   5. risultato osservato;
   6. cosa faresti diversamente oggi;
   7. domanda o invito alla discussione.
6. **Scrivi le domande per Nando.** Massimo cinque, concrete, ognuna con il motivo per cui serve. Niente domande a cui il materiale risponde già.
7. **Salva il risultato** in `docs/piano-editoriale/ricerche/<ID>-<slug>.md` con questa struttura:

   ```markdown
   # E13 — Le tre facce dei tool di coding AI

   ## Cosa sappiamo
   ## Fatti verificati
   ## Interpretazioni e giudizi
   ## Fonti
   ## Outline in sette punti
   ## Domande per Nando
   ## Rischi e punti deboli
   ```

8. **Aggiorna il backlog**: se manca materiale, lo stato resta `idea`; se l'outline è pronto, passa a `scaletta`.

## Regole

- **Non inventare scene.** Se la scena concreta non c'è, chiedila: è il pezzo che rende l'articolo leggibile.
- **Non unire fatti diversi** in una scena sola per renderla più bella.
- **Le opinioni non diventano fonti.** Se Nando dice una cosa e nessun documento la conferma, resta un'opinione, e va scritta come tale.
- **Le fonti si datano.** Un link senza data di consultazione non è verificabile tra sei mesi.
- **Poche fonti, buone.** Meglio tre fonti primarie che dieci articoli che si copiano a vicenda.

## Done

- Esiste il file in `docs/piano-editoriale/ricerche/`.
- Ogni affermazione tecnica ha una fonte o è marcata come da verificare.
- L'outline segue i sette punti, anche solo con una riga per punto.
- Ci sono al massimo cinque domande, e sono domande a cui Nando può rispondere in una nota vocale.
