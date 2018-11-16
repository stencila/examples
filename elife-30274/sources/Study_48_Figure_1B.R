#Replication Study 48
#Study_48_Protocol_2_Figure
#R Version 3.3.2

#Required Packages
library(httr) #version 1.2.1
library(rjson) #version 0.2.15
library(Rmisc) #version 1.5
library(ggplot2) #version 2.2.1
library(cowplot) #version 0.7.0
#source("~/credentials.R") #for private use during generation

#Downloads R script "download.OSF.file.R"
GET("https://osf.io/hkpjb/?action=download", write_disk("download.OSF.file.R", overwrite = TRUE))
source("download.OSF.file.R")
#calls the download.OSF.file

#Downloads data file 'Study_48_Protocol_2_Data.csv' from https://osf.io/72czk/
download.OSF.file(GUID="72czk",Access_Token=RPCB_private_access,
                  file_name="Study_48_Protocol_2_Data.csv")

#names raw data from protocol 2 from csv file
data2 <- read.csv("Study_48_Protocol_2_Data.csv", header=T, sep=",")

#creates new column calculating RNA in 100uL
data2$RNA.100uL <- data2$Average.RNA.Concentration*100

##calculates RNA per cell
data2$RNA.per.cell <- data2$RNA.100uL/data2$Total.Cells.Harvested

#calculates RNA per 1000 cells
data2$value <- data2$RNA.per.cell*1000

#classifies time as character
data2$Time <- as.character(data2$Time)

########## subsets and summarizes Data ##########

#subsets data on lot 1
lot1dat <- data2[which(data2$Lot=="1"),]
#subsets data on lot 2
lot2dat <- data2[which(data2$Lot=="2"),]

#summarizes lot 1 data
lot1sum <- summarySE(data=lot1dat, measurevar = "value", groupvars = "Time")
#summarizes lot 2 data
lot2sum <- summarySE(data=lot2dat, measurevar = "value", groupvars = "Time")

########## Generates bar plot for lot 1 ##########
##################################################

plot.lot1 <- ggplot(lot1sum, aes(x=Time, y=lot1sum$value, fill=Time)) +
  geom_bar(stat="identity", width=.8, color = "black") +
  geom_errorbar(aes(x=Time, ymin=value-se, ymax=value+se),
                width=.20)+
  coord_cartesian(ylim=c(0,2.5)) +
  scale_fill_manual(values = c("grey30", "grey30","grey30")) +
  ylab(expression(paste("Total RNA (ng) \n per 1,000 cells"))) +
  scale_y_continuous(expand = c(0,0),
                     limits = c(0,6),
                     breaks = c(0, .5, 1.0, 1.5, 2.0, 2.5),
                     labels = c("0.0", "0.5", "1.0", "1.5", "2.0", "2.5")) +
  scale_x_discrete(labels = c("0hr", "1hr", "24hr")) +
  theme(plot.margin = unit(c(1,1,1,2), "lines"),
        axis.ticks.length = unit(0.25, "cm"),
        axis.text.x = element_text(size=15, color = "black"),
        axis.text.y = element_text(size = 15, color = "black"),
        axis.title.y = element_text(size = 20),
        axis.title.x = element_blank(),
        panel.background = element_blank(),
        axis.line.y = element_line(),
        legend.position = "none",
        axis.line.x = element_line())

########## Generates bar plot for lot 1 ##########
##################################################

plot.lot2 <- ggplot(lot2sum, aes(x=Time, y=lot2sum$value, fill=Time)) +
  geom_bar(stat="identity", width=.8, color = "black") +
  geom_errorbar(aes(x=Time, ymin=value-se, ymax=value+se),
                width=.20)+
  coord_cartesian(ylim=c(0,2.5)) +
  scale_fill_manual(values = c("grey30","grey30","grey30")) +
  ylab(expression("Total RNA (ng) \n per 1,000 cells")) +
  scale_y_continuous(expand = c(0,0),
                     limits = c(0,6),
                     breaks = c(0, .5, 1.0, 1.5, 2.0, 2.5),
                     labels = c("0.0", "0.5", "1.0", "1.5", "2.0", "2.5")) +
  scale_x_discrete(labels = c("0hr", "1hr", "24hr")) +
  theme(plot.margin = unit(c(1,1,1,2), "lines"),
        axis.text.x = element_text(size=15, color = "black"),
        axis.text.y = element_text(size = 15, color = "black"),
        axis.title.y = element_text(size = 20),
        axis.title.x = element_blank(),
        panel.background = element_blank(),
        axis.line.y = element_line(),
        legend.position = "none",
        axis.line.x = element_line())

Figure_1B <- plot_grid(plot.lot1, plot.lot2, labels = c("Lot 1", "Lot 2"), label_size = 20, hjust = .01)
#May issue a warning about font, this does not affect the outcome of the plot
Figure_1B



################################################################

# saves file 'Study_48_Figure_1B.pdf' locally
ggsave(file = "Study_48_Figure_1B.pdf", width = 15, height = 6)

