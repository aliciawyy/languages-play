FROM python:3.6-slim

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

WORKDIR /app
CMD ["python", "identidock.py"]
