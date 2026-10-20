---
name: voice-note
description: Use when Nando records a voice note for the blog and it has to become an article, a project sheet or a career page. Covers transcription, the register entry, separating facts from opinions, the link to the backlog and the handover to post-research.
---

# Voice note to outline

Le note vocali sono il materiale grezzo del blog: Nando parla, la trascrizione conserva le parole, il lavoro editoriale trasforma il parlato in una scaletta. Questa skill copre il passaggio dalla trascrizione alla scheda pronta per `post-research`. La prosa dell'articolo non si scrive qui.

## Quando usarla

- Nando manda un file audio (`.m4a`, `.mp3`, `.wav`, `.ogg`) e dice "questa è un'idea per un articolo".
- Una nota vocale esistente va ripresa perché l'articolo è entrato in lavorazione.
- Una trascrizione è già nel registro e va aggiornata.

## Procedura

1. **Trascrivi con la skill `audio-transcriber`.** Modello `large-v3`, lingua italiana. Salva il testo accanto all'audio, non sovrascrivere l'originale.
2. **Apri il registro** `docs/piano-editoriale/registro-note-vocali.md` e compila la scheda:
   - data di ricezione;
   - titolo provvisorio;
   - periodo raccontato;
   - contesto o azienda;
   - ruolo dell'autore;
   - progetto o situazione;
   - trascrizione grezza.
3. **Pulisci la trascrizione senza riscriverla.** Togli le ripetizioni meccaniche e le parole riempitive, correggi i nomi che il riconoscimento ha sbagliato quando sono evidenti. Non cambiare il modo di dire le cose: la voce è il materiale.
4. **Separa tre livelli**, con tre elenchi:
   - **fatti**: episodi, date, luoghi, persone, numeri;
   - **interpretazioni**: cosa Nando pensa che significhi;
   - **domande aperte**: i punti in cui la trascrizione è vaga o si contraddice.
5. **Collega la nota a un ID del backlog** (`docs/piano-editoriale/backlog.md`):
   - se l'idea esiste già, aggiorna lo stato a `nota vocale` e aggiungi il riferimento alla nota nella colonna Fonte;
   - se è nuova, crea il prossimo ID libero con stato `nota vocale` e la nota come fonte.
6. **Passa la mano a `post-research`** per fonti, verifiche e outline in sette punti. Se il materiale è già sufficiente, l'outline si scrive subito nel file di ricerca.
7. **Aggiorna il registro** con la destinazione provvisoria: articolo, scheda progetto, pagina del percorso, scheda corso, oppure "da decidere".
8. **Solo su richiesta, scrivi la bozza italiana** seguendo l'outline e la voce di Nando, poi traduci l'inglese con la skill `translation`. La bozza nasce dall'outline, non dalla trascrizione: se manca una scena, si chiede, non si improvvisa.

## Privacy e nomi

- Prima di scrivere un nome di persona, un'azienda o un cliente, chiedi se si può pubblicare. Nel dubbio, si anonimizza.
- I dettagli che identificano un cliente (settore più città più periodo) vanno trattati come nomi.
- La trascrizione grezza resta interna: non finisce mai in `content/`.

## Cosa non fare

- Non trasformare una nota vocale in un articolo in un passaggio solo: prima i fatti, poi l'outline, poi la prosa.
- Non riempire i vuoti con deduzioni plausibili. "Non ricordo" è un'informazione.
- Non correggere il tono del parlato: se Nando è ironico o diretto, la trascrizione lo mostra.
- Non duplicare la scheda: una nota, una scheda nel registro, un ID nel backlog.

## Done

- La nota ha una scheda completa nel registro.
- La trascrizione pulita è salvata e collegata alla scheda.
- C'è un ID nel backlog con stato `nota vocale` e la fonte corretta.
- Esistono i tre elenchi (fatti, interpretazioni, domande) e, se il materiale basta, l'outline in `docs/piano-editoriale/ricerche/`.
