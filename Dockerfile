FROM rocker/r-ver:4.4.2

RUN apt-get update && apt-get install -y \
    libglpk-dev \
    libxml2-dev \
    libcairo2-dev \
    libgit2-dev \
    default-libmysqlclient-dev \
    libpq-dev \
    libsasl2-dev \
    libsqlite3-dev \
    libssh2-1-dev \
    libxtst6 \
    libcurl4-openssl-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    unixodbc-dev \
    wget

RUN R -e "install.packages('devtools')"

RUN R -e "devtools::install_github('b-rodrigues/myPackage', ref = 'e9d9129de3047c1ecce26d09dff429ec078d4dae')"

RUN R -e "install.packages('ggplot2')"

RUN mkdir -p /home/rstudio/graphs

COPY my_graph.R .

CMD R -e "source('my_graph.R')"