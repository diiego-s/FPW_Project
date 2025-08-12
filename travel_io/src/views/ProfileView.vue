
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
        <input @click="logout()" type="submit" value="logout"></input>
    </div>
</template>

<style>
    #profileBox input[type="submit"] {
        background: var(--primary);
        color: var(--white);
        font-weight: bold;
        cursor: pointer;

        padding: 10px;
        border: none;
        border-radius: 5px;
        margin-top: 20px;
        width: fit-content;
    }

    #profileBox input[type="submit"]:hover {
        background: rgba(16, 112, 190, 0.343);
        color: var(--white);
    }
</style>