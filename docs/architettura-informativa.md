# Architettura informativa

Decisione del 2026-10-20, task I1. Fissa albero degli URL, menu, footer e confini tra le sezioni. Le scelte strutturali sono nell'ADR [0009](adr/0009-blog-unico-e-menu-professionale.md); qui c'è la traduzione operativa in URL e pagine.

## 1. Principi

1. **Un solo blog.** I contenuti editoriali vivono tutti in `/p/`. I temi (software, team, comunità, racconti) sono categorie e tag, non sezioni con URL propri.
2. **Le sezioni professionali sono pagine.** Percorso, progetti, corsi, workshop e servizi raccontano il lavoro, non il flusso degli articoli.
3. **Sei voci di menu.** La barra laterale di Stack è piatta e non gestisce sottomenu: ogni voce aggiunta toglie spazio alle altre. Archivio, risorse e ricerca stanno nel footer.
4. **Gli URL esistenti non cambiano.** Post, talk, works e pagine già pubblicate mantengono l'indirizzo: nessun redirect da mantenere.
5. **Niente sezioni vuote.** Una pagina si crea quando ha contenuto. Le categorie senza articoli non fanno danni, una sezione vuota sì.

## 2. Mappa degli URL

### Contenuti che esistono già

| Area | Inglese | Italiano | Tipo | Note |
| --- | --- | --- | --- | --- |
| Home | `/` | `/it/` | home | blog e ritratto |
| Articoli | `/p/<slug>/` | `/it/p/<slug>/` | post | slug per lingua |
| Serie | `/series/<nome>/` | `/it/series/<nome>/` | tassonomia | 11 parti Git |
| Categorie | `/categories/<nome>/` | `/it/categories/<nome>/` | tassonomia | oggi solo `software` |
| Tag | `/tags/<nome>/` | `/it/tags/<nome>/` | tassonomia | liberi |
| About | `/about/` | `/it/a-proposito-di-me/` | pagina | |
| Talk | `/talks/` | `/it/talks/` | sezione | 30 interventi |
| Lavori | `/works/` | `/it/works/` | sezione | libri e articoli |
| Risorse | `/resources/` | `/it/resources/` | pagina | con `oop/` e `tdd/` |
| Archivio | `/archives/` | `/it/archivio/` | pagina | |
| Cerca | `/search/` | `/it/cerca/` | pagina | |

### Pagine professionali da creare

| Area | Inglese | Italiano | Tipo | Menu |
| --- | --- | --- | --- | --- |
| Percorso | `/career/` | `/it/percorso/` | pagina | sì |
| Lavora con me | `/work-with-me/` | `/it/lavora-con-me/` | pagina hub | sì |
| Contatti | `/contact/` | `/it/contatti/` | pagina | sì |
| Servizi | `/services/` | `/it/servizi/` | pagina | dal hub |
| Progetti | `/projects/<slug>/` | `/it/projects/<slug>/` | sezione | dal hub |
| Corsi | `/courses/<slug>/` | `/it/courses/<slug>/` | sezione | dal hub |
| Workshop | `/workshops/<slug>/` | `/it/workshops/<slug>/` | sezione | dal hub |

Nota sui segmenti di sezione: `talks`, `works`, `projects`, `courses`, `workshops` restano in inglese anche sotto `/it/`, come già accade oggi per talk e works. Localizzare il segmento di una sezione significa o duplicare la cartella dei contenuti o impostare `url` a mano su ogni pagina; il gioco non vale la candela. Gli slug delle singole pagine e delle pagine statiche restano invece localizzati, come già fa `a-proposito-di-me`.

## 3. Menu principale

| # | Inglese | Italiano | Destinazione | Icona |
| --- | --- | --- | --- | --- |
| 1 | Home | Home | `/` | `home` |
| 2 | Career | Percorso | `/career/` | `route` |
| 3 | Work with me | Lavora con me | `/work-with-me/` | `briefcase` |
| 4 | Talks | Talk | `/talks/` | `speakerphone` |
| 5 | Works | Lavori | `/works/` | `brain` |
| 6 | Contact | Contatti | `/contact/` | `mail` |

