# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/engine/reference/builder/


ARG PYTHON_VERSION=3.12.0
FROM python:${PYTHON_VERSION}-slim as base

ENV DB_USERNAME $DB_USERNAME
ENV DB_PASSWORD $DB_PASSWORD


# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

USER root

WORKDIR /app

COPY ./requirements.txt requirements.txt

# Dependencies are installed during build time in the container itself so we don't have OS mismatch
RUN pip install -r requirements.txt

# Copy the source code into the container.
COPY . .

# Expose the port that the application listens on.
EXPOSE 8000

# Run the application.
CMD python app.py
