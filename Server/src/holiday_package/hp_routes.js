const {Router} = require('express');
const controller = require('./hp_controller');

const router = Router();

//GET
router.get('/', controller.getHolidayPackages);
router.get('/:id', controller.getHolidayPackageById);

//POST
router.post('/', controller.addHolidayPackage);

module.exports = router;