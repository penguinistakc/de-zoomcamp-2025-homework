FROM python:3.12

RUN apt-get update & apt-get install -y wget

RUN pip install --no-cache-dir \
    pandas \
    pyarrow \
    sqlalchemy \
    psycopg2-binary


WORKDIR /app
COPY ingest_data.py ingest_data.py


ENTRYPOINT ["python", "ingest_data.py"]