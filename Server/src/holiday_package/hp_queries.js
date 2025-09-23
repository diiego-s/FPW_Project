const getHolidayPackages = 'SELECT * FROM holiday_packages ORDER BY id ASC';
const getHolidayPackageById = 'SELECT * FROM holiday_packages WHERE id = $1';
const addHolidayPackage = `INSERT INTO holiday_packages (destination, price, departure, info, days, photo) VALUES ($1, $2, $3, $4, $5, 'default.png')`

module.exports = {
    getHolidayPackages,
    getHolidayPackageById,
    addHolidayPackage
};