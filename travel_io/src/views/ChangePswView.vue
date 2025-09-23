<script>
    import { RouterLink } from 'vue-router';
    import { useSessionStore } from '@/stores/session';
    import * as Auth from '@/utils/auth.js';

    export default{
        data(){
            return{
                username: '',
                oldPassword: '',
                newPassword: '',
                newPassword1: '',
                newPassword2: '',
                sessionStore: useSessionStore()
            }
        },
        methods:{
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
            getUser(){
                this.username = this.sessionStore.getUser();
            },
        },
        mounted() {
            this.getUser();
        }
    }
        
</script>

<template>

    <div>
        
        <div id="boxArrow">
            <br>
            <RouterLink id="backwards" to="/profile"><img src="../assets/img/icon/arrow.png" alt="icona freccia sinistra">profilo</RouterLink>
        </div>
    
        <div>
            <form id="formChangePsw" action="changePsw" method="POST">
                    <div id="headerForm">
                        <img src="../assets/img/onlylogo.png" alt="logo di travel_io senza scritta" width="50">
                        <br>
                        <br>
                        <h1 style="color: var(--white);">Cambia password</h1>
                    </div>
        
                    <br>
        
                    <label for="oldPassword">password attuale</label>
                    <br>
                    <input type="password" name="oldPassword" v-model="oldPassword" />
        
                    <br>
                    <br>
        
                    <label for="newPassword1">nuova password</label>
                    <br>
                    <input type="password" name="newPassword1" v-model="newPassword1">
        
                    <br>
                    <br>
                    
                    <label for="newPassword2">nuova password</label>
                    <br>
                    <input type="password" name="newPassword2" v-model="newPassword2">
        
                    <br>
                    <br>
                    <br>
        
                    <input type="submit" value="cambia password" @click.stop.prevent="changePsw()">
        
                </form>
        </div>
    </div>


</template>
<style>
    #formChangePsw{
        background: linear-gradient(180deg, var(--primary) 10%, var(--tertiary));
        color: var(--white);
        border-radius: 25px;
        text-align: center;
        width: fit-content;
        padding: 15px;

        margin: auto;
        margin-bottom: 26px;
        margin-top: 5px;
    }

    #backwards:visited{
        color: var(--black);
    }

    #boxArrow{
        margin-left: 15px;
        display: inline;
    }

    #boxArrow img{
        vertical-align: text-bottom;
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
        float: left;
    }
</style>