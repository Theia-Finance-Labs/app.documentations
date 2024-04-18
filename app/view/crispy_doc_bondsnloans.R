# Load required packages
box::use(
  shiny[moduleServer, NS, tags],
  shiny.semantic[semanticPage])



####### UI
ui <- function(id) {
  ns <- NS(id)
  semanticPage(
    tags$h1("Bonds And Loans Portfolio Analysis", class = "ui dividing header"),
    tags$h3("Evaluate risk scenarios on a portfolio in the context of ", class = "ui sub header"),
    tags$hr(),
    tags$div(
      class = "ui segments",
      style = "display: flex; flex-direction: column; align-items: flex-start;",
      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/bond_n_loan/portfolio.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$p("The Portfolio element displays investments with editable 'Exposure' and 'Loss Given Default'. Double-click to edit a cell directly within the table. The 'Term' denotes the period of investment in 2.5-year increments.")
        )
      ),
      
      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/bond_n_loan/portfolio_edition.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$p("Add new investment entries by specifying sector or business unit and the associated term using the 'Add new row' function.")
        )
      ),
      
      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/bond_n_loan/select_and_delete.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$p("Select one (or multiple with ctrl+click) and click delete to remove rows.")
        )
      ),

      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/bond_n_loan/pds.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$p("Probability of Default (PD) is calculated for each term under baseline and shock scenarios, offering a comparative view of potential risk fluctuations.")
        )
      ),
      
      tags$div(
        class = "ui segment",
        style = "display: flex; align-items: center; justify-content: start; margin-bottom: 20px;",
        tags$img(src = "static/bond_n_loan/expected_loss.png", class = "ui medium image"),
        tags$div(
          style = "margin-left: 20px;",
          tags$p("The Expected Loss chart displays investment totals (in grey) overlapped with potential losses (in red), calculated in million USD.")
        )
      )
    )
  )
}


####### Server

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}
