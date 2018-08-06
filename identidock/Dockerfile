FROM python:3.6-slim

RUN apt-get update
RUN apt-get install -y gcc
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

WORKDIR /app
CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py", \
     "--callable", "app", "--stats", "0.0.0.0:9191"]
