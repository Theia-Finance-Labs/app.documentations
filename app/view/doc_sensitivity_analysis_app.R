box::use(
  shiny[NS, moduleServer, tags, HTML, ...],
  shiny.semantic[...])

ui <- function(id) {
  ns <- NS(id)
  semanticPage(
    tags$h1("Sensitivity Analysis", class = "ui dividing header"),
    tags$h3("Explore how different parameters affect Trisk outcomes by running multiple simulations and analyzing their results.", class = "ui sub header"),
    tags$hr(),
    tags$div(
      class = "ui segments",
      style = "display: flex; flex-direction: column; align-items: flex-start;",
      
      # Section I: Parameters Selection
      tags$div(
        class = "ui segment",
        style = "margin-bottom: 20px;",
        tags$h2("I. Parameters Selection"),
        tags$div(
          style = "display: flex; align-items: flex-start;",
          tags$img(src = "static/sensitivity_analysis_app/parameters_selection.png", class = "ui medium image"),
          tags$div(
            style = "margin-left: 20px;",
            tags$ol(
              tags$li(
                tags$strong("Parameters Selection"),
                tags$p("Select the desired parameters similar to the portfolio analysis app. The key difference is that instead of filtering on a portfolio's parameters, this app allows you to filter all assets within a specific country.")
              ),
              tags$li(
                tags$strong("Run Trisk"),
                tags$p("After setting your parameters, press the 'Run Trisk' button. Each run and its parameters will be recorded and displayed on the right. You can perform multiple runs with different parameter combinations; each new run will be recorded for comparison.")
              )
            )
          )
        )
      ),
      
      # Section II: Parameters Visualization
      tags$div(
        class = "ui segment",
        style = "margin-bottom: 20px;",
        tags$h2("II. Parameters Visualization"),
        tags$div(
          style = "display: flex; align-items: flex-start;",
          tags$img(src = "static/sensitivity_analysis_app/parameters_visualization.png", class = "ui medium image"),
          tags$div(
            style = "margin-left: 20px;",
            tags$ol(
              tags$li(
                tags$strong("Parameters Dataframe"),
                tags$p("The parameters dataframe lists all the runs you've executed. Each row corresponds to a Trisk run, and the columns display the parameters used in that run.")
              ),
              tags$li(
                tags$strong("Hide Sidebar"),
                tags$p("Use the 'Hide Sidebar' button to close the sidebar, allowing you to focus on the main content.")
              )
            )
          )
        )
      ),
      
      # Section III: Run ID and Delete Rows
      tags$div(
        class = "ui segment",
        style = "margin-bottom: 20px;",
        tags$h2("III. Run ID and Delete Rows"),
        tags$div(
          style = "display: flex; align-items: flex-start;",
          tags$img(src = "static/sensitivity_analysis_app/run_id_and_delete_rows.png", class = "ui medium image"),
          tags$div(
            style = "margin-left: 20px;",
            tags$ol(
              tags$li(
                tags$strong("Select and Delete"),
                tags$p("To exclude specific runs from your analysis, select the corresponding row(s) in the parameters dataframe and click the 'Delete' button. The data from these runs will be removed from subsequent analyses.")
              ),
              tags$li(
                tags$strong("Identify Run IDs of Interest"),
                tags$p("Each run is assigned a unique 'run_id'. This ID helps you correlate runs with their parameters and results, especially when interpreting the plots.")
              )
            )
          )
        )
      ),
      
      # Section IV: Production Trajectories
      tags$div(
        class = "ui segment",
        style = "margin-bottom: 20px;",
        tags$h2("IV. Production Trajectories"),
        tags$div(
          style = "display: flex; align-items: flex-start;",
          tags$img(src = "static/sensitivity_analysis_app/production_trajectories.png", class = "ui medium image"),
          tags$div(
            style = "margin-left: 20px;",
            tags$ol(
              tags$li(
                tags$strong("Run ID Matching Line Color"),
                tags$p("In the production trajectories plot, each line color corresponds to a specific 'run_id'. This visual cue helps you match each trajectory to its parameters listed in the parameters dataframe.")
              ),
              tags$li(
                tags$strong("Production Trajectories from Today to 2050"),
                tags$p("The plot displays production trajectories from the current year up to 2050. All trajectories start at 100%, representing their initial value, and show how production changes over time based on different parameter settings.")
              )
            )
          )
        )
      ),
      
      # Section V: Download for Local Analysis
      tags$div(
        class = "ui segment",
        style = "margin-bottom: 20px;",
        tags$h2("V. Download for Local Analysis"),
        tags$div(
          style = "display: flex; align-items: flex-start;",
          tags$img(src = "static/sensitivity_analysis_app/download_for_local_analysis.png", class = "ui medium image"),
          tags$div(
            style = "margin-left: 20px;",
            tags$p("Click the 'Download to Excel' button to export the data underlying the plots. The Excel file organizes data by technology in separate tabs, with each run represented as a column. The last tab includes the parameters and associated 'run_id's for reference.")
          )
        )
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Server logic (if any) goes here
  })
}
