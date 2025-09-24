
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
                showForm: false,
                oldPassword: '',
                newPassword: '',
                newPassword1: '',
                newPassword2: '',
                maxCharOldPsw: 20,
                maxCharNewPsw1: 20,
                maxCharNewPsw2: 20,
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
            checkPassword(){
                if(this.newPassword1 === this.newPassword2){
                    if(this.newPassword1 !== this.oldPassword){
                        this.newPassword = this.newPassword1;
                        return true;
                    }
                    else{
                        alert('Current password and new password cannot be the same');
                        return false;
                    }
                } else {
                    alert('the new passwords arent the same');
                    return false;
                }
            },
            async changePsw(){
                if (!this.checkPassword()) return;
                const data = await Auth.changePsw(this.username, this.oldPassword, this.newPassword);
                if(data.message === 'User not found') {
                    alert('User not found');
                } else if(data.message === 'Invalid current password') {
                    alert('Invalid current password');
                } else if(data.message === 'Unexpected error while updating password') {
                    alert('Unexpected error');
                } else if(data.message === 'Password updated successfully') {
                    alert('Password changed correctly')
                    this.$router.push('/profile');
                }
            },
            checkNumCharOldPsw() {
                if(this.oldPassword.length > this.maxCharOldPsw){
                    this.oldPassword = this.oldPassword.substring(0, this.maxCharOldPsw);
                }
            },
            checkNumCharNewPsw1() {
                if(this.newPassword1.length > this.maxCharNewPsw1){
                    this.newPassword1 = this.newPassword1.substring(0, this.maxCharNewPsw1);
                }
            },
            checkNumCharNewPsw2() {
                if(this.newPassword2.length > this.maxCharNewPsw2){
                    this.newPassword2 = this.newPassword2.substring(0, this.maxCharNewPsw2);
                }
            },
            allowButton(){
                return this.oldPassword === '' || this.newPassword1 === '' || this.newPassword2 === '';
            }
        },
        mounted(){
            this.getUser();
            this.allowButton();
        }
    }
</script>

<template>
    <div>
        <div id="profileBox">
            <h1 v-if="userInfo.name">Benvenuto/a {{ userInfo.name }} {{ userInfo.surname }}</h1>
            <div class="boxForTwo">
                <div class="boxOne">
                    <img id="profilePic" :src="getUrlImage()" alt="foto profilo" width="200">
                </div>
                <br>
                <div class="boxTwo" id="infoProfile">
                    <h4>username: </h4><span>{{ userInfo.username }}</span><br><br>
                    <h4>email: </h4><span>{{ userInfo.email }}</span><br><br>
                    <h4>citta provenienza: </h4><span>{{ userInfo.city }}</span><br><br>
                    <h4>citta dei sogni: </h4><span>{{ userInfo.fav_city }}</span><br><br>
                    <h4>anni: </h4><span>{{ userInfo.age }}</span>
                </div>
            </div>
            <br>
    
            <a id="changepsw" v-if="!showForm" @click="showForm = !showForm">cambia password</a>
            <div v-else>
                <form id="formChangePsw" action="changePsw" method="POST">
                    <div id="headerForm">  
                        <table>
                            <tbody>
                                <tr>
                                    <td><a @click="showForm = !showForm"><img src="../assets/img/icon/arrowWhite.png" alt="icona freccia sinistra" /></a></td>
                                    <td><img src="../assets/img/onlylogo.png" alt="logo di travel_io senza scritta" width="50"/></td>
                                </tr>
                            </tbody>
                        </table>   
                    </div>
        
                    <label for="oldPassword">password attuale</label>
                    <br>
                    <input type="password" name="oldPassword" v-model="oldPassword" @input="checkNumCharOldPsw()" /><span class="counter">{{ oldPassword.length }}/20</span>
        
                    <br>
                    <br>
        
                    <label for="newPassword1">nuova password</label>
                    <br>
                    <input type="password" name="newPassword1" v-model="newPassword1" @input="checkNumCharNewPsw1()"><span class="counter">{{ newPassword1.length }}/20</span>
        
                    <br>
                    <br>
                    
                    <label for="newPassword2">nuova password</label>
                    <br>
                    <input type="password" name="newPassword2" v-model="newPassword2" @input="checkNumCharNewPsw2()"><span class="counter">{{ newPassword2.length }}/20</span>
        
                    <br>
            
                    <input type="submit" value="cambia password" @click.stop.prevent="changePsw()" @click="showForm = !showForm" :disabled="allowButton()">
                </form>
            </div>
    
            <input @click="logout()" type="submit" value="logout"></input>
        </div>
    </div>
</template>

<style>
    #infoProfile{
        background-color: rgba(128, 128, 128, 0.144);
        border-radius: 25px;
        padding: 15px;
    }
    
    #changepsw{
        font-size: 16px;
        text-decoration: underline;
        color: var(--black);
        float: right;
    }

    #profilePic{
        border-radius: 25px;
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

    #profileBox input[type="submit"]:disabled {
        cursor: not-allowed;
    }

    #formChangePsw{
        background: linear-gradient(180deg, var(--primary) 10%, var(--tertiary));
        color: var(--white);
        border-radius: 25px;
        text-align: center;
        width: fit-content;
        padding: 15px;

        width: 60%;
        margin-bottom: 26px;
        margin-top: 5px;
    }

    #formChangePsw input[type="submit"] {
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

    #formChangePsw input[type="submit"]:hover {
        background: rgba(255, 255, 255, 0.343);
        color: var(--white);
    }

    #headerForm img{
        display: inline;
    }

</style>