
<script>
    import { useSessionStore } from '@/stores/session';
    import * as Auth from '@/utils/auth.js';
    import * as Api from '@/utils/apis';

    export default {
        data(){
            return{
                username: '',
                userInfo: [],
                sessionStore: useSessionStore(),
            }
        },
        methods: {
            async logout(){
                await Auth.logout();
                this.sessionStore.setUser(null);
                this.$router.push('/');
            },
            async getUser(){
                this.username = this.sessionStore.getUser();
                if(this.username){
                    const data = await Api.getUserInfo(this.username);
                    this.userInfo = data[0];
                }
            },
            getUrlImage() {
                return new URL(`../assets/img/admin/${this.userInfo.photo}`, import.meta.url);
            },
        },
        mounted(){
            this.getUser();
        }
    }
</script>

<template>
    <div class="col-2" id="profileBox">
        <h1 v-if="userInfo.name">Benvenuto {{ userInfo.name }} {{ userInfo.surname }}</h1>
        <div>
            <img :src="getUrlImage()" alt="foto profilo" width="200">
            <p>username: {{ userInfo.username }}</p>
            <p>email: {{ userInfo.email }}</p>
            <p>citta provenienza: {{ userInfo.city }}</p>
            <p>citta dei sogni: {{ userInfo.fav_city }}</p>
            <p>anni: {{ userInfo.age }}</p>
        </div>
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