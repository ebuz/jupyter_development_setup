FROM jupyter/datascience-notebook:latest
USER root
RUN apt-get update && apt-get install -yq --no-install-recommends \
    vim \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_USER
RUN conda install --quiet --yes sqlalchemy-utils psycopg2 flask xgboost \
    'tensorflow==2.0.0' && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

VOLUME /host
WORKDIR /host
