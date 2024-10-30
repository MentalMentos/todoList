source .env

set -e

# Ожидание, пока PostgreSQL не будет доступен
until pg_isready -h pg -U ${PG_USER}; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done

export MIGRATION_DSN="host=localhost:8084 port=54321 dbname=$PG_DATABASE_NAME user=$PG_USER password=$PG_PASSWORD sslmode=disable"

sleep 2 && goose -dir "${MIGRATION_DIR}" postgres "${MIGRATION_DSN}" up -v