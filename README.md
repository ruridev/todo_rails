# Rails on Docker Quickstart

https://docs.docker.com/compose/rails/

# docker 컨테이너 안에서 명령어 실행

docker-compose run web rails generate scaffold todo user_id:integer text:string date:date checked:boolean
docker-compose run web rails db:migrate RAILS_ENV=development

# HOST

```sh
TODO_SERVER=3.115.63.100:3000
```

# 임시토큰

AuthAPI와 연계하기 전까지는 `FOO` 를 토큰으로 넘겨주세요.

```sh
$ curl -X GET -H 'Authorization: Token BAR' -H 'Content-Type:application/json' http://$TODO_SERVER/api/v1/todo
{"message":"token invalid"}
```

```sh
$ curl -X GET -H 'Authorization: Token FOO' -H 'Content-Type:application/json' http://$TODO_SERVER/api/v1/todo
[]
```

### POST /api/v1/todo

```sh
curl -H 'Authorization: Token FOO' -H "Content-Type: application/json" -d '{"todo":{"text": "u-kan", "date": "2019/10/01"}}' http://$TODO_SERVER/api/v1/todo
```

### GET /api/v1/todo

```sh
curl -X GET -H 'Authorization: Token FOO' -H 'Content-Type:application/json' http://$TODO_SERVER/api/v1/todo
```

### DELETE /api/v1/todo/{id}

```sh
curl -X DELETE -H 'Authorization: Token FOO' -H 'Content-Type:application/json' http://$TODO_SERVER/api/v1/todo/{id}
```

### PUT /api/v1/todo/{id}

```sh
curl -X PUT -H 'Authorization: Token FOO' -H 'Content-Type:application/json' -d '{"todo":{"checked": true}}' http://$TODO_SERVER/api/v1/todo/1
```

```sh
curl -X PUT -H 'Authorization: Token FOO' -H 'Content-Type:application/json' -d '{"todo":{"text": "text"}}' http://$TODO_SERVER/api/v1/todo/1
```
