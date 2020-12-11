# Setup

Install dependencies and the migration tool :
```sh
npm i
npm i -g db-migrate db-migrate-mysql
```
Copy the environnement variables : 
```
cp .env.sample .env
```
This `.env` file allows to change the way the Node server connects to the database, but you probably won't have to change any of those variables unless you want to deploy the app yourself or connect it to a specific DB.

### Linux (Unbuntu 20.04)

Copy and execute those commands one by one in a terminal and you should be good to go.

### Run the automated tests
```sh
npm run test:setup-and-run
```
Once you've exectued the previous command, you can just do : 
```sh
npm run test
```
It will just execute the tests without settting up the DB and running the migrations.

### Run the app

Run migration and launch server serparately :

```sh
npm run migrate-db
npm run start:watch:server
```
All in once:

```sh
npm run start:watch
```
### Run the automated tests

```sh
npm run test:migrate-db
npm run test
```

# Database migrations

If, while developping, you must change the structure of the database to fit new requirements, 
you HAVE TO write a database migration script in order for the changes to be propagated 
in contributors local databases but also in the pre-prod/prod environments' DBs.

Here's an exemple of the helper command usage : 
```
NAME=splitNameOnUsers npm run create-db-migration
```
(Replace the NAME variable value by the name of your change). It will create two SQL files in the `migrations/sqls` folder. One file is executed on the DB when applying changes (migrating up) and the other is run when rolling back changes (migrating down).

To apply the changes that have not yet been synced to the database :
```
npm run migrate-db
```

## RTFM (but ask for help if needed)

Documentation [here](https://db-migrate.readthedocs.io/en/latest/)



# ES Lint

To launch a check :

```sh
npm run lint 
```

# API Docs
You can access the docs, available by default at [localhost:5000/api-docs](http://localhost:5000/api-docs).

You can modify the docs by changing the `docs/swagger.yaml` file.

