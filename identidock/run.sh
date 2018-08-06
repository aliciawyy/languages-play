#! /bin/sh

docker run -d -p 5000:5000 -v "$PWD"/app:/app identidock
