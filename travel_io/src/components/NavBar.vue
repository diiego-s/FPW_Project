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
    <nav id="navbar" :class="{logged: checkUser(), guest: !checkUser()}">
            <ul>
                <li><RouterLink to = "/"><img class="icon" src="../assets/img/icon/home.png" alt="icona home">Home</RouterLink></li>
                <li><RouterLink to="/who"><img class="icon" src="../assets/img/icon/who.png" alt="icona who">Chi siamo</RouterLink></li>
                <li><RouterLink to="/holidayPackage"><img class="icon" src="../assets/img/icon/globe.png" alt="icona holidayPackage">Pacchetti Viaggio</RouterLink></li>
                <li v-show="!checkUser()"><RouterLink to="/login"><img class="icon" src="../assets/img/icon/login.png" alt="icona login">Login</RouterLink></li>
                <li v-show="checkUser()"><RouterLink to="/newPackage"><img class="icon" src="../assets/img/icon/newPackage.png" alt="icona newPackage">Nuovo Pacchetto</RouterLink></li>
                <li v-show="checkUser()"><RouterLink to="/login"><img class="icon" src="../assets/img/icon/profile.png" alt="icona profile">Profilo</RouterLink></li>
            </ul>
        </nav>
</template>

<style>
    #navbar .router-link-exact-active{
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