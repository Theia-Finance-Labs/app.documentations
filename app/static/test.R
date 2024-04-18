library(shiny)
library(shiny.semantic)

# Define UI
ui <- semanticPage(
  tags$head(
    tags$link(rel = "stylesheet", href = "https://cdn.jsdelivr.net/npm/semantic-ui@2.4.1/dist/semantic.min.css"),
    tags$script(src = "https://code.jquery.com/jquery-3.5.1.min.js"),
    tags$script(src = "https://cdn.jsdelivr.net/npm/semantic-ui@2.4.1/dist/semantic.min.js")
  ),
  tags$style(HTML("
           body {
            font-family: 'Lato', 'Helvetica Neue', Arial, Helvetica, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background: #f0f0f0;
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
    z-index: 2;
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
            z-index: 1000; /* High z-index to ensure visibility */
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
            z-index: 1;
        }
        /* Responsive adjustments */
@media (max-width: 768px) {
    .content {
        flex-direction: column;
    }

    nav {
        width: 250px; /* Fixed width for the navbar */
        order: -1;
    }

    section.main-content {
        margin-left: 0;
        width: 100%; /* Full width */
    }

}
    ")),
  div(
    class = "content",
    tags$nav(
      class = "ui vertical menu",
      div(class = "item ui header", "Navigation"),
      div(
        class = "ui dropdown item",
        "Documentation",
        tags$i(class = "dropdown icon"),
        div(
          class = "menu",
          a(class = "item", href = "/doc/page1.html", "Page 1"),
          a(class = "item", href = "/doc/page2.html", "Page 2"),
          a(class = "item", href = "/doc/page3.html", "Page 3")
        )
      ),
      a(class = "item", href = "/about.html", "About Us")
    ),
    tags$section(
      class = "main-content",
      h2("Main Content Area"),
      p("This is the main content area of the homepage. Feel free to explore the website through the navigation menu to the left.")
    )
  ),
  tags$footer(
    p("Copyright © 2023 Your Company")
  )
)

# Define server logic
server <- function(input, output, session) {
  # Server logic
}

# Run the application
shinyApp(ui, server)
