box::use(
  shiny[NS, moduleServer, tags, HTML, ...]
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
fluidPage(
    tags$head(
      tags$style(HTML("
        /* Overall navbar styling */
        .navbar {
          background-color: #f9f9f9;
          padding: 10px 20px;
          box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        /* Style for nav items */
        .nav-link, .navbar-brand {
          color: #555;
          margin-right: 10px;
          transition: color 0.3s ease;
        }
        
        /* Hover effect for nav items */
        .nav-link:hover, .navbar-brand:hover {
          color: #333;
          text-decoration: none;
        }

        /* Dropdown menu styling */
        .dropdown-menu {
          border: none;
          box-shadow: 0 4px 8px rgba(0,0,0,0.1);
          font-size: 16px;
        }

        /* Dropdown item styling */
        .dropdown-item {
          color: #555;
          transition: background-color 0.2s ease;
        }

        /* Hover effect for dropdown items */
        .dropdown-item:hover {
          background-color: #f0f0f0;
          color: #333;
        }
      "))
    ),
    # Navbar with dropdown and about us link right-aligned
    navbarPage(
      title = "",
      position = "fixed-top",
      theme = bslib::bs_theme(version = 4),
      windowTitle = "Navigation Example",
      
      header = tags$a(href = "#about_us", class = "navbar-brand", "About Us"),  # Positioned on the right using the header for a cleaner look

      # First tab is actually a dropdown
      navbarMenu(
        title = "Documentation",
        tabPanel(title = "Documentation 1", value = "doc1"),
        tabPanel(title = "Documentation 2", value = "doc2")
      )
    ),
    # Content section where content will be displayed
    tags$div(
      class = "container-fluid",
      tags$div(class = "p-5", style = "margin-top: 60px;", 
        uiOutput(ns("page_content"))
      )
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



