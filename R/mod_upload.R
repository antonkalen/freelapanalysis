#' upload UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_upload_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fileInput(
      ns("file_input"),
      label = "Upload CSV file",
      accept = c(
        "text/csv",
        "text/comma-separated-values,text/plain",
        ".csv"
      )
    )
  )
}

#' upload Server Functions
#'
#' @noRd
mod_upload_server <- function(id, reactives) {
  moduleServer(
    id,
    function(input, output, session) {
      observeEvent(input$file_input, {
        # Read the uploaded CSV file
        reactives$uploaded_data <- load_csv_file(input$file_input$datapath)
      })
    }
  )
}

## To be copied in the UI
# mod_upload_ui("upload_1")

## To be copied in the server
# mod_upload_server("upload_1")
