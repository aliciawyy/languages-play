FROM debian:wheezy

RUN apt-get update && apt-get install -y fortune cowsay

COPY entrypoint.sh /tmp/

ENTRYPOINT ["/tmp/entrypoint.sh"]
