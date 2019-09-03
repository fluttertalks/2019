# AWS Serverless template

This template was created to facilitate the start of a project with serverless framework + MongoDB.

In this template we already have a `/users` CRUD route and tests for these routes.

If you find improvements, please help and improve this tempalte ;)


## How to use

create an `.env` file in the project root with the MongoDB database settings, for example:

```
MONGO_HOST=ds01010101.mlab.com
MONGO_USER=myUser
MONGO_PASSWORD=myPassword
MONGO_PORT=43062
MONGO_DB=myDb

MONGO_HOST_TEST=ds01010101.mlab.com
MONGO_USER_TEST=myUser
MONGO_PASSWORD_TEST=myPassword
MONGO_PORT_TEST=43062
MONGO_DB_TEST=myDb
```

## Test

Run `npm test`

## Deploy

You can use continuous integration or manual deploy, for CI you need configure `.yml` file, this template is configured for gitlab CI, for this you need add variables in Gitlab:

settings > ci_cd > Variables:

```
AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxx
AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxx
MONGO_HOST=ds01010101.mlab.com
MONGO_USER=myUser
MONGO_PASSWORD=myPassword
MONGO_PORT=43062
MONGO_DB=myDb
```


For execute manual deploy just `serverless deploy`