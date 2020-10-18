# User Task Introduction

The apo did not use gem devise. The author want to try creating a new authentication without framework so it takes more time to finish. Due to the lack of time so the app is still missing test, some validation and reafactor in some feature

## Technologies index
- **Docker, Docker-compose** based on Alpine Linux
- **Ruby on Rails** use for  Back-End and Front-End
- **PostgreSQL** for Database

## Installation

### Back-End

```bash
docker-compose build # build image

docker-compose run app bundle exec rails db:create # create database

docker-compose run app bundle exec rails db:migrate # migrate

docker-compose up # check on http://localhost:3000/

docker-compose run app rake add_transaction # Optional create example data

docker-compose run app rails test # Some test have been add to User_model, will improve in the future
```

## Noted
- Must run db:create and db:migrate
- The app is not complete yet, still working on testing. The author will add more test, and refactor code in the future


## Thank You