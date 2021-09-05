FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8-slim

RUN pip install poetry \
    && poetry config virtualenvs.create false

WORKDIR /app

COPY pyproject.toml* poetry.lock* ./
RUN if [ -f pyproject.toml ]; then poetry install --no-root; fi
