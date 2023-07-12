# syntax=docker/dockerfile:1

FROM jupyterhub/k8s-hub:3.0.0-beta.3

# install required dependencies for services
USER root
RUN apt update && apt install -y curl
RUN apt-get autoclean -y
USER jovyan

RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/home/jovyan/.local/bin:$PATH"

EXPOSE 5000

COPY ./downloadservice/poetry.lock /downloadservice/poetry.lock
COPY ./downloadservice/pyproject.toml /downloadservice/pyproject.toml
COPY ./downloadservice/downloadservice/cli.py /downloadservice/downloadservice/cli.py

WORKDIR /downloadservice
USER root
RUN poetry env use system
RUN poetry config virtualenvs.create false
RUN poetry install --without test --compile
USER jovyan
WORKDIR /srv/jupyterhub

COPY ./downloadservice /downloadservice

# USER root
# RUN rm -rf /downloadservice
# USER jovyan
