#!/usr/bin/env bash
set -x
# export DB_NAME='dbname_test'
coverage run manage.py test
coverage report