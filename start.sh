#!/bin/bash

until psql -h postgres-idm -U postgres  -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - initialising"

DATABASE_USER=postgres DATABASE_HOST=postgres-idm BROKER_SSL=no BROKER_HOSTNAME=rabbitmq-idm DJANGO_DEBUG=1 python3 manage.py migrate
DJANGO_SETTINGS_MODULE=idm_core.settings DJANGO_DEBUG=1  celery -b rabbitmq-idm -B -A idm_core worker -l info &
DATABASE_USER=postgres DATABASE_HOST=postgres-idm BROKER_SSL=no BROKER_HOSTNAME=rabbitmq-idm DJANGO_DEBUG=1 python3 manage.py runserver
