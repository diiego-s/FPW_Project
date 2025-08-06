<script>
    import { useSessionStore } from '@/stores/session';
    import * as Auth from '@/utils/auth.js';

    export default{
        data(){
            return{
                username: '',
                password: ''
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
        
        <form id="formLogin" action="login" method="POST">
            <div id="headerForm">
                <img src="../assets/img/onlylogo.png" alt="logo di travel_io senza scritta" width="50">
                <br>
                <br>
                <h1 style="color: var(--white);">Login</h1>
            </div>

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

            <input type="submit" value="login" @click.stop.prevent="login()">

        </form>

    </div>
</template>

<style>
    #formLogin{
        background: linear-gradient(180deg, var(--primary) 10%, var(--tertiary));
        color: var(--white);
        border-radius: 25px;
        text-align: center;
        width: 50%;
        padding: 15px;

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