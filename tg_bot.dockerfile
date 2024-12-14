FROM python:3.9-slim AS builder

WORKDIR /tgbot

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONBUFFERED=1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc libpq-dev build-essential && \
    apt-get clean

COPY requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /tgbot/wheels -r requirements.txt


FROM python:3.9-slim 

WORKDIR /tgbot

COPY --from=builder /tgbot/wheels /wheels
COPY --from=builder /tgbot/requirements.txt .
COPY . .

RUN pip install --no-cache /wheels/*

RUN groupadd -r user && useradd -r -g user user
RUN chown user . 
USER user

CMD ["python3", "./Bot.py"]
