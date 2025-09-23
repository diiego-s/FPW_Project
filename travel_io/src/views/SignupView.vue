<script>
    import * as Api from '@/utils/apis';

    export default{
        data(){
            return{
                username: '',
                password: '',
                name: '',
                surname: '',
                city: '',
                favCity: '',
                email: '',
                age: 16,
                usernameList: []
            }
        },
        methods:{
             async signup() {
                this.getUserByUsername();
                const data = await Api.addUser(this.username, this.password,
                    this.name, this.surname, this.email,
                    this.city, this.favCity, this.age);
                if(data){
                    alert('user added');
                    this.$router.push('/');
                } else {
                    alert('error');
                }
            },
            getUserByUsername() {
                this.usernameList.forEach(user => {
                    if(user.name === this.name){
                        this.username = user.username;
                    }
                });
            }
        }
    }
</script>

<template>
    <div>

        <div id="boxArrow">
            <br>
            <RouterLink id="backwards" to="/login"><img src="../assets/img/icon/arrow.png" alt="icona freccia sinistra">login</RouterLink>
        </div>
        
        <form id="formSignUp" action="signup" method="POST">
            <div id="headerForm">
                <img src="../assets/img/onlylogo.png" alt="logo di travel_io senza scritta" width="50">
                <br>
                <br>
                <h1 style="color: var(--white);">signup</h1>
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

            <label for="age">et&agrave;</label>
            <br>
            <input type="number" name="age" min="16" max="99" v-model="age" /><br>
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
    #formSignUp{
        background: linear-gradient(180deg, var(--primary) 10%, var(--tertiary));
        color: var(--white);
        border-radius: 25px;
        text-align: center;
        padding: 15px;
        width: fit-content;

        margin: auto;
        margin-bottom: 26px;
        margin-top: 10%;
    }

    #formSignUp input[type="submit"] {
        background: rgba(255, 255, 255, 0.489);
        color: var(--white);
        font-weight: bold;
        cursor: pointer;

        padding: 10px;
        border: none;
        border-radius: 5px;
        margin-top: 15%;
        width: 68%;
    }

    #formSignUp input[type="submit"]:hover {
        background: rgba(255, 255, 255, 0.343);
        color: var(--white);
    }

    #headerForm img{
        float: left;
    }
</style>