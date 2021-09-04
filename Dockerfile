FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8-alpine3.10

ENV USER=vscode
ENV UID=1000
ENV GID=1000

RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && apk del tzdata \
    && echo 'Asia/Tokyo' > /etc/timezone

# build-base, gccはsqlalchemyに必要
RUN apk add --no-cache \
    build-base \
    gcc

RUN addgroup -g $GID $USER \
    && adduser -u $UID -G $USER --disabled-password $USER

COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt

WORKDIR /app
