const express = require("express");

const router = express.Router();
const connection = require("../db");

router.get("/skills/:hospitalId", (req, res) => {
  const { hospitalId } = req.params;
  connection.query(
    `SELECT AVG(score) AS score FROM ms_response AS r WHERE r.fk_question_id IN (1,6,12,8) AND r.fk_hospital_id = ?`,
    [hospitalId],
    (err, results) => {
      if (err || results.length === 0) {
        res.status(404).send("Error collecting data");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.get("/Competitionskills/:hospitalId", (req, res) => {
  const { hospitalId } = req.params;
  connection.query(
    `SELECT AVG(score) AS score FROM ms_response AS r WHERE r.fk_question_id IN (1,6,12,8) AND r.fk_hospital_id != ?`,
    [hospitalId],
    (err, results) => {
      if (err || results.length === 0) {
        res.status(404).send("Error collecting data");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.get("/reliability/:hospitalId", (req, res) => {
  const { hospitalId } = req.params;
  connection.query(
    `SELECT AVG(score) AS score FROM ms_response AS r WHERE r.fk_question_id IN (9,16,28,29,30,31) AND r.fk_hospital_id = ?`,
    [hospitalId],
    (err, results) => {
      if (err || results.length === 0) {
        res.status(404).send("Error collecting data");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.get("/Competitionreliability/:hospitalId", (req, res) => {
  const { hospitalId } = req.params;
  connection.query(
    `SELECT AVG(score) AS score FROM ms_response AS r WHERE r.fk_question_id IN (9,16,28,29,30,31) AND r.fk_hospital_id != ?`,
    [hospitalId],
    (err, results) => {
      if (err || results.length === 0) {
        res.status(404).send("Error collecting data");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.get("/transparency/:hospitalId", (req, res) => {
  const { hospitalId } = req.params;
  connection.query(
    `SELECT AVG(score) AS score FROM ms_response AS r WHERE r.fk_question_id IN (7,13,15,17)` +
      `AND r.fk_hospital_id = ?`,
    [hospitalId],
    (err, results) => {
      if (err || results.length === 0) {
        console.log(err);
        res.status(404).send("Error collecting data");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.get("/Competitiontransparency/:hospitalId", (req, res) => {
  const { hospitalId } = req.params;
  connection.query(
    `SELECT AVG(score) AS score FROM ms_response AS r WHERE r.fk_question_id IN (7,13,15,17)` +
      `AND r.fk_hospital_id != ?`,
    [hospitalId],
    (err, results) => {
      if (err || results.length === 0) {
        res.status(404).send("Error collecting data");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.get("/relation/:hospitalId", (req, res) => {
  const { hospitalId } = req.params;
  connection.query(
    `SELECT AVG(score) AS score FROM ms_response AS r WHERE r.fk_question_id IN (2,7,9,10,14,17)` +
      `AND r.fk_hospital_id = ?`,
    [hospitalId],
    (err, results) => {
      if (err || results.length === 0) {
        res.status(404).send("Error collecting data");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

router.get("/Competitionrelation/:hospitalId", (req, res) => {
  const { hospitalId } = req.params;
  connection.query(
    `SELECT AVG(score) AS score FROM ms_response AS r WHERE r.fk_question_id IN (2,7,9,10,14,17)` +
      `AND r.fk_hospital_id != ?`,
    [hospitalId],
    (err, results) => {
      if (err || results.length === 0) {
        res.status(404).send("Error collecting data");
      } else {
        res.status(200).send(results);
      }
    }
  );
});

module.exports = router;
