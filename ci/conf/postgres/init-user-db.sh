#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER grafana WITH PASSWORD 'grafana';
    CREATE DATABASE grafana;
    GRANT ALL PRIVILEGES ON DATABASE grafana TO grafana;
    CREATE USER gitea WITH PASSWORD 'gitea';
    CREATE DATABASE gitea;
    GRANT ALL PRIVILEGES ON DATABASE gitea TO gitea;
EOSQL