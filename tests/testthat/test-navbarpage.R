context("test-navbar")

test_that("navbar works", {
  a <- dr_navbarPage(menu = list(), body = list())
  expect_shinytaglist(a)
  expect_grep(a, "navbar-container")
  expect_grep(a, "navbar-toggleable-md")
  expect_grep(a, "container-fluid")
})

test_that("dr_navItem(s) works", {
  a <- dr_navItems()
  expect_shinytag(a)
  expect_grep(a, "navbar-nav mr-auto")
  a <- dr_navItem("a", "a")
  expect_shinytag(a)
  expect_grep(a, "a")
  expect_grep(a, "nav-item")
  expect_grep(a, "onclick")
  expect_grep(a, "javascript:void")
  
})
