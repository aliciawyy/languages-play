#!/bin/bash

if [ "$ENV" = "DEV" ]; then
    echo "Running Development Server"
    exec python "identidock.py"
else
    echo "Running production server"
    exec uwsgi --http 0.0.0.0:9090 -wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:9191
fi

