FROM python:3.13-alpine

RUN apk add --no-cache git postgresql-client curl
RUN pip install -U pip

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

WORKDIR /var/www

COPY ./requirements.txt .
RUN pip install -r ./requirements.txt

COPY . .

VOLUME [ "/var/www/static_files" ]

EXPOSE 8080 8081 4200
ARG DB_NAME
ARG DB_USER
ARG DB_HOST
ARG DB_PORT=5432
ARG APP_ENV=DEVELOPMENT


CMD [ "/var/www/scripts/start.sh" ]