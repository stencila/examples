# R script to install R packages required for executing
# Lewis et al's `Replication_Study_48.Rmd`. 
# 
# Uses the `checkpoint` package to install packages
# as they existed on a particular date.
# 
# This code, including the list of packages and checkpoint date
# are based directly on the first code chunck in that
# R Markdown document.

chooseCRANmirror(graphics = FALSE, ind = 1)

install.packages("checkpoint")
library(checkpoint)

cat('
library(httr)
library(tidyr)
library(reshape2)
library(pander)
library(car)
library(lsmeans)
library(coin)
library(MBESS)
library(metafor)
library(rjson)
library(psychometric)
', file = "manifest.R")

dir.create(".checkpoint")
checkpoint("2017-10-19", checkpointLocation=".")
