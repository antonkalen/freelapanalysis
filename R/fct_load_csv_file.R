#' load_csv_file
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
load_csv_file <- function(file) {
  lines <- readr::read_lines(file)
  header_index <- which(stringr::str_detect(lines, 'SPLIT'))[1]
  skip_rows <- header_index - 1

  readr::read_csv2(file, skip = skip_rows) |>
    dplyr::filter(!is.na(SPLIT)) |>
    dplyr::select(-LAP, -starts_with('SPLIT')) |>
    dplyr::select(
      sex = 2,
      id = 4,
      Name = 3,
      Loops = 1,
      tidyselect::everything()
    ) |>
    dplyr::mutate(across(where(is.numeric), \(x) round(x)))
}
