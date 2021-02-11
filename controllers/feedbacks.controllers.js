const { pool } = require("../db");
const { getFeedbacksModels } = require('../models/feedbacks.models');

const getAllFeedbacks = async (req, res) => {
  try {
    const [rows] = await pool.promise().query(`SELECT * FROM ms_response`);
    res.status(200).json(rows);
  } catch(err) {
    console.log(new Date(), req.method, req.originalUrl, err.message);
    res.status(500).send('server error');
  }
}

const getFeedbacksByQuestion = async (req, res) => {
  try {
    const { hospitalid, questionid } = req.body;
    const [rows] = await pool.promise().query(getFeedbacksModels, [hospitalid, questionid])
    res.status(200).json(rows)
  } catch(err) {
    console.log(new Date(), req.method, req.originalUrl, err.message);
    res.status(500).send('server error');
  }
}

module.exports = {
  getAllFeedbacks,
  getFeedbacksByQuestion
}