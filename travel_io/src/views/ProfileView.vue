
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
        <h1 v-if="userInfo.name">Benvenuto/a {{ userInfo.name }} {{ userInfo.surname }}</h1>
        <div class="boxForTwo">
            <div class="boxOne">
                <img :src="getUrlImage()" alt="foto profilo" width="200">
            </div>
            <div class="boxTwo">
                <br>
                <h4>username: </h4><span>{{ userInfo.username }}</span><br><br>
                <h4>email: </h4><span>{{ userInfo.email }}</span><br><br>
                <h4>citta provenienza: </h4><span>{{ userInfo.city }}</span><br><br>
                <h4>citta dei sogni: </h4><span>{{ userInfo.fav_city }}</span><br><br>
                <h4>anni: </h4><span>{{ userInfo.age }}</span>
            </div>
        </div>
        <br>
        <input @click="logout()" type="submit" value="logout"></input>
    </div>
</template>

<style>
    h4{
        color: var(--tertiary);
        display: inline;
    }


    #profileBox{
        margin-bottom: 15px;
    }


    #profileBox input[type="submit"] {
        background: var(--primary);
        color: var(--white);
        font-weight: bold;
        cursor: pointer;
        font-size: 15px;

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