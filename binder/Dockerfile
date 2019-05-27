FROM rocker/binder:3.5.2

## Copies your repo files into the Docker Container
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

## Run an deps.R script, if it exists.
RUN installGithub.r cran/ggplot2@3.0.0 cran/gamair@1.0-0 cran/sp@1.3-1

## Become normal user again
USER ${NB_USER}
