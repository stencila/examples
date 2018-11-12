# R script to install R packages required for executing
# Lewis et al's `Replication_Study_48.Rmd`. 
# 
# This code, including the list of packages and checkpoint date
# are based directly on the first code chunck in that
# R Markdown document.

install.packages(
  c(
    'car',
    'coin',
    'httr',
    'lsmeans',
    'MBESS',
    'metafor',
    'pander',
    'psychometric',
    'reshape2',
    'rjson',
    'tidyr'
  ),
  repos="https://mran.microsoft.com/snapshot/2017-10-19/"
)