Il menu si cambia in un colpo solo quando le pagine nuove esistono. Fino a quel momento restano le sette voci attuali: una voce che porta a un 404 è peggio di un menu lungo.

## 4. Footer

Il footer è parte della navigazione, non un riempitivo. Contiene, in quest'ordine:

1. le voci secondarie: Archivio, Risorse, Cerca;
2. i link social già presenti (mail, LinkedIn, GitHub, Mastodon);
3. la licenza dei contenuti e l'anno;
4. il cambio lingua, che Stack gestisce già nella barra laterale: nel footer non si duplica.

Si implementa con `layouts/_partials/footer/custom.html`, l'hook previsto dal tema. Non si copia `sidebar/left.html`: ogni aggiornamento settimanale del tema diventerebbe un merge da fare a mano.

## 5. Home

Quattro blocchi, nell'ordine:

1. **Ritratto**: due o tre righe su chi sei e cosa fai oggi, con il link a Percorso e a Lavora con me.
2. **Da dove cominciare**: tre articoli scelti, non i più recenti. Devono funzionare come porta d'ingresso per chi arriva da fuori.
3. **Ultimi articoli**: il flusso normale del blog.
4. **Una selezione**: due o tre tra talk, libri e progetti, per mostrare che il sito non è solo un blog.

La home non è un archivio: l'archivio ha la sua pagina.

## 6. Lavora con me (hub)

Una pagina di orientamento, non un duplicato delle altre. Struttura:

1. mezza pagina su come lavori e con chi;
2. quattro schede: Progetti, Corsi, Workshop, Servizi, ognuna con una riga di sintesi e il link;
3. come si avvia una collaborazione, con il link a Contatti.

Le schede compaiono solo quando la sezione corrispondente ha almeno un contenuto pubblicabile. Fino ad allora l'hub resta corto: meglio una pagina onesta di tre paragrafi che quattro card vuote.

## 7. Blog e categorie

Categorie previste:

| Categoria | Cosa contiene | Stato |
| --- | --- | --- |
| Software | legacy, refactoring, Git, TDD, architettura, strumenti | attiva |
| Team | collaborazione, pair programming, coaching, leadership | da attivare col primo articolo |
| Comunità | conferenze, meetup, organizzazione, community building | da attivare col primo articolo |
| Racconti | episodi personali e professionali che non stanno altrove | da attivare col primo articolo |

Le categorie si creano dal primo articolo che le usa: non si precreano pagine vuote. I tag restano liberi e non hanno una lista curata.

## 8. Cosa non cambia

- I post restano in `/p/<slug>/`, con slug per lingua.
- La serie Git resta in `/series/git-the-stupid-content-tracker/`.
- Talk e works mantengono gli indirizzi attuali.
- Il tema non viene forked: si usano solo hook e override mirati.
- La lingua di base resta l'inglese alla radice.

## 9. Punti aperti

- **Nomi italiani**: "Percorso" e "Lavora con me" vanno verificati sulla pagina, non solo nel menu. "Lavori" per Works è la scelta attuale, ma resta un po' generico.
- **Servizi**: se il sito non vende nulla in modo esplicito, la pagina può diventare parte del hub invece di essere separata. Decidere quando ci sarà il primo contenuto.
- **Progetti anonimi**: le schede con visibilità riservata non vanno pubblicate. Il campo `visibility` esiste nel piano editoriale, non ancora nello schema front matter.
- **Ordine di implementazione**: pagine in I4, template di sezione in I3, menu e footer quando le destinazioni esistono.

## 10. Verifica

- `bash scripts/check-content.sh --site public` non deve segnalare link rotti dopo lo switch del menu.
- Ogni voce di menu deve portare a una pagina che esiste in entrambe le lingue.
- Il footer deve comparire anche negli articoli, non solo nelle liste.
