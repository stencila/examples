RPCB_private_access <- "https://osf.io/mokeb/?view_only=756a4e87b872460d8d4ed25eae4d5150"
#RPCB_private_access is an object that contains the private viewing link above or a private access token which is necessary to view and create scripts while this project is private. Upon publication, when the project is made public, a private access token or private link will no longer be necessary to render the rmd or view/access any of the scripts used in this Replication project.

#attaches only the packages neccessary to knit the r markdown document
library(httr) #version 1.2.1
library(rjson) #version 0.2.15
library(pander) #version 0.6.0
library(reshape2) #version 1.4.2

#Downloads R script "download.OSF.file.R"
GET("https://osf.io/hkpjb/?action=download", write_disk("download.OSF.file.R", overwrite = TRUE))
source("download.OSF.file.R")
#calls the download.OSF.file

#Downloads data file 'Study_48_Protocol_2_Analysis.R' from https://osf.io/u7a5h/
download.OSF.file(GUID="u7a5h",Access_Token=RPCB_private_access,
file_name="Study_48_Protocol_2_Analysis.R")
source("Study_48_Protocol_2_Analysis.R")
#Calls 'data2'
#Calls  'contrast1'
#Calls  'contrast2'

#Downloads data file 'Study_48_Accession#_Comparisons.R' from https://osf.io/nvjkd/
download.OSF.file(GUID="nvjkd",Access_Token=RPCB_private_access,
file_name="Study_48_Accession#_Comparisons.R")
source("Study_48_Accession#_Comparisons.R")
#Calls 'common' which is all 1212 genes common between the replication study and the original study

#Downloads data file 'Study_48_Protocols3&4_Analysis.R ' from https://osf.io/2yj6v/
download.OSF.file(GUID="2yj6v",Access_Token=RPCB_private_access,
file_name="Study_48_Protocols3&4_Analysis.R")
source("Study_48_Protocols3&4_Analysis.R")
#calls 'a.lot1.0v1_P, a.lot2.0v1_P, a.lot1.0v24_P, a.lot2.0v24_P, a.lot1.1v24_P, a.lot2.1v24_P' 
### which are the pvalues for the wilcoxon signed rank tests for lot1/lot2 for active genes
#calls 's.lot1.0v1_P, s.lot2.0v1_P, s.lot1.0v24_P, s.lot2.0v24_P, s.lot1.1v24_P, s.lot2.1v24_P' 
### which are the pvalues for the wilcoxon signed rank tests for lot1/lot2 for silent genes
#calls 'a.lot1.0v1_Z, a.lot2.0v1_Z, a.lot1.0v24_Z, a.lot2.0v24_Z, a.lot1.1v24_Z, a.lot2.1v24_Z' 
### which are the Z statistics for the wilcoxon signed rank test for lot1/lot2 for active genes
#calls 's.lot1.0v1_Z, s.lot2.0v1_Z, s.lot1.0v24_Z, s.lot2.0v24_Z, s.lot1.1v24_Z, s.lot2.1v24_Z' 
### which are the Z statistics for the wilcoxon signed rank test for lot1/lot2 for silent genes
#calls 'a.lot1.0v1_n, a.lot2.0v1_n, a.lot1.0v24_n, a.lot2.0v24_n, a.lot1.1v24_n, a.lot2.1v24_n' 
### which is n for the wilcoxon signed rank test for lot1/lot2 for active genes
#calls 's.lot1.0v1_n, s.lot2.0v1_n, s.lot1.0v24_n, s.lot2.0v24_n, s.lot1.1v24_n, s.lot2.1v24_n' 
###which is n for the wilcoxon signed rank test for lot1/lot2 for silent genes

#Downloads data file 'Study_48_Protocols3&4_Analysis_Exploratory.R' from https://osf.io/3k9sb/
download.OSF.file(GUID="3k9sb",Access_Token=RPCB_private_access,
file_name="Study_48_Protocols3&4_Analysis_Exploratory.R")
source("Study_48_Protocols3&4_Analysis_Exploratory.R")
#calls 'e_a.lot1.0v1_P, e_a.lot2.0v1_P, e_a.lot1.0v24_P, e_a.lot2.0v24_P, e_a.lot1.1v24_P, e_a.lot2.1v24_P' 
### which are the pvalues for the wilcoxon rank sum tests for lot1/lot2 for active genes
#calls 'e_s.lot1.0v1_P, e_s.lot2.0v1_P, e_s.lot1.0v24_P, e_s.lot2.0v24_P, e_s.lot1.1v24_P, e_s.lot2.1v24_P' 
### which are the pvalues for the wilcoxon rank sum tests for lot1/lot2 for silent genes
#calls 'e_a.lot1.0v1_Z, e_a.lot2.0v1_Z, e_a.lot1.0v24_Z, e_a.lot2.0v24_Z, e_a.lot1.1v24_Z, e_a.lot2.1v24_Z' 
### which are the Z statistics for the wilcoxon rank sum test for lot1/lot2 for active genes
#calls 'e_s.lot1.0v1_Z, e_s.lot2.0v1_Z, e_s.lot1.0v24_Z, e_s.lot2.0v24_Z, e_s.lot1.1v24_Z, e_s.lot2.1v24_Z' 
### which are the Z statistics for the wilcoxon rank sum test for lot1/lot2 for silent genes
#calls 'e_a.lot1.0v1_n, e_a.lot2.0v1_n, e_a.lot1.0v24_n, e_a.lot2.0v24_n, e_a.lot1.1v24_n, e_a.lot2.1v24_n' 
### which is n for the wilcoxon rank sum test for lot1/lot2 for active genes
#calls 'e_s.lot1.0v1_n, e_s.lot2.0v1_n, e_s.lot1.0v24_n, e_s.lot2.0v24_n, e_s.lot1.1v24_n, e_s.lot2.1v24_n' 
###which is n for the wilcoxon rank sum test for lot1/lot2 for silent genes

