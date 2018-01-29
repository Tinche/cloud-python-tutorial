FROM python:3.6-slim as builder

WORKDIR /app
RUN python -m venv .venv
COPY requirements.txt requirements.txt
RUN .venv/bin/pip install -r requirements.txt
COPY cloud cloud
COPY static static
COPY manage.py manage.py

FROM python:3.6-slim
WORKDIR /app
COPY --from=builder /app/.venv /app/.venv
COPY --from=builder /app/cloud /app/cloud
COPY --from=builder /app/manage.py /app/manage.py
COPY --from=builder /app/static /app/static

ENTRYPOINT [ ".venv/bin/python", "manage.py" ]