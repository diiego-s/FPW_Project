const getUsers = "SELECT * FROM users"
const getUserByUsername= "SELECT * FROM users WHERE username = $1"
const addUser = "INSERT INTO users (username, password, name, surname, email, city, fav_city) VALUES ($1, $2, $3, $4, $5, $6, $7)";

module.exports = {
    getUsers,
    getUserByUsername,
    addUser
};