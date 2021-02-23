bolagsanalyser_skeleton <- function(path) {
  resources <- bolagsanalyser_file("rstudio", "templates", "project",
                           "bolagsanalyser_resources")

  sub_dirs <- list.dirs(resources, recursive = TRUE, full.names = FALSE)
  sub_dirs <- sub_dirs[-which(sub_dirs == "")]
  files <- list.files(resources, recursive = TRUE, include.dirs = FALSE)

  # ensure directories exists
  new_path <- c(path, file.path(path, sub_dirs))
  fs::dir_create(new_path)

  source <- file.path(resources, files)
  target <- file.path(path, files)
  file.copy(source, target)

  f <- file.path(path, "_bookdown.yml")
  x <- xfun::read_utf8(f)
  xfun::write_utf8(c(sprintf('book_filename: "%s"',
                             stringr::str_to_title(basename(path))),
                     x,
                     "",
                     "rmd_files: [",
                     sprintf('  "%s.Rmd"', tolower(basename(path))),
                     "]"),
                   f)

  fs::file_move(file.path(path, "index.Rmd"),
                file.path(path, paste0(tolower(basename(path)), ".Rmd")))

  TRUE
}
