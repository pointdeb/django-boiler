#!/usr/bin/env sh
# set -x
export PG_PASSWORD=$DB_PASSWORD
# tail -f /dev/null
# waiting database to be fully ready
pg_isready -h $DB_HOST -p $DB_PORT -U $DB_USER
python manage.py migrate
# ./manage.py spectacular --color --file schema.yml
./manage.py collectstatic --no-input
python -m gunicorn myapp_main.asgi:application -k uvicorn_worker.UvicornWorker --bind 0.0.0.0:8080 --reload