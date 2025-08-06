const login = "SELECT * FROM users WHERE username = $1 AND password = $2";
const usernameExist = "SELECT * From users WHERE username = $1";

module.exports = {
    login,
    usernameExist
}