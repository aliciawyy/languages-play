#! /usr/bin/sh

./node_modules/.bin/json-server -p 5000 ./json/speaker.json &
nyc mocha
kill $(lsof -t -i:5000)
