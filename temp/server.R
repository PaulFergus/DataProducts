library(shiny)
library(zoo)
library(signal)
library(ggplot2)


#Load Data
source("load_data.R")
data <- get.data(filename="data/1001.csv")

###############################################################################
# Perform Data Pre-Processing

#1. Interpolate the missing values in the fhr signal
#   I  have chose to do this first to see if we can salvage any additional data
#   Step 2 will only remove large blocks of zeros or nas. 
source("interpolate.R")
inter.data <- as.data.frame(interpolate(data))

source("remove.noise.R")
#2. Need a step that removes large blocks of zeros
inter.data <-remove.noise(inter.data)

#Make sure that you do not have any NA values before the signal is filtered. 
sum.na <- sum(is.na(inter.data))


shinyServer(
  function(input, output){
    output$newHist <- renderPlot({
      mu <- input$mu
      data.filt <- stats::filter(inter.data[4000:5000,2], filter=rep(1/mu, mu))
      plot(inter.data[4000:5000,2], col='red', type='l')
      lines(data.filt, col='blue')
    })
  }
)