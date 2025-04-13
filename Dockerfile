FROM python:3.10-slim-buster
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app

## program run methods
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5223", "--reload", "--workers", "4"]

