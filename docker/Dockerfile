FROM rocker/binder:3.5.2


## Copies your repo files into the Docker Container
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

## Run an deps.R script, if it exists.
RUN if [ -f deps.R ]; then R --quiet -f deps.R; fi

## Become normal user again
USER ${NB_USER}
