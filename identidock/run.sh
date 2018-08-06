#! /bin/sh

docker run -p 9090:9090 -p 9191:9191 -v "$PWD"/app:/app identidock
