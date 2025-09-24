<script>
    import { RouterLink } from 'vue-router';
    import { useSessionStore } from '@/stores/session';
    import * as Auth from '@/utils/auth.js';

    export default{
        data(){
            return{
                username: '',
                password: '',
                maxCharUser: 20,
                minCharUser: 1,
                maxCharPsw: 20,
                minCharPsw: 1,
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
            },
            checkNumCharUser() {
                if(this.username.length > this.maxCharUser){
                    this.username = this.username.substring(0, this.maxCharUser);
                }
            },
            checkNumCharPsw() {
                if(this.password.length > this.maxCharPsw){
                    this.password = this.password.substring(0, this.maxCharPsw);
                }
            }
        }
    }
</script>

<template>
    <div>
        
        <form id="formLogin" action="login" method="POST">
            <div id="headerForm">
                <img src="../assets/img/onlylogo.png" alt="logo di travel_io senza scritta" width="50">
                <br>
                <br>
                <h1 style="color: var(--white);">login</h1>
            </div>

            <br>

            <label for="username">username</label>
            <br>
            <input type="text" name="username" v-model="username" @input="checkNumCharUser()" /><span class="counter">{{ username.length }}/20</span>

            <br>
            <br>

            <label for="password">password</label>
            <br>
            <input type="password" name="password" v-model="password" @input="checkNumCharPsw()" /><span class="counter">{{ password.length }}/20</span>

            <br>
            <br>

            <label>Non hai un account? Registrati</label>
            <br>
            <label for="signup"><RouterLink id="signup" to="/signup">signup</RouterLink></label>

            <br>

            <input type="submit" value="login" @click.stop.prevent="login()">

        </form>

    </div>
</template>

<style>

    .counter{
        margin-left: 5px;
    }

    #formLogin{
        background: linear-gradient(180deg, var(--primary) 10%, var(--tertiary));
        color: var(--white);
        border-radius: 25px;
        text-align: center;
        width: 60%;
        padding: 15px;

        margin: auto;
        margin-bottom: 26px;
        margin-top: 15%;
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

    #signup{
        font-size: 15px;
        text-decoration: underline;
        color: white;
    }
</style>