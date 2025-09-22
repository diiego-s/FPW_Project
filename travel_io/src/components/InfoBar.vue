<script setup>
    import { RouterLink } from 'vue-router';
</script>

<template>
    <div id="infobar" class="col-1">
         <article>
        <h2>Cosa facciamo</h2>
        <p>Con travel_io puoi trovare e prenotare pacchetti vacanza ed esperienze su misura, scegliendo tra centinaia di destinazioni. Grazie a una piattaforma leggera e reattiva, ti aiutiamo a confrontare le opzioni migliori in pochi secondi, ovunque ti trovi.</p>

        <h3>Perché scegliere travel_io</h3>
        <ul>
            <li>⚡ Interfaccia semplice e intuitiva</li>
            <li>🌍 Ampia scelta di destinazioni e attività</li>
            <li>💡 Filtri intelligenti per personalizzare ogni ricerca</li>
            <li>🔒 Prenotazioni sicure e gestione trasparente</li>
            <li>📱 Accessibile da desktop, tablet e smartphone</li>
        </ul>

        <h3>I nostri valori</h3>
        <p>In travel_io crediamo che ogni viaggio debba essere un’esperienza positiva, sia per chi parte sia per chi accoglie. Per questo ci impegniamo a promuovere un turismo consapevole, sostenibile e rispettoso delle culture locali. Collaboriamo solo con partner affidabili, selezionati per qualità e serietà.</p>

        <p>Hai bisogno di aiuto? Visita la nostra pagina contatti o scrivici: il nostro team è sempre pronto a supportarti, dalla prenotazione alla partenza.</p>   
    </article>
      </div>
</template>

<style>
    #infobar{
        background-color: var(--primary);
        color: var(--white);
        border-radius: 25px;
        margin-bottom: 5px;
        margin-top: 5px;
        padding-left: 70px;
        padding-right: 70px;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    #infobar a{
        color: var(--white);
    }
</style>