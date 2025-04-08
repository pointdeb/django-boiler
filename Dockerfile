FROM python:3.13-bullseye

RUN apt-get update; apt-get -y install --no-install-recommends --no-install-suggests git postgresql curl
RUN pip install -U pip

WORKDIR /var/www

COPY ./requirements.txt .
RUN pip install -r ./requirements.txt

COPY . .

VOLUME [ "/var/www/static_files" ]

EXPOSE 8080 8081 4200
ARG DB_NAME
ARG DB_USER
ARG DB_HOST
ARG DB_PASSWORD
ARG DB_PORT=5432
ARG APP_ENV=DEVELOPMENT

CMD [ "/var/www/scripts/start.sh" ]