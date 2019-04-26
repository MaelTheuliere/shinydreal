context("test-fleches")

test_that("fleches works", {
    a <- dr_arrow_nav("gauche", "droite")
    expect_shinytag(a)
    expect_grep(a, "circle-nav")
    expect_grep(a, "nav-item")
    expect_grep(a, "fleche icon la la-angle-left")
    expect_grep(a, "fleche icon la la-angle-right")

})

test_that("fleches works", {
  a <- dr_square_nav("gauche", "droite")
  expect_shinytag(a)
  expect_grep(a, "gauche")
  expect_grep(a, "navigationbutton btn btn-secondary btn-icon btn-icon-left")
  expect_grep(a, "droite")
  expect_grep(a, "this.parentNode")
  
})
