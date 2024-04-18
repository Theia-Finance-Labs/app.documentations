box::use(
  shiny[NS, moduleServer, tags, HTML]
)

# Module for Documentation Page 1
documentation1UI <- function(id) {
  ns <- NS(id)
  shiny::tags$div(id = ns("content"), "Content of Documentation Page 1")
}

documentation1 <- function(input, output, session) {
  # Placeholder for server-side logic if needed
}

# Module for Documentation Page 2
documentation2UI <- function(id) {
  ns <- NS(id)
  shiny::tags$div(id = ns("content"), "Content of Documentation Page 2")
}

documentation2 <- function(input, output, session) {
  # Placeholder for server-side logic if needed
}

# Module for About Us Page
aboutUsUI <- function(id) {
  ns <- NS(id)
  shiny::tags$div(id = ns("content"), "Content of About Us Page")
}

aboutUs <- function(input, output, session) {
  # Placeholder for server-side logic if needed
}

#' @export
ui <- function(id) {
  ns <- NS(id)
shiny::fluidPage(
    shiny::tags$head(
      shiny::tags$style(shiny::HTML("
        .sidebar-section {
          padding: 20px;
          background-color: #f9f9f9;
          margin: 15px 0;
          border-radius: 8px;
          box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .sidebar-section .ui.header {
          font-size: 18px;
          color: #333;
          margin-bottom: 15px;
        }
        .ui.button {
          background-color: #d4d4d5;
          color: white;
          border: none;
          border-radius: 4px;
          margin: 8px 0;
          display: block;
          width: 100%; /* Ensures full width */
        }
        .ui.button:hover {
          color: black; /* Changes text color to black on hover */
        }        
        .ui.divider {
          margin: 20px 0;
        }
      "))
    ),
    # Sidebar Section
    shiny::tags$div(
      class = "sidebar-section",
      shiny::tags$div(class = "ui header", "Navigation"),
      shiny::actionButton(ns("btn_doc1"), "Go to Documentation 1", class = "ui button"),
      shiny::actionButton(ns("btn_doc2"), "Go to Documentation 2", class = "ui button"),
      shiny::actionButton(ns("btn_about"), "About Us", class = "ui button"),
      shiny::tags$div(class = "ui divider")
    ),
    # Content Section
    shiny::tags$div(
      class = "sidebar-section",
      shiny::tags$div(class = "ui header", "Content"),
      shiny::uiOutput(ns("page_content"))  # Placeholder for displaying content of selected module
    )
  )

}


#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
      # Observers to switch between pages
  shiny::observeEvent(input$btn_doc1, {
    output$page_content <- shiny::renderUI({
      documentation1UI("doc1")
    })
  })
  
  shiny::observeEvent(input$btn_doc2, {
    output$page_content <- shiny::renderUI({
      documentation2UI("doc2")
    })
  })
  
  shiny::observeEvent(input$btn_about, {
    output$page_content <- shiny::renderUI({
      aboutUsUI("about")
    })
  })
  })
}



