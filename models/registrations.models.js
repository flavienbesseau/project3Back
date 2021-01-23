const createUserModel = 
`INSERT INTO ms_user (name, email, password, fk_hospital_id, created_account, fk_user_role_id)
 VALUES (?, ?, ?, ?, NOW(), 1)`; 

const getAllUsersModel = 
`SELECT * FROM ms_user`;

module.exports = {
  createUserModel,
  getAllUsersModel
}