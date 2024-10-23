box::use(
  shiny[NS, moduleServer, tags, HTML, ...],
  shiny.semantic[...]
)
box::use(
  view/homepage,
  # view/crispy_doc_bondsnloans,
  # view/crispy_doc_equity,
  view/doc_portfolio_app,
  view/doc_sensitivity_analysis_app,
  view/gdp_st,
  view/crispy_doc_trisk_sidebar
)


#' @export
ui <- function(id) {
  ns <- NS(id)

  semanticPage(
tags$style(HTML("
  body {
      font-family: 'Lato', 'Helvetica Neue', Arial, Helvetica, sans-serif;
      display: flex;
      flex-direction: column;
      height: 100vh;
      background: #f0f0f0;
      margin: 0;
      padding: 0;
  }

  .content {
      flex: 1;
      display: flex;
      margin-top: 10px;
  }

  nav {
      flex: 1;  /* Change this to take up 1 part */
      padding: 20px;
      margin: 10px 10px 10px 0;
      background-color: #f9f9f9;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  }

  .ui.vertical.menu {
      width: 100%;
  }

  section {
      flex: 3;  /* Change this to take up 3 parts */
      padding: 20px;
      margin: 10px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      overflow-y: auto;
  }

  footer {
      padding: 20px;
      text-align: center;
      background-color: #ffffff;
      box-shadow: 0 -2px 4px rgba(0,0,0,0.1);
  }

  @media (max-width: 768px) {
      .content {
          flex-direction: column;
      }

      section.main-content {
          margin-left: 0;
          width: 100%;
      }
  }
")),
    div(
      class = "content",
  tags$nav(
  class = "ui vertical fluid pointing menu",
  tags$div(class = "item", style="background-color: #f7f7f7; text-align: center; padding: 10px 0;", "MAIN NAVIGATION"),
  actionLink(ns("homepage_link"), "Homepage", class = "item"),
  tags$div(class = "item", style="background-color: #f7f7f7; text-align: center; padding: 10px 0;", "CRISPY APP ANALYSIS"),
  # actionLink(ns("equities_link"), "Equities", class = "item"),
  # actionLink(ns("bonds_loans_link"), "Bonds & Loans", class = "item"),
  actionLink(ns("doc_portfolio_app_link"), "Portfolio Analysis", class = "item"),
  actionLink(ns("doc_sensitivity_analysis_app_link"), "Sensitivity Analysis", class = "item"),
  actionLink(ns("trisk_sidebar_link"), "Trisk Sidebar", class = "item"),
  tags$div(class = "item", style="background-color: #f7f7f7; text-align: center; padding: 10px 0;", "OTHER APPS"),
  actionLink(ns("gdp_st_link"), "GDP Stress Tests", class = "item")
)

,
      tags$section(
        class = "main-content",
         uiOutput(ns("main_content"))
      )
    )
    # ,tags$footer(
    #     p("Copyright © 2024 Theia")
    # )
  )
}


#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # INIT

    homepage$server("homepage")
    # crispy_doc_bondsnloans$server("crispy_doc_bondsnloans")
    # crispy_doc_equity$server("crispy_doc_equity")
    doc_portfolio_app$server("doc_portfolio_app")
    doc_sensitivity_analysis_app$server("doc_sensitivity_analysis_app")
    crispy_doc_trisk_sidebar$server("crispy_doc_trisk_sidebar")
    gdp_st$server("gdp_st")
    
      
    ns <- session$ns

    output$main_content <- renderUI({
      homepage$ui(ns("homepage"))
    })


    # ROUTING

    observeEvent(input$homepage_link, {
      output$main_content <- renderUI({
        homepage$ui(ns("homepage"))
      })
    }, ignoreInit = TRUE)

    observeEvent(input$gdp_st_link, {
      output$main_content <- renderUI({
        gdp_st$ui(ns("gdp_st"))
      })
    }, ignoreInit = TRUE)    
    
    # observeEvent(input$bonds_loans_link, {
    #   output$main_content <- renderUI({
    #     crispy_doc_bondsnloans$ui(ns("crispy_doc_bondsnloans"))
    #   })
    # }, ignoreInit = TRUE)
    
    # observeEvent(input$equities_link, {
    #   output$main_content <- renderUI({
    #     crispy_doc_equity$ui(ns("crispy_doc_equity"))
    #   })
    # }, ignoreInit = TRUE)

    observeEvent(input$trisk_sidebar_link, {
      output$main_content <- renderUI({
        crispy_doc_trisk_sidebar$ui(ns("crispy_doc_trisk_sidebar"))
      })
    }, ignoreInit = TRUE)


    observeEvent(input$doc_portfolio_app_link, {
      output$main_content <- renderUI({
        doc_portfolio_app$ui(ns("doc_portfolio_app"))
      })
    }, ignoreInit = TRUE)

    observeEvent(input$doc_sensitivity_analysis_app_link, {
      output$main_content <- renderUI({
        doc_sensitivity_analysis_app$ui(ns("doc_sensitivity_analysis_app"))
      })
    }, ignoreInit = TRUE)

  })
}
