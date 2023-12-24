FROM python:3.10-slim-buster

USER root

ARG DB_HOST
ARG DB_USERNAME
ARG DB_PASSWORD

ENV DB_USERNAME=$DB_USERNAME
ENV DB_PASSWORD=$DB_PASSWORD
ENV DB_HOST=$DB_HOST

WORKDIR /app

COPY ./requirements.txt requirements.txt

# Dependencies required for psycopg2 (used for Postgres client)
RUN apt update -y && apt install -y build-essential libpq-dev

# Dependencies are installed during build time in the container itself so we don't have OS mismatch
RUN pip install -r requirements.txt

COPY . /app

CMD python app.py
