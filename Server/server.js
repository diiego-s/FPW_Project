const express = require('express');

const hpRoutes = require('./src/holiday_package/hp_routes');
const adminRoutes = require('./src/admin/admin_routes');

const app = express();
const port = 3000;

app.use(express.json());

app.use('/holiday_packages', hpRoutes);
app.use('/admin', adminRoutes);

app.listen(port, () => console.log(`app listening on port ${port}!`));