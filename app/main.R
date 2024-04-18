box::use(
  shiny[NS, moduleServer, tags, HTML, ...],
  shiny.semantic[...]
)
box::use(
  view/homepage,
  view/crispy_doc_bondsnloans,
  view/crispy_doc_equity,
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
          margin: 0; /* Necessary to override browser defaults */
          padding: 0; /* Necessary to override browser defaults */
      }

      .content {
          flex: 1;
          display: flex;
          margin-top: 10px;
      }

      nav {
          flex-basis: 25%;
          padding: 20px;
          margin: 10px 10px 10px 0;
          background-color: #f9f9f9;
          border-radius: 8px;
          box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      }

      .ui.vertical.menu {
          width: 100%;
      }

      .ui.vertical.menu .menu {
          position: absolute;
          background-color: #ffffff;
          display: none;
          width: 100%;
          left: 0;
          z-index: 1000;
      }

      .ui.vertical.menu .dropdown.item:hover .menu {
          display: block;
      }

      section {
          flex-grow: 3;
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

          nav {
              width: 250px; /* This specific width is necessary for your design at this breakpoint */
              order: -1;
          }

          section.main-content {
              margin-left: 0;
              width: 100%;
          }
      }"
      )),
    div(
      class = "content",
      tags$nav(
        class = "ui vertical menu",
        div(class = "item ui header", "Documentation"),
        actionLink(ns("homepage_link"), "Homepage", class = "item"),
        actionLink(ns("gdp_st_link"), "GDP Stress Tests", class = "item"),
        div(
          class = "ui dropdown item",
          "Crispy App",
          tags$i(class = "dropdown icon"),
          div(
            class = "menu",
            actionLink(ns("trisk_sidebar_link"), "Trisk Sidebar", class = "item"),
            actionLink(ns("bonds_loans_link"), "Bonds & Loans", class = "item"),
            actionLink(ns("equities_link"), "Equities", class = "item"),
          )
        )
      ),
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
    crispy_doc_bondsnloans$server("crispy_doc_bondsnloans")
    crispy_doc_equity$server("crispy_doc_equity")
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
    
    observeEvent(input$bonds_loans_link, {
      output$main_content <- renderUI({
        crispy_doc_bondsnloans$ui(ns("crispy_doc_bondsnloans"))
      })
    }, ignoreInit = TRUE)
    
    observeEvent(input$equities_link, {
      output$main_content <- renderUI({
        crispy_doc_equity$ui(ns("crispy_doc_equity"))
      })
    }, ignoreInit = TRUE)

    observeEvent(input$trisk_sidebar_link, {
      output$main_content <- renderUI({
        crispy_doc_trisk_sidebar$ui(ns("crispy_doc_trisk_sidebar"))
      })
    }, ignoreInit = TRUE)


  })
}
