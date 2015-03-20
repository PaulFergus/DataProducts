#############################################################################
# Project:      Hypoxia
# Description:  This is the analysis for the paper "Automated Classification
#               of Hypoxia from Correlates between Uterine Contractions and
#               Fetal Heart Rate using Advanced Data Models of 
#               Intrapartum Cardiotocography
# Author:       Dr Paul Fergus
# Email:        p.fergus@ljmu.ac.uk
#############################################################################


get.data <- function(filename){
  data <- read.table(filename, sep=",", header=TRUE)
  data <- data[-1,]
  names(data) <- paste(c("elapsed.time", "fhr", "uc"))
  data$uc <- as.numeric(as.character(data$uc))
  data$fhr <- as.numeric(as.character(data$fhr))
  data$elapsed.time <- as.numeric(as.character(data$elapsed.time))
  return(data)
}

