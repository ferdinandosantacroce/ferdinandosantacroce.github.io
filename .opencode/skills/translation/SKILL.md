---
name: translation
description: Use when translating an Italian article into English, when reviewing an English translation for voice and parity, or when writing the English side of a bilingual bundle. Covers the approved voice, the workflow, the technical glossary and the checks before calling a translation done.
---

# Traduzione e revisione EN

Il sito è bilingue con parità stretta: ogni bundle ha `index.it.md` e `index.en.md` dal primo commit. L'italiano è la lingua di scrittura, l'inglese è una traduzione, non un secondo originale. Questa skill dice come si traduce e come si revisiona.

## La voce approvata

- **Prima persona.** Chi scrive è Nando, non un'azienda.
- **Tono asciutto.** Frasi brevi, verbi concreti, niente entusiasmo da brochure.
- **Niente inglese da marketing:** *passionate about*, *leverage*, *seamless*, *journey*, *empower*, *cutting-edge*, *game-changer*. Se una frase suona come una pagina prodotti, va riscritta.
- **Si mantengono le imperfezioni dell'originale:** l'ironia, i dubbi, le parentesi, i dettagli personali. Una traduzione troppo liscia è una traduzione sbagliata.
- **Si mantengono gli esempi.** Se un episodio è italiano (un cliente, una conferenza, un modo di dire), resta italiano e, se serve, si spiega in mezza riga. Non si sostituisce con un equivalente anglosassone.
- **I titoli si scrivono per il lettore inglese**, non si traducono parola per parola. Se un gioco di parole non sopravvive, si sceglie la chiarezza.

## Procedura

1. **Leggi tutto l'italiano prima di scrivere una riga.** Capire la scena e il punto, non solo le frasi.
2. **Traduci a paragrafi interi**, nell'ordine. Non frase per frase, non con un traduttore automatico lasciato a metà.
3. **Front matter:** `title` e `description` sono nuovi testi inglesi; `slug` è lo slug inglese, diverso da quello italiano quando la traduzione lo suggerisce; `series`, `part`, `source`, `source_date`, `categories`, `tags` restano identici; `date` resta la data originale di pubblicazione.
4. **Corpo:** stessa struttura di titoli, stesso ordine delle immagini, stessi link. I percorsi delle immagini non cambiano: sono gli stessi file del bundle. I blocchi di codice non si traducono, compresi i commenti.
5. **Note e avvertenze:** la nota sulla fonte e la "Nota 2026" hanno un equivalente inglese, non sono omesse.
6. **Rileggi ad alta voce.** Se inciampi, la frase è troppo lunga o troppo scritta.

## Glossario

Termini che restano in inglese anche nell'italiano, e che nell'inglese non vanno "tradotti" in altro:

| Italiano | Inglese |
| --- | --- |
| refactoring | refactoring |
| codice legacy | legacy code |
| pair programming, mob programming | invariati |
| kata, coding kata | invariati |
| trunk-based development | invariato |
| test unitario | unit test |
| integrazione continua | continuous integration |
| consegna continua | continuous delivery |
| debito tecnico | technical debt |
| retrospettiva | retrospective |
| tavola rotonda | panel discussion |
| intervento, talk | talk |
| slide | slides |
| workshop | workshop |
| fixture | fixture |

Attenzione ai falsi amici: *eventualmente* non è *eventually*; *attualmente* non è *actually*; *confidenza* non è *confidence*; *parentesi* non è *parenthesis* quando significa digressione.

## Cosa non fare

- Non aggiungere fatti, esempi o link che l'italiano non ha.
- Non ammorbidire un giudizio per paura di sembrare duro: la voce è la stessa.
- Non cambiare la struttura dei titoli per "migliorare" la SEO.
- Non correggere l'italiano mentre traduci: se l'originale ha un errore, si corregge prima nell'italiano, poi si traduce.
- Non lasciare segnaposto, TODO o frasi in italiano nel file inglese.

## Revisione: checklist

- [ ] Il titolo inglese si capisce da solo, senza conoscere l'italiano.
- [ ] La `description` sta in una riga e dice cosa ottiene il lettore.
- [ ] Nessun calco: "make a question" invece di "ask a question", "bring a coffee" invece di "get a coffee".
- [ ] Gli articoli determinativi e indeterminativi non sono stati tradotti meccanicamente (`the` dove non serve).
- [ ] I tempi verbali sono coerenti: il racconto al passato, le considerazioni al presente.
- [ ] I nomi propri, i prodotti e le città sono scritti come in italiano, senza anglicizzazioni.
- [ ] I link puntano alle stesse destinazioni, con lo stesso testo significativo.
- [ ] Le immagini hanno un `alt` sensato in inglese, non vuoto.
- [ ] Il conteggio parole è tra il 90% e il 120% dell'italiano. Molto sotto: manca qualcosa. Molto sopra: hai spiegato troppo.

## Verifica finale

```bash
hugo --minify --gc --cleanDestinationDir
bash scripts/check-content.sh --site public
```

Il controllo segnala lati mancanti, front matter vuoto, immagini inesistenti, slug duplicati, serie con buchi e link interni rotti. Se il file inglese è ancora una bozza, `draft: true` è ammesso: la parità strutturale resta, il debito finisce in `docs/contenuti/debito-traduzioni.md`.

Una traduzione non si pubblica senza revisione umana di Nando sulla voce. Il controllo automatico verifica la forma, non se suona come lui.
