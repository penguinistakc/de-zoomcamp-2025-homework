# de-zoomcamp-2025-homework
Homework for the 2025 Data Engineering Zoomcamp Cohort

```bash
docker network create pg-network
```

```bash
docker run -it \
    -e POSTGRES_USER="root" \
    -e POSTGRES_PASSWORD="root" \
    -e POSTGRES_DB="ny_taxi" \
    -e PGDATA="/var/lib/postgresql/data/pgdata" \
    -v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data:rw \
    -u 1000:1000 \
    -p 5432:5432 \
    --network=pg-network \
    --name=pg-database \
    postgres
```

```bash
docker run -it --detach \
  -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
  -e PGADMIN_DEFAULT_PASSWORD="root" \
  -p 8080:80 \
  --network=pg-network \
  --name=pgadmin4 \
  dpage/pgadmin4
```

```bash
URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"
python ingest_data.py \
  --user=root \
  --password=root \
  --host=localhost \
  --port=5435 \
  --database=ny_taxi \
  --table=yellow_taxi_trips \
  --csv_url=$(URL)
```

```bash
docker run -it --network=pg-network \
  taxi_ingest:v003 \
  --user=root \
  --password=root \
  --host=pg-database \
  --port=5432 \
  --db=ny_taxi \
  --table_name=yellow_taxi_trips \
  --url=${URL} 
```
