FROM rocker/binder:3.5.2


## Copies your repo files into the Docker Container
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

## Run an install.R script, if it exists.
RUN install2.r --repos https://mran.microsoft.com/snapshot/2018-12-01 gamair mgcv ggplot2 sp MASS

## Become normal user again
USER ${NB_USER}
