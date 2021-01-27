const getFeedbacksModels = `
SELECT ms_response.id, ms_response.score, ms_response.text_answer, ms_response.pseudo, ms_response.email 
FROM ms_response 
WHERE ms_response.fk_hospital_id = ? 
AND ms_response.fk_question_id = ?`

const devModel = `
SELECT *
FROM ms_response 
WHERE ms_response.fk_hospital_id = ? 
AND ms_response.fk_question_id = ?`

module.exports = {
  getFeedbacksModels,
  devModel
}