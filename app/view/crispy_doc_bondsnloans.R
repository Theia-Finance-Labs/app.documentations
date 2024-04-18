box::use(
  shiny[NS, moduleServer, tags, HTML, ...],
  shiny.semantic[...],
  shiny.router[...]
)
#' @export
ui <- function(id) {
  ns <- NS(id)
  shiny::tags$div(id = ns("content"), "Content of Documentation Page 1")
}


#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

  })
}
