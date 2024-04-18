box::use(
  shiny[NS, moduleServer, tags, HTML, ...],
  shiny.semantic[...],
  shiny.router[...]
)
#' @export
ui <- function(id) {
  ns <- NS(id)
  shiny::tags$div(
    id = ns("content"),
    h2("EU LIFE Project Grant"),
    p("Scientific Transition Risk Exercises for Stress tests & Scenario Analysis has received funding from the European Union’s Life programme under Grant No. LIFE21-GIC-DE-Stress under the LIFE-2021-SAP-CLIMA funding call")
  )
}


#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

  })
}
