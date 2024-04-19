box::use(
  shiny[NS, moduleServer, tags, HTML, ...],
  shiny.semantic[...])


ui <- function(id) {
  ns <- NS(id)
  semanticPage(
    tags$h1("Equities Portfolio Analysis", class = "ui dividing header"),
    tags$h3("Explore the dynamics of equity investments with tools for editing exposures, visualizing NPV changes, and understanding production trajectories.", class = "ui sub header"),
    tags$hr(),
    tags$div(
      class = "ui segments",
      style = "display: flex; flex-direction: column; align-items: flex-start;",
      
      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/equity/portfolio.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$p("The portfolio table includes columns for exposure, sector, crispy value change, and loss. 
                  Exposure can be edited by double-clicking a cell.")
        )
      ),
      
      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/equity/npv_change.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$p("The NPV Change bar plot shows the percentage change in NPV across sectors from the baseline to the shock scenario.")
        )
      ),
      
      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/equity/exposure_change.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$p("The Exposure Change graph illustrates the amount of potential loss overlaid on the total investment amount in each sector.")
        )
      ),
      
      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/equity/production_trajectories.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$p(" The Production Trajectories plot depicts percentage production paths across different sectors under baseline, target, and shock scenarios. The productions are expressed in percentage of the maximum value accross the 3 pathways.")
        )
      )
    )
  )
}



server <- function(id) {
  moduleServer(id, function(input, output, session) {

  })
}
