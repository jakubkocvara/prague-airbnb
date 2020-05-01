ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends libgeos++-dev libproj-dev proj-data \
    proj-bin

USER $NB_UID

RUN pip install geoplot
RUN pip uninstall -y shapely
RUN pip install --no-binary shapely shapely
RUN pip install xgboost
RUN pip install shap