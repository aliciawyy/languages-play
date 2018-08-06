#!/bin/bash

docker run -P -e ENV="PROD" -v "$PWD"/app:/app identidock
