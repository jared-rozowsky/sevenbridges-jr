.onLoad <- function(libname, pkgname) {
  lst <- list(
    offset = 0,
    limit = 100,
    # date_from = "01-01-2022",
    # date_to = "09-21-2022",
    advance_access = FALSE,
    input_check = TRUE,
    taskhook = TaskHook()
  )

  options(sevenbridges = lst)
}
