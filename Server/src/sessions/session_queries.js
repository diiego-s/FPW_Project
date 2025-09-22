const login = "SELECT * FROM users WHERE username = $1 AND password = $2";
const usernameExist = "SELECT * From users WHERE username = $1";
const changePsw = "UPDATE users SET password = $3 WHERE username = $1 AND password = $2;"

module.exports = {
    login,
    usernameExist,
    changePsw
}