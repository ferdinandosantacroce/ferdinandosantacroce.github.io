# 0009. Blog unico con categorie tematiche e menu professionale

**Stato:** accettato · **Data:** 2026-10-20

## Contesto

Il piano editoriale propone sei sezioni tematiche (Racconti, Software, Team, Comunità, Talk e libri, Risorse), mentre il posizionamento professionale ne propone cinque diverse (Percorso, Progetti, Corsi, Workshop, Servizi). Sommarle significherebbe undici voci di menu, sezioni semivuote e due elenchi da tenere allineati.

Il tema Stack ha una sola navigazione, la barra laterale sinistra, resa come lista piatta: i sottomenu di Hugo non vengono disegnati. Ogni voce in più allunga quella lista, che è già a sette voci.

## Decisione

Un solo blog in `/p/`, senza sezioni tematiche separate: Software, Team, Comunità e Racconti diventano categorie o tag. Le sezioni professionali restano pagine.

Il menu principale ha sei voci: Home, Percorso, Lavora con me, Talks, Works, Contatti. «Lavora con me» è la pagina hub che raccoglie Progetti, Corsi, Workshop e Servizi. Archivio, Risorse e Ricerca escono dal menu e vivono nel footer del sito, tramite l'hook `layouts/_partials/footer/custom.html`, che Stack include anche negli articoli.

## Conseguenze

- Gli URL dei post non cambiano: nessun redirect da gestire.
- Non nascono sezioni che restano vuote per mesi. Una categoria senza articoli non fa danni, una sezione vuota sì.
- Le voci professionali hanno peso visivo senza nascondere Talks e Works, che restano credibilità.
- Il footer diventa parte della navigazione: va progettato con la stessa cura del menu, e non è visibile a colpo d'occhio come la barra laterale.
- Nessun codice del tema viene copiato, quindi l'aggiornamento settimanale non può rompere la navigazione. L'unico override è l'hook del footer.
- La pagina hub «Lavora con me» è il punto in cui I3 dovrà decidere come presentare servizi e corsi senza duplicare le singole pagine.
- Resta aperto il nome italiano delle voci: «Percorso» e «Lavora con me» vanno verificati sulla pagina, non solo nel menu.
