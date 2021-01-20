const yup = require('yup');

const userSchema = yup.object({
  
  name: yup
  .string()
  .matches(/^[aA-zZ ]+$/, 'Vous devez renseigner votre nom et prénom')
  .min(2, '2 caractères minimum')
  .required(),

  email: yup
  .string()
  .email("Vous devez renseigner un email valide")
  .required('Email requis'),
  
  password: yup
  .string()
  .matches(/^.*(?=.{5,})((?=.*[!@#$%^&*()\-_=+{};:,<.>]){1})(?=.*\d)((?=.*[a-z]){1})((?=.*[A-Z]){1}).*$/,
    "5 caractères, une majuscule, un chiffre et un caractère spécial")
  .min(5, 'Vous devez renseigner un mot de passe avec 5 caractères minimum')
  .max(20, "Mot de passe incorrect, celui-ci ne doit pas excéder 20 caractères")
  .required(),

  passwordConfirmation: yup
  .string()
  .oneOf([yup.ref('password'), null], 'Les mots de passe doivent correspondre')
  .required('Mot de passe requis')

})

module.exports = userSchema