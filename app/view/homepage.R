box::use(
  shiny[NS, moduleServer, tags, HTML, ...],
  shiny.semantic[...])
#' @export
ui <- function(id) {
  ns <- NS(id)
  shiny::tags$div(
    id = ns("content"),
    shiny::includeMarkdown('app/logic/theia.Rmd')
  )
}


#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

  })
}
