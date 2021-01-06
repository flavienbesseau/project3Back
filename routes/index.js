// const thingsRoutes = require('./things');
const express = require("express");
const router = express.Router();

const hospitals = require("./hospitals");
const specialties = require("./specialties");
const experiences = require("./experiences");
const responses = require("./responses");
const questions = require("./questions");
const survey = require("./survey");

router.use("/hospitals", hospitals);
router.use("/specialties", specialties);
router.use("/experiences", experiences);
router.use("/surveys/responses", responses);
router.use("/questions", questions);
router.use("/survey", survey);

// // eslint-disable-next-line
// module.exports = (app) => {
//   // app.use('/things', thingsRoutes);
//   app.use()
// };

module.exports = router;
