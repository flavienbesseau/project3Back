const createUserModel = 
`INSERT INTO ms_user (name, email, password, created_account, fk_user_role_id, fk_hospital_id)
 VALUES (?, ?, ?, NOW(), 1, 1)`; 

const getAllUsersModel = 
`SELECT * FROM ms_user`;

module.exports = {
  createUserModel,
  getAllUsersModel
}