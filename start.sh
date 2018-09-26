#! /usr/bin/env bash
set -e

# If there's a prestart.sh script in the /app directory, run it before starting
PRE_START_PATH=/app/prestart.sh
echo "Checking for script in $PRE_START_PATH"
if [ -f $PRE_START_PATH ] ; then
    echo "Running script $PRE_START_PATH"
    source $PRE_START_PATH
else 
    echo "There is no script $PRE_START_PATH"
fi

sed -i -e "s/CELERY_OBJECT/${CELERY_OBJECT}/g" /etc/supervisor/conf.d/supervisord_celery.conf
sed -i -e "s/CELERY_LOGLEVEL/${CELERY_LOGLEVEL}/g" /etc/supervisor/conf.d/supervisord_celery.conf


# Start Supervisor, with Nginx and uWSGI
exec /usr/bin/supervisord
