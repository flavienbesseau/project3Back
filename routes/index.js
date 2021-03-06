const router = require("express").Router();

const hospitals = require("./hospitals");
const specialties = require("./specialties");
const experiences = require("./experiences");
const responses = require("./responses");
const questions = require("./questions");
const survey = require("./survey");
const register = require("./register");
const login = require("./login");
const dashboard = require("./dashboard");
const informationsgenerales = require("./informationsgenerales");
const feedbacks = require("./feedbacks");
const repartitionChart = require("./repartitionChart");
const averageHospital = require("./averagehospital");
const countReviews = require("./numberReview");
const averageThisMonth = require("./averageThisMonth");
const scoreConfiance = require("./scoreConfiance");
const logout = require('./logout');

router.use("/hospitals", hospitals);
router.use("/specialties", specialties);
router.use("/experiences", experiences);
router.use("/surveys/responses", responses);
router.use("/questions", questions);
router.use("/survey", survey);
router.use("/register", register);
router.use("/login", login);
router.use("/dashboard", dashboard);
router.use("/informationsgenerales", informationsgenerales);
router.use("/feedbacks", feedbacks);
router.use("/repartition-chart", repartitionChart);
router.use("/averageHospital", averageHospital);
router.use("/countReviews", countReviews);
router.use("/averageThisMonth", averageThisMonth);
router.use("/scoreConfiance", scoreConfiance);
router.use('/logout', logout);

module.exports = router;
