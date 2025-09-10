#' data_editor UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_data_editor_ui <- function(id) {
  ns <- NS(id)
  tagList(
    DataEditR::dataEditUI(ns("data_editor"))
  )
}

#' data_editor Server Functions
#'
#' @noRd
mod_data_editor_server <- function(id, reactives) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    # Data editor module
    observeEvent(reactives$uploaded_data, {
      edited_data <- DataEditR::dataEditServer(
        id = "data_editor",
        data = reactives$uploaded_data,
        col_names = FALSE
      )
    })
  })
}

## To be copied in the UI
# mod_data_editor_ui("data_editor_1")

## To be copied in the server
# mod_data_editor_server("data_editor_1")
