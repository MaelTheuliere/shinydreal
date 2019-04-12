context("golem tests")

test_that("app ui", {
  ui <- app_ui()
  expect_is(ui, "shiny.tag.list")
})

test_that("app server", {
  server <- app_server
  expect_is(server, "function")
})

test_that("app launches", {
  
  pkg_base <- dirname(dirname(getwd()))
  p <- processx::process$new(
    command = "R", 
    c(
      "-e", 
      sprintf( "shiny::runApp('%s')", file.path(pkg_base , "inst/app"))
    )
  )
  # Leave a delay here for the app to launch
  Sys.sleep(3)
  expect_true(p$is_alive())
  p$kill()
})