const express = require('express');
const session = require('express-session');

const hpRoutes = require('./src/holiday_package/hp_routes');
const adminRoutes = require('./src/admin/admin_routes');
const sessionRoutes = require('./src/sessions/session_routes');
const usersRoutes = require('./src/users/users_routes');

const app = express();
const port = 3000;

app.use(express.json());

app.use(session({
    secret: 'secret',
    resave: false,
    saveUninitialized: true,
    cookie: {maxAge: 300000, secure: false}
}));

app.use('/holiday_package', hpRoutes);
app.use('/admin', adminRoutes);
app.use('/sessions', sessionRoutes);
app.use('/users', usersRoutes);


app.listen(port, () => console.log(`app listening on port ${port}!`));