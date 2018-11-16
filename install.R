# R script to install R packages required for Lewis et al's replication study. 
# 
# This code, including the list of packages and checkpoint date
# are based directly on the first code chunk in that
# R Markdown document.
#
# To keep container image size as small as possible, only
# packages needed for figures are included.

install.packages(
  c(
    'cowplot',
    'ggplot2',
    'plyr',
    'Rmisc'
  ),
  repos="https://mran.microsoft.com/snapshot/2017-10-19/"
)
