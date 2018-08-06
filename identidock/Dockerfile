FROM python:3.6-slim

RUN apt-get update
RUN apt-get install -y gcc
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

WORKDIR /app
COPY cmd.sh /cmd.sh

EXPOSE 9090 9191

RUN groupadd -r uwsgi && useradd -rg uwsgi uwsgi
USER uwsgi

CMD ["/cmd.sh"]
