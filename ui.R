library(shiny)

shinyUI(fluidPage(
      headerPanel("Hydrological extremes calculation"),
      sidebarPanel(
            sliderInput("startDate", "Initial date", value = 1903,
                        min = 1903, max = 1993),
            sliderInput("endDate", "Final date", value = 1993, min = 1903,
                         max = 1993),
            numericInput("returnPeriod", "Return period (years)",
                         value = 100, min = 1, step = 100),
            selectInput("ext", "Extreme:", c("maximum", "minimum")),
            actionButton("help", "Show help"),
            actionButton("noHelp", "Hide help")
      ),
      mainPanel(
            plotOutput('Hydrogram'),
            textOutput("help")
      )
))