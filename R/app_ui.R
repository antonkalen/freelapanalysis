#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    bslib::page_navbar(
      title = "Freelap analysis",
      theme = bslib::bs_theme(),
      fillable = FALSE,
      bslib::nav_panel(
        "Edit data",
        bslib::layout_sidebar(
          sidebar = bslib::sidebar(
            mod_upload_ui("upload_1"),
          ),
          fluidRow(column(width = 12))
        )
      ),
      bslib::nav_panel(
        "Output",
        bslib::layout_sidebar(
          sidebar = bslib::sidebar(),
          fluidRow(column(
            width = 12,
            bslib::navset_tab(
              bslib::nav_panel("Men"),
              bslib::nav_panel("Women"),
              bslib::nav_spacer(),
              bslib::nav_item()
            )
          ))
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "freelapanalysis"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
