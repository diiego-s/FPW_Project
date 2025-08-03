const {Router} = require('express');
const controller = require('./hp_controller');

const router = Router();

//GET
router.get('/', controller.getHolidayPackageList);
router.get('/:id', controller.getHolidayPackageById);

module.exports = router;