---
title: Elastic Pair Programming
description: Un modo alternativo di fare pair programming
slug: elastic-pair-programming
date: 2021-04-12 00:00:00+0000
image: cover.jpg
categories:
    - Software
tags:
    - XP
weight:
---

Qualche tempo fa ho trascorso [una bella serata](https://blog.adrianbolboaca.ro/2018/03/remotepairprogramming-ep-009-adi-ferdinando-elastic-pair-programming/) insieme ad [Adrian Bolboacă](https://blog.adrianbolboaca.ro/), provando per la prima volta in pubblico una tecnica di _pair programming_ osservata e sperimentata nelle aziende in cui ho lavorato.  

In questo post vi racconto le caratteristiche di questo approccio.


## Il pair programming tradizionale

Il [pair programming](https://en.wikipedia.org/wiki/Pair_programming) è una pratica cardine di [eXtreme Programming](https://en.wikipedia.org/wiki/Extreme_programming) (XP), e non mi dilungherò nella sua spiegazione. Trovate una descrizione esaustiva sulla [vecchia e cara C2 Wiki](https://wiki.c2.com/?PairProgramming).  

Ci sono vari modi di fare pair programming; nel suo ultimo libro, "[Practical Remote Pair Programming](https://www.packtpub.com/product/practical-remote-pair-programming/9781800561366)", Adrian illustra molto bene alcuni degli approcci più utilizzati.  

Normalmente la pratica del pair programming è piuttosto disciplinata; i ruoli sono ben definiti, ci sono regole e tempi da rispettare.  

**La disciplina è uno dei punti di forza** della tecnica, soprattutto all’inizio del viaggio verso l’XP.  

Attraverso questa pratica, si innesca una continua collaborazione con i colleghi, rinforzando la capacità del singolo di comprendere ed elaborare i concetti di dominio.  

Dopo anni di pratica, un team stabile raggiunge una elevata padronanza del proprio dominio applicativo, delle tecnologie e delle tecniche adottate dal team.  

A quel punto, **il pair programming "classico" finisce spesso per andare stretto**, ed è in queste occasioni che è possibile allentare un po' le regole e passare ad una modalità di lavoro più elastica.


## Elastic pair programming

Il nome “_elastic pair programming_” è arrivato un po' a sorpresa; prima di confrontarmi con Adi non avevo mai pensato a questo approccio come a qualcosa di definito, a cui dare un nome.  

Nonostante questo, direi che la definizione rappresenta bene la caratteristica principale dell'approccio, ovvero l'elasticità di regole e ruoli.  

A dire il vero di regole ce n'è solo una: **ci si scambiano idee (e tastiera) in continuazione**.  

Ho trovato questo modo di lavorare molto utile in diverse situazioni.  

La più classica è quella in cui alla tastiera ci sono due persone che si conoscono da tempo, entrambe professionisti con esperienza.  

Non necessariamente si è esperti dello stesso dominio o delle stesse tecniche, anzi, spesso ho trovato interessante favorire il confronto tra punti di vista differenti.  

L'idea è quella che, di fronte ad un problema ostico o peculiare, uno sviluppatore esperto chiami in causa un suo pari per **condividere ed eventualmente confutare l'ipotesi di soluzione**, e giungere magari ad una soluzione migliore o inaspettata per entrambi. 

Ho usato questa tecnica spesso in modalità "_on-demand_", chiamando in causa colleghi che normalmente non fanno pair programming con me o in team in cui la pratica non era consuetudine.  

**La pratica risulta interessante anche per "sbloccare" colleghi scettici** rispetto alla pratica del pair programming.  

Mi è capitato infatti di essere accolto in un team di soli senior, tutti molto ferrati sul dominio applicativo, in cui ognuno sviluppava in maniera abbastanza indipendente dagli altri.  

Io avevo bisogno di imparare in fretta, così ho cercato di introdurre la pratica del pair programming nel team per favorire le occasioni di condivisione; nonostante i colleghi fossero disponibili, era abbastanza evidente per me la loro insofferenza verso le regole imposte dalla pratica.  

A quel punto, quando ho capito che l'esperimento pair programming sarebbe inesorabilmente fallito, ho cercato approcci e soluzioni per non perdere le opportunità di confronto, tanto utili per me (ma a tendere per l'intero team).  

In questa situazione abbiamo quindi rilassato le regole, concedendoci di prendere la tastiera in qualsiasi momento per intervenire. 

I test, le implementazioni e le soluzioni hanno iniziato quindi ad emergere con più facilità, e così le discussioni in merito ai dettagli del linguaggio, ai pattern, o ai differenti approcci che ognuno di noi, per la sua esperienza, ha accumulato durante gli anni.  

In questa situazione sono riuscito ad ottenere comunque i benefici della condivisione di conoscenza, molto importanti per me, rinunciando al "_side-effect_" (che comunque continuo ad apprezzare) della disciplina e della cadenza che da il pair programming tradizionale.  

Un'altra situazione che ricordo bene è quella che avveniva [quando mi confrontavo con i miei colleghi](https://www.intre.it/camp-2/) nelle gilde.  

Le [gilde](https://www.intre.it/gilde/) sono uno strumento molto potente che l'azienda ci metteva a disposizione per imparare, crescere e migliorare le nostre capacità. 

Nelle gilde, dei "team" creati ad-hoc lavorano ad un progetto proposto e scelto da loro, con il fine di esplorare nuove tecnologie o approcci.  

In situazioni come queste, molto rilassate ed aperte al confronto, abbiamo trovato beneficio nel lavorare in usando questo stile elastico di pair programming, ed è stato poi abbastanza naturale per noi evolvere fino a quello che oggi è normalmente indicato come [ensemble (Mob) programming](https://en.wikipedia.org/wiki/Mob_programming).  


## Trappole

Questa tecnica ha una sola regola, ma bisogna fare attenzione: **è proprio quando ci sono poche regole che è più facile sbagliare**.  

Questo approccio può diventare facilmente un sistema proprio per non fare pair programming; non avendo “obblighi”, è facile cadere nell'anti-pattern in cui il driver scrive codice e lavora da solo, mentre il navigator pensa ad altro...  

![l'Extreme Programming secondo Dilbert](dilbert-extreme-programming.png)

In questa situazione è meglio piuttosto tornare a lavorare ognun per sé, e riflettere magari a livello di team su cosa impedisce questo genere di collaborazione e quali alternative abbiamo per continuare a mantenere alto il flusso di informazioni tra le persone.  

**Anche in assetto da elastic pair programming si stabiliscono dei working agreement**, tra cui ad esempio tenere alla larga smartphone e distrazioni.  

In alcune occasioni ho lavorato in pair con un secondo computer oltre a quello principale, un po' come viene concesso anche in ensemble programming. Il computer secondario è di supporto: il navigator lo può usare ad esempio per cercare qualcosa in rete mentre il driver rimane focalizzato sul codice, non certo per farsi gli affari suoi. Il fine rimane sempre quello di scrivere codice e risolvere problemi insieme.

Un'altra raccomandazione è quella di non utilizzare questa tecnica senza avere esperienza di pair programming tradizionale, o fra due persone entrambe poco ferrate su tecnica e/o dominio. In questo caso si rischia facilmente di perdere la bussola e naufragare.  

Come recitava un famoso spot pubblicitario di qualche anno fa, elastic pair programming è [per molti, ma non per tutti](https://www.youtube.com/watch?v=vJ1wwYCGkIg&t=1s) 🙂  

Il trucco che utilizzo io per decidere se è il caso di usare questo approccio è farmi una semplice domanda: "_Sapresti risolvere da solo questo problema?_”. Se la risposta è qualcosa tipo “_Sì, ma sono curioso di sapere come lo risolverebbe -inserisci qui il nome-_", ci sono i presupposti per una buona sessione di elastic pair programming.  


## Elastic pair programming da remoto

L'esperienza con Adi mi ha fatto capire che questo stile può funzionare anche da remoto.  

Anzi, **la continua ricerca di consenso e lo scambio di ruoli mantiene alta l'attenzione delle persone**, impedendo che la distanza fisica abbassi il confronto e lo scambio di idee.  

Da qualche anno ho smesso di fare il programmatore a tempo pieno, anche se non di rado svolgo il mio lavoro di coach e trainer in team di sviluppo software.  

Nelle esperienze che ho maturato nell'ultimo anno e mezzo di lavoro remoto forzato ho potuto osservare l'efficacia di questo stile, anche se spesso le persone erano inconsapevoli di fare questo genere di pair programming 🙂


## Conclusioni

Non credo di aver inventato nulla di nuovo con questa tecnica, forse solo di aver dato un nome ad una pratica che molti programmatori già adottano da tempo.  

Spero che questa consapevolezza aggiunga una opzione in più nella vostra cassetta degli attrezzi 😉
