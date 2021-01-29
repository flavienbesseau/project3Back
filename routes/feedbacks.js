const router = require('express').Router();
const { getAllFeedbacks, getFeedbacksByQuestion } = require('../controllers/feedbacks.controllers');

router.get('/', getAllFeedbacks);
router.post('/', getFeedbacksByQuestion);

module.exports = router;