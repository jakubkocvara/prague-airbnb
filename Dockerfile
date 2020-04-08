ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends libgeos++-dev libproj-dev proj-data \
    proj-bin apt-transport-https software-properties-common dirmngr gpg-agent

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
RUN apt-get update
RUN apt-get install -y r-base

USER $NB_UID

RUN pip install geoplot
RUN pip uninstall -y shapely
RUN pip install --no-binary shapely shapely
RUN pip install xgboost
RUN pip install rpy2
RUN pip install shap