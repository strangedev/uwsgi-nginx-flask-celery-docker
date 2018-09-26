FROM tiangolo/uwsgi-nginx-flask:python3.6

LABEL maintainer="Noah Hummel <strangedev@posteo.net>"

COPY ./requirements.txt /app/
WORKDIR /app
RUN pip install -r requirements.txt
RUN rm requirements.txt

ENV CELERY_OBJECT="app"
ENV CELERY_LOGLEVEL="INFO"

RUN mkdir /var/log/celery
COPY ./supervisord_celery.conf /etc/supervisor/conf.d/

COPY start.sh /start.sh
RUN chmod +x /start.sh

#RUN supervisorctl reread && supervisorctl update
