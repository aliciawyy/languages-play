#!/bin/bash

if [ "$ENV" = "DEV" ]; then
    echo "Running Development Server"
    python "identidock.py"
elif [ "$ENV" = "TEST" ]; then
    echo "Running Unit Tests"
    pytest .
else
    echo "Running Production Server"
    uwsgi --http 0.0.0.0:9090 -wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:9191
fi

