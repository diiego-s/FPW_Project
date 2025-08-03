<script setup>
    import { RouterLink } from 'vue-router';
</script>

<template>
    <nav id="navbar">
            <ul>
                <li><RouterLink to = "/"><img class="icon" src="../assets/img/home.png" alt="icona home">Home</RouterLink></li>
                <li><RouterLink><img class="icon" src="../assets/img/about.png" alt="icona about">About</RouterLink></li>
                <li><RouterLink><img class="icon" src="../assets/img/contacts.png" alt="icona contacts">Contatti</RouterLink></li>
                <li><RouterLink><img class="icon" src="../assets/img/who.png" alt="icona who">Chi siamo</RouterLink></li>
                <li><RouterLink><img class="icon" src="../assets/img/newPackage.png" alt="icona newPackage">Nuova Pacchetto</RouterLink></li>
                <li><RouterLink><img class="icon" src="../assets/img/login.png" alt="icona login">Login</RouterLink></li>
                <li><RouterLink><img class="icon" src="../assets/img/profile.png" alt="icona profile">Profilo</RouterLink></li>
            </ul>
        </nav>
</template>

<style>
    .icon{
        margin-right: 10px;
        text-align: center;
    }
    nav li{
        list-style-type: none;

        display: inline-block;
        padding-left: 20px;
        padding-right: 20px;
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
    }
</style>