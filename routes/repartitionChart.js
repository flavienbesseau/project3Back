const router = require('express').Router();
const { repartition }  = require('../controllers/repartition.controllers');


router.get('/:id', repartition);

module.exports = router;