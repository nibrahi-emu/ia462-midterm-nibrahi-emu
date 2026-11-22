FROM python:3.11-slim@sha256:07d4824036af339fa1b6ef769cc99d9c10a141769538b52b3b597c84f7a7b535 AS builder

WORKDIR /build

COPY app/requirements.txt .

RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.11-slim@sha256:07d4824036af339fa1b6ef769cc99d9c10a141769538b52b3b597c84f7a7b535 AS runtime

RUN groupadd --system appgroup && useradd --system --gid appgroup --home-dir /app --shell /usr/sbin/nologin appuser

WORKDIR /app

COPY --from=builder /install /usr/local
COPY --chown=appuser:appgroup app/app.py /app/app.py

USER appuser

EXPOSE 8080
CMD ["python", "-m", "flask", "--app", "app", "run", "--host=0.0.0.0", "--port=8080"]
