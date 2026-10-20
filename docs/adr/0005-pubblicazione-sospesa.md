# 0005. Pubblicazione sospesa e rilascio esplicito

**Stato:** accettato · **Data:** 2026-10-20

## Contesto

Il sito è in ricostruzione e non deve andare online a metà. Il workflow di deploy partiva anche sulle pull request e lo step di pubblicazione non aveva condizioni: una PR dallo stesso repository poteva sovrascrivere `gh-pages`. In più, un aggiornamento automatico del tema poteva finire in produzione senza revisione.

## Decisione

La pubblicazione è un gesto esplicito e unico. Ogni commit termina con `[ci skip]`, il deploy gira solo su push verso `main` (mai su pull request), il cron del tema costruisce come cancello e committa con `[ci skip]`. Si pubblica con `git commit --allow-empty -m "chore: publish"` seguito da push, senza il marcatore nel commit di testa.

## Conseguenze

- Si può pushare liberamente senza pubblicare: il rischio di rilasci involontari sparisce.
- GitHub salta i workflow solo se il marcatore è nel commit di testa: dimenticarlo su un commit di publish significa non pubblicare, non pubblicare per sbaglio.
- Il sito online resta indietro rispetto a `main` finché non si pubblica: è voluto, ma va ricordato quando si controlla la produzione.
- La regola vive in `AGENTS.md` e nella skill `wrap-up`, altrimenti non è scopribile.
