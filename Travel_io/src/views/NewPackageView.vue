<template>
    <div class="col-2">
        
        <form id="formHolidayPackage" action="newHolidayPackage">
            <div id="headerForm">
                <img src="../assets/img/onlylogo.png" alt="logo di travel_io senza scritta" width="50">
                <br>
                <br>
                <h1 style="color: var(--white);">Crea un nuovo pacchetto di viaggio</h1>
            </div>

            <br>

            <label for="destination">Destinazione: </label>
            <input type="text" name="destination" />

            <br>
            <br>

            <label for="price">Costo: </label>
            <input type="number" name="price" min="1" max="10000">

            <br>
            <br>

            <label for="departure">Data di partenza: </label>
            <input type="date" name="departure" >

            <br>
            <br>

            <label for="info">Info: </label>
            <textarea name="info"></textarea>

            <br>
            <br>

            <label for="days">Giorni di soggiorno: </label>
            <input type="number" name="days" min="1" max="31">

            <br>
            <br>

            <input type="submit" value="invia">

        </form>

    </div>
</template>

<style>
    #formHolidayPackage{
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

    #formHolidayPackage input[type="submit"] {
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

    #formHolidayPackage input[type="submit"]:hover {
        background: rgba(255, 255, 255, 0.343);
        color: var(--white);
    }

    #headerForm img{
        float: left;
    }
</style>