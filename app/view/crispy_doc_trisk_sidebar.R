# Load required packages
box::use(
  shiny[moduleServer, NS, tags],
  shiny.semantic[semanticPage])



####### UI
ui <- function(id) {
  ns <- NS(id)
  semanticPage(
    tags$div(class = "ui dividing header", "Trisk Sidebar"),
    tags$p("Trisk analysis facilitates the assessment of transition risks by applying a shock to company data and visualizing the impact on investment portfolios."),
    
    tags$div(
      class = "ui segments",
      style = "display: flex; flex-direction: column; align-items: flex-start;",
      
      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/trisk_sidebar/data.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$p("Initiate a trisk run, which processes company data under shock conditions, with results saved and aggregated in the database.")
        )
      ),
      
      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/trisk_sidebar/scenario_choice.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$p("Select baseline and shock scenarios, as well as geography, to compute the transition impact.")
        )
      ),
      
      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/trisk_sidebar/trisk_parameters.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$table(
            class = "ui celled table",
            tags$thead(
              tags$tr(
                tags$th("Name"),
                tags$th("Description"),
                tags$th("Impact on Outputs")
              )
            ),
            tags$tbody(
              tags$tr(
                tags$td("Shock Year"),
                tags$td("The year in which the shock scenario is applied."),
                tags$td("Determines the point of shock for risk assessment.")
              ),
              tags$tr(
                tags$td("Risk Free Rate"),
                tags$td("Used as the baseline for measuring risk."),
                tags$td("Impacts discounting of future cash flows.")
              ),
              tags$tr(
                tags$td("Discount Rate"),
                tags$td("The rate used to discount future cash flows to present value."),
                tags$td("Affects the present value of future cash flows.")
              ),
              tags$tr(
                tags$td("Growth Rate"),
                tags$td("The rate at which a company's earnings are expected to grow."),
                tags$td("Influences projections of future earnings.")
              ),
              tags$tr(
                tags$td("Dividend Rate"),
                tags$td("The rate at which dividends are expected to grow."),
                tags$td("Impacts the expected return on equity investments.")
              ),
              tags$tr(
                tags$td("Carbon Price Model"),
                tags$td("Drop-down menu that allows selection of a carbon pricing model."),
                tags$td("Determines the cost of carbon used in scenario analysis.")
              ),
              tags$tr(
                tags$td("Market Passthrough"),
                tags$td("Indicates how much of the carbon price is passed through to market prices."),
                tags$td("Impacts the final cost of products considering the carbon price.")
              )
              # Add more parameters as needed
            )
          )
        )
      )
    )
  )
}


####### Server

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}
