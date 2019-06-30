install.packages("remotes")
remotes::install_deps(dependencies = "Depends")

# Get Remotes
remotes <- remotes::local_package_deps(dependencies = "Remotes")

if (!is.null(remotes)) {
  purrr::walk(
    .x = strsplit(
      x = remotes::local_package_deps(dependencies = "Remotes"),
      split = "::"
    ),
    .f = ~rlang::exec(
      .fn = utils::getFromNamespace(x = paste0("install_", .x[1]), ns = "remotes"),
      repo = .x[2],
      upgrade = "never"
    )
  )
}
