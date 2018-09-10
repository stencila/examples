# Use the stencila/base-r image which has the 
# Stencila for R (to execute R code cells)
#
# Use the version for R 3.4 which was the latest version of
# R available at the time of Lewis et al's replication study (2017-10-19)
FROM rocker/r-ver:3.4.3

# Create a working directory for the article
RUN mkdir article
WORKDIR article

# Install system libraries required for the following scripts
RUN apt-get update \
 && apt-get install -y \
      libcurl4-openssl-dev \
      libgsl-dev \
      libssl-dev \
 && apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Run the package installation script
ADD packages.R .
RUN Rscript packages.R

# Fetch the article data and ancillary code
ADD data.R .
RUN Rscript data.R


RUN apt-get update \
 && apt-get install -y \
      zlib1g-dev \
      libxml2-dev \
   	  pkg-config \
 && apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN Rscript -e 'install.packages("devtools")'
RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite("graph")'
RUN Rscript -e 'devtools::install_github("r-lib/pkgbuild")'
RUN Rscript -e 'devtools::install_github("stencila/r")'

CMD STENCILA_AUTH=false Rscript -e 'stencila::run("0.0.0.0", 2000)'
