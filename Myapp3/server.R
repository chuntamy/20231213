library(shiny)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
  # Expression that generates a plot of the distribution. The expression is
  # wrapped in a call to renderPlot to indicate that:
  # 
  # 1) It is 'reactive' and therefore should be autlibrary(shiny)
  
  # Your function
  Samplesize = function(Sig,p,X) {
    Z = qnorm(1-Sig/2)
    n = p*(1-p)*Z^2/X^2
    n
  }
  
  # Define server logic required to calculate the needed sample size
  shinyServer(function(input, output) {
    
    output$Size = renderText({
      N = Samplesize(Sig = input$Sig,p = input$p, X = input$X)      
      paste("We need",round(N),"samples for this sampling.")
    })
    
  })omatically re-executed
  # when inputs change 2) Its output type is a plot
  output$distPlot = renderPlot({
    
    # generate an rnorm distribution and plot it
    dist = rnorm(input$obs,mean=input$M,sd=input$S)
    hist(dist,col=input$Color)
  })
  
})