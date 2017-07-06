#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE api NOLOGIN;
    CREATE ROLE web_anon NOLOGIN;
EOSQL
