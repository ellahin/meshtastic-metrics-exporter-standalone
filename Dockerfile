FROM python:3.12.0-alpine

WORKDIR /app
RUN  apk add --update --no-cache gcc libc-dev libffi-dev
COPY requirements.txt .
COPY .env .
RUN python --version
RUN pip3 install -r requirements.txt

COPY exporter exporter
COPY main.py .
COPY constants.py .
CMD ["python3", "-u", "main.py"]
