# syntax=docker/dockerfile:1

FROM jupyterhub/k8s-hub:3.0.0-beta.1

# install required dependencies for services
COPY ./downloadservice /downloadservice
RUN pip install --no-cache-dir /downloadservice

USER root
RUN apt update && apt install -y curl
RUN apt-get autoclean -y
USER jovyan

RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/home/jovyan/.local/bin:$PATH"
WORKDIR /downloadservice
RUN poetry env use system
RUN poetry install --without dev --compile
EXPOSE 5000
WORKDIR /srv/jupyterhub

# USER root
# RUN rm -rf /downloadservice
# USER jovyan
