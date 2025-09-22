<script>
    import { RouterLink } from 'vue-router'
    import {useSessionStore} from '@/stores/session'

    export default {
        components:{
            RouterLink
        },
        data(){
            return{
                sessionStore: useSessionStore(),
            }
        },
        methods:{
            checkUser(){
                if(this.sessionStore.getUser() == null){
                    return false;
                } else {
                    return true;
                }
            }
        }
    }

</script>

<template>
    <nav id="navbar">
            <ul>
                <li><RouterLink exact-active-class="active" to = "/"><img class="icon" src="../assets/img/icon/home.png" alt="icona home">Home</RouterLink></li>
                <li><RouterLink exact-active-class="active" to="/about"><img class="icon" src="../assets/img/icon/about.png" alt="icona about">About</RouterLink></li>
                <li><RouterLink exact-active-class="active" to="/contacts"><img class="icon" src="../assets/img/icon/contacts.png" alt="icona contacts">Contatti</RouterLink></li>
                <li><RouterLink exact-active-class="active" to="/who"><img class="icon" src="../assets/img/icon/who.png" alt="icona who">Chi siamo</RouterLink></li>
                <li v-if="!checkUser()"><RouterLink exact-active-class="active" to="/login"><img class="icon" src="../assets/img/icon/globe.png" alt="icona holidayPackage">Pacchetti Viaggio</RouterLink></li>
                <li v-else><RouterLink exact-active-class="active" to="/holidayPackage"><img class="icon" src="../assets/img/icon/globe.png" alt="icona holidayPackage">Pacchetti Viaggio</RouterLink></li>
                <li v-show="!checkUser()"><RouterLink exact-active-class="active" to="/login"><img class="icon" src="../assets/img/icon/login.png" alt="icona login">Login</RouterLink></li>
                <li v-show="checkUser()"><RouterLink exact-active-class="active" to="/newPackage"><img class="icon" src="../assets/img/icon/newPackage.png" alt="icona newPackage">Nuovo Pacchetto</RouterLink></li>
                <li v-show="checkUser()"><RouterLink exact-active-class="active" to="/profile"><img class="icon" src="../assets/img/icon/profile.png" alt="icona profile">Profilo</RouterLink></li>
            </ul>
        </nav>
</template>

<style>
    .active{
        color: var(--tertiary);
        font-weight: bold;
    }
    .icon{
        margin-right: 10px;
        text-align: center;
    }

    nav li{
        list-style-type: none;
        display: inline-block;
        padding-left: 20px;
        padding-right: 15px;
        border-left: 2px solid var(--primary);
        margin-top: 10px;
        margin-bottom: 10px;
    }
    nav li > a{
        color: var(--black);
    }

    nav li:first-child{
        border-left: none;
    }

    a:link{
        text-decoration: none;
        font-size: 20px;
    }
    
    a:hover{
        font-weight: bold;
        color: var(--primary);
    }

    ul{
        margin-top: 0px;
        padding-left: 0px;
    }
</style>