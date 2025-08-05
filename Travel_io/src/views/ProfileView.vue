
<script>
    import { useSessionStore } from '@/stores/session';
    import * as Auth from '@/utils/auth.js';

    export default {
        data(){
            return{
                username: '',
                sessionStore: useSessionStore(),
            }
        },
        methods: {
            async logout(){
                await Auth.logout();
                this.sessionStore.setUser(null);
                this.$router.push('/');
            },
            getUser(){
                this.username = this.sessionStore.getUser();
            }
        },
        mounted(){
            this.getUser();
        }
    }
</script>

<template>
    <div class="col-2" id="profileBox">
        <h1>Benvenuto {{ username }}</h1>
        <button @click="logout()">Logout</button>
    </div>
</template>

<style>
    #profileBox input[type="submit"] {
        background: rgba(255, 255, 255, 0.489);
        color: var(--white);
        font-weight: bold;
        cursor: pointer;

        padding: 10px;
        border: none;
        border-radius: 5px;
        margin-top: 20px;
        width: 68%;
    }

    #profileBox input[type="submit"]:hover {
        background: rgba(255, 255, 255, 0.343);
        color: var(--white);
    }
</style>