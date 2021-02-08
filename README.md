# Hospitalidee

Hospitalidee is a web application allowing patients to give their opinion on their hospital experience. Hospital managers will be able to log in to access a dashboard containing several statistics concerning their establishments. This in order to improve the services offered

## Technos, bookstores:

1. mySQL: https://dev.mysql.com/doc/refman/8.0/en/
2. Node: https://dev.mysql.com/doc/refman/8.0/en/
3. Express: http://expressjs.com/
4. DB-migrate: https://db-migrate.readthedocs.io/en/latest/Getting%20Started/usage/

## Prerequisites:

1. Node: https://nodejs.org/en/
2. Git: https://git-scm.com/
3. mySQL: https://www.mysql.com/fr/

## Authors:

Alexandre Dietsch, Louise Mehouas, Flavien Besseau

## License:

This project is subject to customer rights.

## Steps:

1. In your terminal, go to the folder in which you want to have the project.

2. To retrieve the backend, type:

```sh
 git clone  https://github.com/WildCodeSchool/tlse0920-js-hospitalidee-tdb-back.git
```

3. Still in the terminal, go to the back folder, then type:

```sh
 npm install
```

4. Create a file called `.env".

5. In it, write this filling in your database username and password:

```sh
NODE_ENV = dev

SERVER_PORT = 5000
SERVER_PORT_TEST = 5000

DB_HOST = localhost
DB_PORT = 3306
DB_USER =
DB_PASS =
DB_NAME = hospitable

DB_HOST_TEST = localhost
DB_PORT_TEST = 3306
DB_USER_TEST =
DB_PASS_TEST =
DB_NAME_TEST = hospitalidee

#Runtime config
PORT = 5000

#JWT
JWT_SECRET = jwt secret
```

6. In your terminal, go to your mysql and then create the "hospitalidee" database by doing:

```sh
 mysql -u root -p
```

```sh
CREATE DATABASE hospitalidee;
```

7. Then type that to fill the database.:

```sh
 npx db-migrate up
```

8. Start the server by typing:

```sh
 npm run start: watch
```

## Credits:

Thanks to the Wild Code School and its team for their support in our project. Thank you to the customer for trusting us and for his encouragement

## Contact:

Alexandre Dietsch: dietschalex@gmail.com  
Louise Mehouas: mehouaslouise0@gmail.com  
Flavien Besseau: besseau.flavien@gmail.com
