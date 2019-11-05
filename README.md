# Rails on Docker Quickstart

https://docs.docker.com/compose/rails/

# docker 컨테이너 안에서 명령어 실행

docker-compose run web rails generate scaffold todo user_id:integer body:string date:date complete:integer
docker-compose run web rails db:migrate RAILS_ENV=development

# 임시토큰

AuthAPI와 연계하기 전까지는 `FOO` 를 토큰으로 넘겨주세요.

```sh
$ curl -X GET -H 'Authorization: Token BAR' -H 'Content-Type:application/json' http://0.0.0.0:3000/api/v1/todo
{"message":"token invalid"}
```

```sh
$ curl -X GET -H 'Authorization: Token FOO' -H 'Content-Type:application/json' http://0.0.0.0:3000/api/v1/todo
[]
```

### POST /api/v1/todo

```sh
curl -H 'Authorization: Token FOO' -H "Content-Type: application/json" -d '{"todo":{"body": "u-kan", "date": "2019/10/01"}}' http://0.0.0.0:3000/api/v1/todo
```

### GET /api/v1/todo

```sh
curl -X GET -H 'Authorization: Token FOO' -H 'Content-Type:application/json' http://0.0.0.0:3000/api/v1/todo
```

### DELETE /api/v1/todo/{id}

```sh
curl -X DELETE -H 'Authorization: Token FOO' -H 'Content-Type:application/json' http://0.0.0.0:3000/api/v1/todo/{id}
```

### PUT /api/v1/todo/{id}

```sh
curl -X PUT -H 'Authorization: Token FOO' -H 'Content-Type:application/json' -d '{"todo":{"complete": "1"}}' http://0.0.0.0:3000/api/v1/todo/1
```

```sh
curl -X PUT -H 'Authorization: Token FOO' -H 'Content-Type:application/json' -d '{"todo":{"body": "body"}}' http://0.0.0.0:3000/api/v1/todo/1
```
