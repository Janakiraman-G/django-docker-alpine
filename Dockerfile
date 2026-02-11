FROM python:3.11-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apk update && apk add --no-cache \
    gcc \
    musl-dev \
    linux-headers

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
