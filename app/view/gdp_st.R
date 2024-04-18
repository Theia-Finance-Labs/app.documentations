box::use(
  shiny[NS, moduleServer, tags, HTML, ...],
  shiny.semantic[...],
  shiny.router[...]
)
#' @export
ui <- function(id) {
  ns <- NS(id)
  shiny::tags$div(id = ns("content"), h1("GDP ST"))
}


#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

  })
}
