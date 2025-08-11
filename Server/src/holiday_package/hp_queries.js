const getHolidayPackages = 'SELECT * FROM holiday_packages ORDER BY id ASC';
const getHolidayPackageById = 'SELECT * FROM holiday_packages WHERE id = $1';

module.exports = {
    getHolidayPackages,
    getHolidayPackageById
};