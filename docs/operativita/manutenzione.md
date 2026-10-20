# Manutenzione

Controlli periodici, in ordine di rischio. Se un controllo non si può fare, si annota perché, non si salta in silenzio.

## Ogni mese

1. **Build pulita**: `hugo --minify --gc --cleanDestinationDir`. Zero warning, zero errori.
2. **Controllo contenuti**: `bash scripts/check-content.sh --site public`. Deve uscire 0; se il debito traduzioni cresce, si vede nel report.
3. **Tema**: il cron settimanale aggiorna Stack e committa `CI: Update theme [ci skip]`. Leggere il diff di `go.mod` e verificare che la build del commit sia verde.
4. **Lighthouse** su home, un articolo e una pagina di serie, da mobile. Soglie: prestazioni sopra 90, accessibilità sopra 95. Un calo improvviso di solito è un'immagine o uno script nuovo.
5. **Immagini**: nessun file oltre 500 KB dentro `content/`. Le immagini dei bundle si servono già ottimizzate, ma l'originale resta nel repository.
6. **Link esterni**: campionare quelli aggiunti nel mese. I link interni sono già coperti dal controllo contenuti.
7. **Parità**: aprire `/it/` e verificare che le voci di menu portino alle pagine italiane, non a quelle inglesi.

## Ogni tre mesi

- Aggiornare Hugo alla versione usata in CI e allineare `.mise.toml`. Una versione diversa in locale è la causa più comune di build che passano in locale e falliscono in CI.
- Rileggere `docs/adr/`: se una decisione non è più valida, si scrive un ADR che la supera, non si modifica quello vecchio.
- Controllare le dipendenze del tema con `hugo mod tidy` e verificare che `go.mod` non abbia `// indirect` sulla dipendenza diretta.
- Ripulire `docs/contenuti/debito-traduzioni.md`: se una traduzione è ferma da mesi, decidere se farla o se tenerla in bozza, ma il file inglese resta nel bundle (parità stretta).

## Ogni anno

- Verificare la licenza dei contenuti e l'anno nel footer.
- Controllare che il dominio e il certificato HTTPS siano validi.
- Archiviare nel journal le decisioni dell'anno e aggiornare il piano con ciò che è cambiato.

## Segnali che qualcosa non va

| Sintomo | Prima cosa da guardare |
| --- | --- |
| Il menu porta a un 404 | una pagina è stata rinominata senza aggiornare `menu` |
| Le immagini italiane non si vedono | la pagina inglese del bundle è stata rimossa: le immagini vivono sotto il percorso EN |
| La pagina di serie è vuota | `series` scritto in modo diverso in una parte |
| Il build passa ma il sito è vecchio | il commit di testa ha `[ci skip]`: serve un commit di pubblicazione |
| Il tema si aggiorna e lo stile si rompe | un override in `layouts/` è diventato incompatibile: confrontare con il partial del tema |
