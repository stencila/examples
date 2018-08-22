# Use the stencila/base-r image which has the 
# Stencila for R (to execute R code cells)
#
# Use the version for R 3.4 which was the latest version of
# R available at the time of Lewis et al's replication study (2017-10-19)
FROM stencila/core-r:3.4

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

# Fetch the article data and ancillary code
ADD data.R .
RUN Rscript data.R

