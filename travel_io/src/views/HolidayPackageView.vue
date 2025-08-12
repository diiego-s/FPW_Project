<script>
    import HolidayPackage from '../components/HolidayPackage.vue'
    import * as Api from '@/utils/apis.js';

    export default {
        components: {
            HolidayPackage,
        },
        data(){
            return {
                holidayPackages: []
            }
        },
        methods: {
            async getHolidayPackages(){
                const data = await Api.getHolidayPackages();
                this.holidayPackages = data;
            }
        },
        mounted(){
            this.getHolidayPackages();
        }
    }

</script>

<template>
    
    <div>
        <div v-for="holidayPackage in holidayPackages" :key="holidayPackage.id" id="holidayPackageBox">
            <HolidayPackage :destination="holidayPackage.destination" :price="holidayPackage.price" :departure="holidayPackage.departure" :info="holidayPackage.info" :days="holidayPackage.days" :photo="holidayPackage.photo"></HolidayPackage>
        </div>
    </div>

</template>

<style>
    #holidayPackageBox{
        margin: 15px;
        margin-top: 5px;
    }
</style>