# 0004. Inglese alla radice, italiano sotto `/it/`

**Stato:** accettato · **Data:** 2026-10-20

## Contesto

Hugo è configurato con `defaultContentLanguage = "en"` e `defaultContentLanguageInSubdir = false`: l'inglese vive alla radice e l'italiano sotto `/it/`. Non esiste `/en/`. Tutti gli URL pubblicati finora seguono questo schema, e il sito in produzione risponde 200 su `/p/...` e 404 su `/en/p/...`. La lingua in cui scrivo per primo è l'italiano.

## Decisione

Lasciare lo schema com'è. L'inglese è la lingua di base del sito e vive alla radice, l'italiano resta sotto `/it/`. Non è una svista da correggere: è una scelta.

Alternative scartate: invertire la lingua di default per avere l'italiano alla radice e `/en/` per l'inglese (avrebbe rotto tutti i link `/it/...` esistenti e richiesto una revisione di URL e override); attivare `defaultContentLanguageInSubdir` (avrebbe lasciato la radice senza home).

## Conseguenze

- Nessun URL esistente si rompe, e i link già condivisi continuano a funzionare.
- La home e gli URL nudi sono in inglese: un visitatore italiano atterra sull'inglese e deve cambiare lingua.
- L'asimmetria resta visibile: non ci sarà mai un `/en/`, e chi se ne dimentica potrebbe "correggerla". Per questo è scritta qui e in `AGENTS.md`.
- Invertire la scelta in futuro è possibile ma costoso: va fatto con un ADR che supera questo e con una verifica di tutti gli URL.