# Downloads data file 'Study_48_Protocols3&4_Original_Data_ReAnalysis.R' from https://osf.io/s845v/
download.OSF.file(GUID="s845v",Access_Token=RPCB_private_access,
file_name="Study_48_Protocols3&4_Original_Data_ReAnalysis.R")
source("Study_48_Protocols3&4_Original_Data_ReAnalysis.R")
#calls ' a.orig.0v1$statistic[[1]], a.orig.0v24$statistic[[1]]), a.orig.1v24$statistic[[1]])' 
###Calls the W statistic for the Wilcoxon Rank Sum tests on active genes
#calls 's.orig.0v1$statistic[[1]]), s.orig.0v24$statistic[[1]]), s.orig.1v24$statistic[[1]])' 
###Calls the W statistic for the Wilcoxon Rank Sum tests on silent genes
#e_a.orig.0v1$p.value, e_a.orig.0v24$p.value, e_a.orig.1v24$p.value
###Calls the pval for the Wilcoxon Rank Sum tests on Active genes
#e_s.orig.0v1$p.value, e_s.orig.0v24$p.value, e_s.orig.1v24$p.value
###Calls the pval for the Wilcoxon Rank Sum tests on silent genes
#a.orig.0v1_n, a.orig.0v24_n, a.orig.0v24_n' 
###which is the n for each Studies's Active genes
#s.orig.0v1_n, s.orig.0v24_n, s.orig.1v24_n' 
###which is the n for each Studies's Silent genes

# Downloads data file 'Study_48_Protocols3&4_Original_Data_ReAnalysis_Exploratory.R' from https://osf.io/c74s6/
download.OSF.file(GUID="c74s6",Access_Token=RPCB_private_access,
file_name="Study_48_Protocols3&4_Original_Data_ReAnalysis_Exploratory.R")
source("Study_48_Protocols3&4_Original_Data_ReAnalysis_Exploratory.R")
#calls ' e_e_a.orig.0v1$statistic[[1]], e_e_a.orig.0v24$statistic[[1]]), e_e_a.orig.1v24$statistic[[1]])' 
###Calls the W statistic for the Wilcoxon Rank Sum tests on active genes
#calls 'e_s.orig.0v1$statistic[[1]]), e_s.orig.0v24$statistic[[1]]), e_s.orig.1v24$statistic[[1]])' 
###Calls the W statistic for the Wilcoxon Rank Sum tests on silent genes
#e_a.orig.0v1$p.value, e_a.orig.0v24$p.value, e_a.orig.1v24$p.value
###Calls the pval for the Wilcoxon Rank Sum tests on Active genes
#e_e_a.orig.0v1$p.value, e_e_a.orig.0v24$p.value, e_e_a.orig.1v24$p.value
###Calls the pval for the Wilcoxon Rank Sum tests on silent genes
#e_e_a.orig.0v1_n, e_a.orig.0v24_n, e_a.orig.0v24_n' 
###which is the n for each Studies's Active genes
#e_a.orig.0v1_n, e_a.orig.0v24_n, e_a.orig.1v24_n' 
###which is the n for each Studies's Silent genes

# Downloads R script 'Protocol 2 normality homoscedasiticity.R' from https://osf.io/9wmq8/
download.OSF.file(GUID="9wmq8",Access_Token=RPCB_private_access,
file_name="Protocol 2 normality homoscedasiticity.R")
source("Protocol 2 normality homoscedasiticity.R")
# Calls 'zero'
# Calls 'one'
# Calls 'twentyfour'

# Downloads R script 'Study_48_Meta_Analysis.R' from https://osf.io/89e2b/
download.OSF.file(GUID="89e2b",Access_Token=RPCB_private_access,
                  file_name="Study_48_Meta_Analysis.R")
source("Study_48_Meta_Analysis.R")
# Calls 'exp_orig_d' which is the original effect
# Calls 'exp_lot1_d' which is the replication study lot 1 effect
# Calls 'exp_lot2_d' which is the replication study lot 2 effect
# Calls 'exp_meta' which is the replication study meta analysis
# Calls 'a_meta_0v1', 'a_meta_0v24', & 'a_meta_1v24', which are the meta analyses for each respective test for Active Genes
# Calls 's_meta_0v1', 's_meta_0v24', & 's_meta_1v24', which are the meta analyses for each respective test for Silent Genes

# Downloads R script 'Replication_Study_functions.R' from https://osf.io/duvht/
download.OSF.file(GUID="duvht",Access_Token=RPCB_private_access,
file_name="Replication_Study_functions.R")
source("Replication_Study_functions.R")
# Calls 'scinot' which is a function to write in scientific notation in Rmd

# Downloads R script 'Study_48_Figure_2_Supplemental_Tables.csv' from https://osf.io/rynzs/
download.OSF.file(GUID="rynzs",Access_Token=RPCB_private_access,
file_name="Study_48_Figure_2_Supplemental_Tables.csv")
#reads csv file of Table 1 csv file
dat <- read.csv("Study_48_Figure_2_Supplemental_Tables.csv", header=T, sep=",")
# Calls 'dat' which is data from Supplemental tables
