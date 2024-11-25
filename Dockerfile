FROM python:3.13.0-slim

RUN pip install pipenv

WORKDIR /app
COPY ["Pipfile", "Pipfile.lock", "./"]

# Using --system --deploy doesn't create the virtual environment (we don't need it because we are inside a container)
RUN pipenv install --system --deploy

COPY ["predict.py", "dv.bin", "model_d=20s=5.bin", "./"]

EXPOSE 9696

ENTRYPOINT [ "gunicorn", "--bind=0.0.0.0:9696", "predict:app" ]