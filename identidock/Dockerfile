FROM python:3.6-slim

RUN apt-get update \
    && apt-get install -y gcc \
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

WORKDIR /app
COPY cmd.sh /cmd.sh

EXPOSE 9090 9191

RUN groupadd -r uwsgi && useradd -rg uwsgi uwsgi
USER uwsgi

CMD ["/cmd.sh"]
