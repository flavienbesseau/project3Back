const express = require("express");

const router = express.Router();
const {pool} = require("../db");

router.get("/doctorsRelation/:id", (req, res) => {
  const hospitalId = req.params.id;
  pool.query(
    "SELECT AVG(score) AS score from ms_response " +
      `WHERE fk_hospital_id = ${hospitalId} ` +
      "AND MONTH(post_date) = MONTH(CURRENT_DATE()) " +
      "AND fk_question_id = 23 ",
    (err, results) => {
      if (err || results.length === 0) {
        res.status(500).send("Error retrieving data");
      } else {
        res.status(200).json(results);
      }
    }
  );
});

router.get("/doctorsRelationPast/:id", (req, res) => {
  const hospitalId = req.params.id;
  pool.query(
    "SELECT AVG(score) AS score from ms_response " +
      `WHERE fk_hospital_id = ${hospitalId} ` +
      "AND post_date > now() - interval 1 month " +
      "AND fk_question_id = 23 ",
    (err, results) => {
      if (err || results.length === 0) {
        console.log(err);
        res.status(500).send("Error retrieving data");
      } else {
        res.status(200).json(results);
      }
    }
  );
});

router.get("/healthTeam/:id", (req, res) => {
  const hospitalId = req.params.id;
  pool.query(
    "SELECT AVG(score) AS score from ms_response " +
      `WHERE fk_hospital_id = ${hospitalId} ` +
      "AND MONTH(post_date) = MONTH(CURRENT_DATE()) " +
      "AND fk_question_id = 2 ",
    (err, results) => {
      if (err || results.length === 0) {
        res.status(500).send("Error retrieving data");
      } else {
        res.status(200).json(results);
      }
    }
  );
});

router.get("/healthTeamPast/:id", (req, res) => {
  const hospitalId = req.params.id;
  pool.query(
    "SELECT AVG(score) AS score from ms_response " +
      `WHERE fk_hospital_id = ${hospitalId} ` +
      "AND post_date > now() - interval 1 month " +
      "AND fk_question_id = 2 ",
    (err, results) => {
      if (err || results.length === 0) {
        res.status(500).send("Error retrieving data");
      } else {
        res.status(200).json(results);
      }
    }
  );
});

router.get("/explanationsInformations/:id", (req, res) => {
  const hospitalId = req.params.id;
  pool.query(
    "SELECT AVG(score) AS score from ms_response " +
      `WHERE fk_hospital_id = ${hospitalId} ` +
      "AND MONTH(post_date) = MONTH(CURRENT_DATE()) " +
      "AND fk_question_id = 7 ",
    (err, results) => {
      if (err || results.length === 0) {
        res.status(500).send("Error retrieving data");
      } else {
        res.status(200).json(results);
      }
    }
  );
});

router.get("/explanationsInformationsPast/:id", (req, res) => {
  const hospitalId = req.params.id;
  pool.query(
    "SELECT AVG(score) AS score from ms_response " +
      `WHERE fk_hospital_id = ${hospitalId} ` +
      "AND post_date > now() - interval 1 month " +
      "AND fk_question_id = 7 ",
    (err, results) => {
      if (err || results.length === 0) {
        res.status(500).send("Error retrieving data");
      } else {
        res.status(200).json(results);
      }
    }
  );
});

router.get("/organisation/:id", (req, res) => {
  const hospitalId = req.params.id;
  pool.query(
    "SELECT AVG(score) AS score from ms_response " +
      `WHERE fk_hospital_id = ${hospitalId} ` +
      "AND MONTH(post_date) = MONTH(CURRENT_DATE()) " +
      "AND fk_question_id = 9 ",
    (err, results) => {
      if (err || results.length === 0) {
        res.status(500).send("Error retrieving data");
      } else {
        res.status(200).json(results);
      }
    }
  );
});

router.get("/organisationPast/:id", (req, res) => {
  const hospitalId = req.params.id;
  pool.query(
    "SELECT AVG(score) AS score from ms_response " +
      `WHERE fk_hospital_id = ${hospitalId} ` +
      "AND post_date > now() - interval 1 month " +
      "AND fk_question_id = 9 ",
    (err, results) => {
      if (err || results.length === 0) {
        res.status(500).send("Error retrieving data");
      } else {
        res.status(200).json(results);
      }
    }
  );
});

module.exports = router;
