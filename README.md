# sample-task-golang-migrate

## 事前準備

```sh
direnv edit .

export DB_USER=task
export DB_PASSWORD=password
export DB_HOST=localhost
export DB_PORT=3306
export DB_DATABASE_NAME=task
```

## DB Migration

```sh
migrate create -ext sql -dir db/migrations -seq create_tables
migrate create -ext sql -dir db/migrations -seq create_triggers

migrate -path migrations -database "mysql://${DB_USER}:${DB_PASSWORD}@tcp(${DB_HOST}:${DB_PORT})/${DB_DATABASE_NAME}?multiStatements=true" up

migrate -path migrations -database "mysql://${DB_USER}:${DB_PASSWORD}@tcp(${DB_HOST}:${DB_PORT})/${DB_DATABASE_NAME}" down
```
