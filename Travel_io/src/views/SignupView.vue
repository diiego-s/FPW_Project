<script>
    import { RouterLink } from 'vue-router';
    import { useSessionStore } from '@/stores/session';
    import * as Auth from '@/utils/auth.js';

    export default{
        data(){
            return{
                username: '',
                password: '',
                name: '',
                surname: '',
                city: '',
                favCity: '',
                email: ''
            }
        },
        methods:{
            async login(){
                const data = await Auth.login(this.username, this.password);
                if(data.userId){
                    useSessionStore().setUser(data.userId);
                    this.$router.push('/');
                } else {
                    if (data.message === 'User not registered') {
                        alert('User not registered');
                    } else if (data.message === 'Invalid username or password') {
                        alert('Invalid password');
                    } else {
                        alert('Login failed');
                    }
                }
            }
        }
    }
</script>

<template>
    <div class="col-2">
        
        <form id="formLogin" action="signup" method="POST">
            <div id="headerForm">
                <img src="../assets/img/onlylogo.png" alt="logo di travel_io senza scritta" width="50">
                <br>
                <br>
                <h1 style="color: var(--white);">sign up</h1>
            </div>

            <br>

            <div class="boxForTwo">
                <div class="boxOne">
                    <label for="name">Nome</label>
                    <br>
                    <input type="text" name="name" v-model="name" />
                </div>
    
    
                <br>
                <br>
    
                <div class="boxTwo">
                    <label for="surname">Cognome</label>
                    <br>
                    <input type="text" name="surname" v-model="surname" />
                </div>
            </div>

            <br>
            <br>
            
            <label for="email">email</label>
            <br>
            <input type="email" name="email" v-model="email" />

            <br>
            <br>

            <div class="boxForTwo">

                <div class="boxOne">
                    <label for="city">Citta di residenza</label>
                    <br>
                    <input type="text" name="city" v-model="city" />
                </div>
    
                <br>
                <br>

                <div class="boxTwo">
                    <label for="favCity">Citta preferita</label>
                    <br>
                    <input type="text" name="favCity" v-model="favCity" />
                </div>
            </div>


            <br>
            <br>

            <label for="username">username</label>
            <br>
            <input type="text" name="username" v-model="username" />

            <br>
            <br>

            <label for="password">password</label>
            <br>
            <input type="password" name="password" v-model="password">

            <br>
            <br>

            <input type="submit" value="sign up" @click.stop.prevent="signup()">

        </form>

    </div>
</template>

<style>
    .boxForTwo{
        display: inline-flex;
    }

    .boxOne{
        float: left;
        margin-right: 15px;
    }

    .boxTwo{
        float: right;
        margin-left: 15px;
    }

    #formLogin{
        background: linear-gradient(180deg, var(--primary) 10%, var(--tertiary));
        color: var(--white);
        border-radius: 25px;
        text-align: center;
        padding: 15px;
        width: fit-content;

        margin: auto;
        margin-bottom: 26px;
        margin-top: 5px;
    }

    #formLogin input[type="submit"] {
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

    #formLogin input[type="submit"]:hover {
        background: rgba(255, 255, 255, 0.343);
        color: var(--white);
    }

    #headerForm img{
        float: left;
    }
</style>