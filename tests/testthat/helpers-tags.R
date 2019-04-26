expect_shinytag <- function(object) {
  act <- testthat::quasi_label(rlang::enquo(object), arg = "object")
  act$class <- class(object)[1]
  expect(
    act$class == "shiny.tag",
    sprintf("%s has class %s, not class 'shiny.tag'.", act$lab, act$class)
  )
  invisible(act$val)
}
expect_shinytaglist <- function(object) {
  act <- testthat::quasi_label(rlang::enquo(object), arg = "object")
  act$class <- class(object)[1]
  expect(
    act$class == "shiny.tag.list",
    sprintf("%s has class %s, not class 'shiny.tag.list'.", act$lab, act$class)
  )
  invisible(act$val)
}

expect_grep <- function(object, pattern) {
  act <- testthat::quasi_label(rlang::enquo(object), arg = "object")
  expect(
    grepl(pattern, object),
    sprintf("%s not greped in %s.", pattern, act$lab)
  )
  invisible(act$val)
}
