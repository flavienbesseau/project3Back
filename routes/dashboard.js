const router = require('express').Router();
const { dashboardController } = require('../controllers')

const { checkToken } = require('../middlewares/checkToken');

router.get('/:id', checkToken, dashboardController.dashboard);

module.exports = router;