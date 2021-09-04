# FastAPI 入門

[FastAPI入門](https://zenn.dev/sh0nk/books/537bb028709ab9)
のコードを
[tiangolo/uvicorn-gunicorn-fastapi](https://hub.docker.com/r/tiangolo/uvicorn-gunicorn-fastapi/)
で動かす

1. 起動

       docker-compose up

1. DB 初期化

       docker-compose exec demo-app python -m api.migrate_db

1. [Swagger UI](http://localhost:8000/docs) を開く
