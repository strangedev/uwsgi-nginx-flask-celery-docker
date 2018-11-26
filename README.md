# uwsgi-nginx-flask-celery-docker
Docker image containing uwsgi, nginx, Flask and Celery. Based on tiangolo/uwsgi-nginx-flask:python3.6.

Why include Celery in your Flask container?

Since celery needs to access the codebase of your Flask app to spawn workers, might as well spawn the workers on
the same machine. You should still be able to spin up multiple containers for load balancing, as each worker will consume
from the shared message broker.

For productive use, you should probably take a look at tiangolo's [fullstack](https://github.com/tiangolo/full-stack) application template, since it solves things more elegantly than this image does.
