FROM rocker/binder:3.6.0
LABEL maintainer='Tim Trice'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}
RUN wget https://github.com/timtrice/distill/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2019-06-30/')); devtools::install_deps()"
