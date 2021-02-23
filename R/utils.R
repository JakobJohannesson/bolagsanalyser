#' Generate a section for the yaml input
#'
#' @param input a file containing markdown text
#' @param sep a separator for each line.
#'
#' @return a string
#'
#' @export
inc <- function(input, sep = "\n\n  ") {
  paste(readLines(input), collapse = sep)
}

bolagsanalyser_file <- function(...) {
  system.file(..., package = "bolagsanalyser", mustWork = TRUE)
}
