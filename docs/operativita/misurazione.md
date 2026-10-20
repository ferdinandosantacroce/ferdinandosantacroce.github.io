# Misurazione

Cosa il sito espone già, cosa manca e cosa resta manuale.

## Analytics

Nessuno, per decisione (Q6 del piano). Non ci sono script di terze parti, cookie o banner di consenso. Se al lancio servirà un numero, la scelta cade su GoatCounter o Plausible, senza cookie, e richiede una pagina privacy aggiornata.

## Cosa c'è

| Strumento | Percorso | Note |
| --- | --- | --- |
| Sitemap index | `/sitemap.xml` | punta a `/en/sitemap.xml` e `/it/sitemap.xml` |
| Sitemap inglese | `/en/sitemap.xml` | contiene gli URL inglesi, che vivono alla radice |
| Sitemap italiana | `/it/sitemap.xml` | contiene gli URL italiani |
| RSS inglese | `/index.xml` | |
| RSS italiano | `/it/index.xml` | |
| robots.txt | `/robots.txt` | dichiara la sitemap |

Nota su `/en/`: Hugo crea `public/en/index.html` come pagina di redirect verso la radice, con `canonical` corretto. Non è una seconda copia del sito e non va rimossa a mano: sparisce solo cambiando configurazione della lingua, cosa che non vogliamo.

## Cosa resta manuale

1. **Search Console**: verificare la proprietà del dominio e inviare `https://ferdinandosantacroce.it/sitemap.xml`. Serve un account di Nando, quindi si fa al momento della pubblicazione.
2. **Controllo dopo il primo deploy**: aprire `/sitemap.xml`, `/en/sitemap.xml` e `/it/sitemap.xml` in produzione e verificare che rispondano 200.
3. **RSS**: iscriversi al feed italiano e a quello inglese con un lettore, per accorgersi se si rompe.

## Cosa non serve

- Un tag manager: non c'è nulla da taggare.
- UTM sui link interni: senza analytics non producono dati, e sporcano gli URL.
- Un conteggio visite lato server: GitHub Pages non lo espone.
