FROM python:3

USER root

WORKDIR /app

COPY ./requirements.txt requirements.txt

# Dependencies required for psycopg2 (used for Postgres client)
RUN apt update -y && apt install -y build-essential libpq-dev

# Dependencies are installed during build time in the container itself so we don't have OS mismatch
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

CMD python app.py
