# syntax=docker/dockerfile:1

FROM jupyterhub/k8s-hub:3.2.1

# install required dependencies for services
USER root
RUN apt update && apt install -y curl
RUN apt-get autoclean -y

USER jovyan

RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/home/jovyan/.local/bin:$PATH"

EXPOSE 5000

# # DownloadService
# COPY ./downloadservice/poetry.lock /downloadservice/poetry.lock
# COPY ./downloadservice/pyproject.toml /downloadservice/pyproject.toml
# COPY ./downloadservice/downloadservice/cli.py /downloadservice/downloadservice/cli.py

USER root

# WORKDIR /downloadservice
# RUN poetry env use system
# RUN poetry config virtualenvs.create false
# RUN poetry install --without test --compile

# # CertificateService
# COPY ./certificateservice/poetry.lock /certificateservice/poetry.lock
# COPY ./certificateservice/pyproject.toml /certificateservice/pyproject.toml
# COPY ./certificateservice/certificateservice/cli.py /certificateservice/certificateservice/cli.py

# WORKDIR /certificateservice
# RUN poetry env use system
# RUN poetry config virtualenvs.create false
# RUN poetry install --without test --compile

# Other requirements
COPY requirements.txt /usr/local/share/requirements.txt
RUN python3 -m pip install -r /usr/local/share/requirements.txt
RUN rm /usr/local/share/requirements.txt

USER jovyan
WORKDIR /srv/jupyterhub

# COPY ./downloadservice /downloadservice
# COPY ./certificateservice /certificateservice

# USER root
# RUN rm -rf /downloadservice
# USER jovyan
