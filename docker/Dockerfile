FROM rocker/binder:3.5.2

## Copies your repo files into the Docker Container
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

## Become normal user again
USER ${NB_USER}

## Run an install.R script, if it exists.
RUN install2.r --skipinstalled remotes mgcv ggplot2 gamair sp MASS

