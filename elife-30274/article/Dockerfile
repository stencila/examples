# Use the stencila/base-r-binder image which has the 
# Stencila for R (to execute R code cells) and 
# Jupyter (so that Binder can build and launch the image)
#
# Use the version for R 3.4 which was the latest version of
# R available at the time of the replication study (2017-10-19)
FROM stencila/base-r-binder:3.4

# Switch to root user to install system packages
# required by the R packages required by the article
USER root

RUN apt-get update \
 && apt-get install -y \
      libcurl4-openssl-dev \
      libgsl-dev \
      libssl-dev \
 && apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Create a working directory for the article
RUN mkdir article
WORKDIR article

# Run the package installation script
ADD packages.R .
RUN Rscript packages.R

# Fetch the article data and acillary code
ADD data.R .
RUN Rscript data.R

