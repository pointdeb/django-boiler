#!/usr/bin/env sh
set -e
# export DB_NAME='dbname_test'
coverage run manage.py test
coverage report