# Docker file for eLife 30274 article

FROM ubuntu:18.04

# Install required system packages
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
   	  pkg-config \
   	  libcurl4-openssl-dev \
      libgsl-dev \
      libssl-dev \
      libxml2-dev \
      r-base \
      zlib1g-dev \
 && apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install the Stencila R package
RUN Rscript -e 'install.packages("devtools", repos="https://cloud.r-project.org")'
RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite("graph")'
RUN Rscript -e 'devtools::install_github("r-lib/pkgbuild")'
RUN Rscript -e 'devtools::install_github("stencila/r")'

# Run the package installation script for this project
ADD packages.R .
RUN Rscript packages.R

# Fetch the article data and ancillary code for this project
ADD data.R .
RUN Rscript data.R

CMD STENCILA_AUTH=false Rscript -e 'stencila::run("0.0.0.0", 2000)'
