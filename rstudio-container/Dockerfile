FROM rocker/rstudio:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libcurl4-gnutls-dev \
        libfontconfig1-dev \
        libfreetype6-dev \
        libhdf5-dev \
        libpng-dev \
        libtiff5-dev \ 
        libjpeg-dev \
        libfribidi-dev \
        libharfbuzz-dev \
        libxml2-dev \
        patch \
        zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home

COPY install_monocle_and_R_dependencies.R .

RUN Rscript install_monocle_and_R_dependencies.R

WORKDIR /data

COPY example-data .

WORKDIR /tutorial

COPY single-cell-tutorial.Rmd .

WORKDIR /home
