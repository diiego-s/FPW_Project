<script>
    import AdminCard from '@/components/AdminCard.vue';
    import * as Api from '@/utils/apis.js'

    export default {
        components: {
            AdminCard,
        },
        data(){
            return {
                adminCards: []
            }
        },
        methods: {
            async getAdmin(){
                const data = await Api.getAdmin();
                this.adminCards = data;
            }
        },
        mounted(){
            this.getAdmin();
        }
    }
</script>

<template>
    <div>
        <h1>Chi siamo</h1>
        <p><strong>travel_io</strong> nasce dalla passione per i viaggi e dalla volontà di semplificare la vita a chi sogna di partire. Il nostro obiettivo è offrire un’esperienza di prenotazione intuitiva, veloce e sicura, mettendo a disposizione strumenti smart e offerte sempre aggiornate per esplorare il mondo con un clic.</p>

        <div id="admincard" v-for="admin in adminCards" :key="admin.id">
            <AdminCard :name = "admin.name" :surname = "admin.surname" :description = "admin.description" :photo = "admin.photo">
            </AdminCard>
        </div>
        
  
    </div>
</template>