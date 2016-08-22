library(shiny)
library(boot)
library(lfstat)
data(manaus)
#Reference level is supposed to be at 35.874m above mean sea level, therefore,
#the actual elevation of the river is:
manaus <- manaus + 35.874
help <- readLines("help.txt")

shinyServer(
      function(input, output) {
            data <- reactive(
                   window(manaus, input$startDate, input$endDate))
            Hmax <- reactive(max(data()))
            fit <- reactive(evfit(data(), distribution = "gum",
                                  extreme = input$ext))
            high <- reactive(round(evquantile(
                  fit(), return.period = input$returnPeriod)$T_Years_Event, 2))
            output$Hydrogram <- renderPlot({
                  plot(data(), xlab = "Year",
                       ylab = "Monthly average water level (m)",
                       main = "Time series of Rio Negro's water level")
                  text(mean(time(data())), Hmax(),
                       labels = paste0("Extreme level = ",
                                       high(), "m"))
            })
            observeEvent(input$help, output$help <- renderText(help))
            observeEvent(input$noHelp, output$help <- renderText(NULL))
      }
)