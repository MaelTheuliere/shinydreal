context("test-on-off")

test_that("onoff works", {
  a <- dr_onOff("square")
  expect_shinytag(a)
  expect_grep(a, "switch-toggle switch-toggle-lg")
  expect_grep(a, "switch-toggle-lg")
  expect_grep(a, "checkbox")
  expect_grep(a, "square")
  
})

test_that("onoff works", {
  a <- dr_sq_onOff("square")
  expect_shinytag(a)
  expect_grep(a, "checkbox-toggle checkbox-toggle-lg")
  expect_grep(a, "checkbox-toggle-lg")
  expect_grep(a, "checkbox")
  expect_grep(a, "square")
})