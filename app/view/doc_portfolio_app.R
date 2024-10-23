box::use(
  shiny[NS, moduleServer, tags, HTML, ...],
  shiny.semantic[...])

ui <- function(id) {
  ns <- NS(id)
  semanticPage(
    tags$h1("Portfolio Trisk Analysis", class = "ui dividing header"),
    tags$h3("Learn how to run and analyze Trisk filtered on a portfolio, including uploading portfolios, selecting parameters, and interpreting results.", class = "ui sub header"),
    tags$hr(),
    tags$div(
      class = "ui segments",
      style = "display: flex; flex-direction: column; align-items: flex-start;",
      
      # Section I: Running Trisk Filtered on a Portfolio
      tags$div(
        class = "ui segment",
        style = "margin-bottom: 20px;",
        tags$h2("I. Running Trisk Filtered on a Portfolio"),
        tags$div(
          style = "display: flex; align-items: flex-start;",
          tags$img(src = "static/portfolio_app/running_trisk_filtered_on_portfolio.png", class = "ui medium image"),
          tags$div(
            style = "margin-left: 20px;",
            tags$ol(
              tags$li(
                tags$strong("Download Example Portfolio"),
                tags$p("Click the 'Download Example Portfolio' button to obtain an Excel file illustrating the required columns for creating a portfolio compatible with Trisk. The file also includes possible values for the 'sector' and 'technology' columns.")
              ),
              tags$li(
                tags$strong("Upload Portfolio"),
                tags$p("Your portfolio can be structured in three different ways, resulting in company-level or country-level granularity:"),
                tags$ul(
                  tags$li(
                    tags$strong("Company-Level Results Using PACTA Company IDs:"),
                    " If the 'company_id' column is filled with PACTA company IDs, Trisk will directly match the results to the corresponding company, country, sector, and technology. This is the recommended method for preparing your portfolio."
                  ),
                  tags$li(
                    tags$strong("Company-Level Results Using Company Names:"),
                    " If 'company_id' is empty but 'company_name' is filled, we attempt to match companies using fuzzy matching between your provided company names and our backend database. The company names are similar to those in the 'Owner' column of Global Energy Monitor data."
                  ),
                  tags$li(
                    tags$strong("Country-Level Results:"),
                    " If both 'company_name' and 'company_id' are empty, Trisk aggregates results per country and matches them to your portfolio based on country, sector, and technology. This method is recommended if PACTA company IDs are not available."
                  )
                )
              ),
              tags$li(
                tags$strong("Select Trisk Parameters"),
                tags$p("Choose parameters relevant to your use case. The baseline scenario, shock scenario, and shock year will influence the production trajectories, while other parameters will affect financial indicators like NPVs and PDs.")
              ),
              tags$li(
                tags$strong("Run Trisk"),
                tags$p("Press the 'Run Trisk' button to start computations on a subset of companies from our assets backend table, filtered according to the companies and technologies defined in your portfolio.")
              ),
              tags$li(
                tags$strong("Hide the Sidebar"),
                tags$p("You can close the sidebar to explore the results or reopen it to try new parameter combinations.")
              )
            )
          )
        )
      ),
      
      # Section II: Analyzing Portfolio Results
      tags$div(
        class = "ui segment",
        style = "margin-bottom: 20px;",
        tags$h2("II. Analyzing Portfolio Results"),
        tags$div(
          style = "display: flex; align-items: flex-start;",
          tags$img(src = "static/portfolio_app/analysing_portfolio_results.png", class = "ui medium image"),
          tags$div(
            style = "margin-left: 20px;",
            tags$ol(
              tags$li(
                tags$strong("Portfolio Results Table"),
                tags$p("The top table displays the output results as computed by Trisk. Columns from 'company_name' to 'loss_given_default' come from your portfolio. 'npv_change' and 'pd_difference' are computed by Trisk, and 'expected_loss' is calculated as lgd × exposure × pd.")
              ),
              tags$li(
                tags$strong("Download Results as an Excel"),
                tags$p("Use the 'Download Excel' button to download the results for local analysis.")
              )
            )
          )
        )
      ),
      
      # Section III: Analyzing Plot Results
      tags$div(
        class = "ui segment",
        style = "margin-bottom: 20px;",
        tags$h2("III. Analyzing Plot Results"),
        tags$div(
          style = "display: flex; align-items: flex-start;",
          tags$img(src = "static/portfolio_app/analysing_plots_results.png", class = "ui medium image"),
          tags$div(
            style = "margin-left: 20px;",
            tags$ol(
              tags$li(
                tags$strong("Value Change Plot"),
                tags$p("This plot represents the percentage change of NPV between the baseline and shock scenarios.")
              ),
              tags$li(
                tags$strong("Exposure Change Plot"),
                tags$p("This graph visualizes the value change applied to your portfolio's exposure.")
              ),
              tags$li(
                tags$strong("PDs Plot"),
                tags$p("This shows the Probability of Default (PD) for each sector and term, under both baseline and shock scenarios.")
              ),
              tags$li(
                tags$strong("Expected Loss Plot"),
                tags$p("This plot visualizes the expected loss, calculated from PD at shock, LGD, and exposure.")
              )
            )
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
