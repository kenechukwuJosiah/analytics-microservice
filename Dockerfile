FROM python:3.10-slim-buster

USER root

WORKDIR /app

COPY ./requirements.txt requirements.txt

# Dependencies required for psycopg2 (used for Postgres client)

# Dependencies are installed during build time in the container itself so we don't have OS mismatch
RUN pip install -r requirements.txt

COPY . /app

CMD python app.py
