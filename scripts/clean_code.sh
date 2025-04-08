#!/usr/bin/env sh
set -e
autoflake --remove-all-unused-imports --remove-unused-variables --in-place --recursive .
isort .
flake8 .