FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8-alpine3.10

RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && apk del tzdata \
    && echo 'Asia/Tokyo' > /etc/timezone

# build-baseはsqlalchemyに必要
RUN apk add --no-cache build-base

COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt

WORKDIR /app
