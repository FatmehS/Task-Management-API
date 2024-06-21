#!/bin/sh

# wait-for-postgres.sh

set -e

host="$1"
shift
cmd="$@"

until PGPASSWORD=$POSTGRES_PASSWORD pg_isready -h "$host" -U "$POSTGRES_USER"; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command in 5 seconds"
sleep 5  # Additional delay to ensure PostgreSQL is fully ready
exec $cmd
