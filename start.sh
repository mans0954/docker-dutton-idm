#!/bin/bash

until psql -h postgres-idm -U postgres  -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - initialising"

DATABASE_USER=postgres DATABASE_HOST=postgres-idm BROKER_SSL=no BROKER_HOSTNAME=rabbitmq-idm DJANGO_DEBUG=1 python3 manage.py migrate
DATABASE_USER=postgres DATABASE_HOST=postgres-idm BROKER_SSL=no BROKER_HOSTNAME=rabbitmq-idm DJANGO_DEBUG=1 python3 manage.py runserver
