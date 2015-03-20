library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Cardiotogography Foetal Heart Rate Signal Filtering"),
  sidebarPanel(
    h4('Simple moving average filter'),
    sliderInput('mu', 'Choose Filter Value', value =1, min=1, max=100, step=1)
  ),
  mainPanel(
    h3('Foetal Heart Signal'),
    p('Uterine contractions produced during labour have the potential to damage a foetus by diminishing the maternal 
      blood flow to the placenta, which can result in foetus hypoxia. The challenge is to develop predictive algorithms
      capable off detecting, with high accuracy, when a child is genuinely compromised before medical intervention is 
      considered. This simple application addresses on of the first steps in the data analysis pipeline, that of signal
      filtering. This application allows the user to explore filter settings through an interactive slider and time 
      series signal plot for a subset of foetal heart rate observations.'),
   plotOutput('newHist'),
   p('Figure 1: Foetal Heart Rate Signal (observations 4000 to 5000) for file 1001 from the CTU-CHG dataset ')
  )
))