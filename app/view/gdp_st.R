box::use(
  shiny[NS, moduleServer, tags, HTML, ...],
  shiny.semantic[...])

  
#' @export
ui <- function(id) {
  ns <- NS(id)
  shiny::includeMarkdown('app/logic/st_app_methodo.Rmd')
}


#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

  })
}
