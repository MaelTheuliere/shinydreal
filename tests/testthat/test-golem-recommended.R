context("golem tests")

test_that("app launches", {
  
  pkg_base <- dirname(dirname(getwd()))
  p <- processx::process$new(
    command = "R", 
    c(
      "-e", 
      sprintf( "shiny::runApp('%s')", file.path(pkg_base , "app.R"))
    )
  )
  # Leave a delay here for the app to launch
  Sys.sleep(3)
  expect_true(p$is_alive())
  p$kill()
})