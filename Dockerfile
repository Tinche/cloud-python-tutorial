FROM python:3.6-slim as builder

WORKDIR /app
RUN python -m venv .venv
COPY requirements.txt requirements.txt
RUN .venv/bin/pip install -r requirements.txt
COPY cloud cloud
COPY static static
COPY manage.py manage.py

ENTRYPOINT [ ".venv/bin/python", "manage.py" ]