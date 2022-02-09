
library(esquisse)
library(shiny)

shinyApp(
  ui = fluidPage(esquisse_ui(id = "key")), 
  server = function(input, output, session) {esquisse_server(id = "key")})
