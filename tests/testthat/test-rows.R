context("test-rows")

test_that("dr_panel works", {
    a <-dr_panel("a", "plop")
    expect_shinytag(a)
    expect_grep(a, 'id="a"')
    expect_grep(a, 'class="panel"')
    expect_grep(a, 'plop')
})

test_that("rows works", {
    a <-dr_row("a", "plop")
    expect_shinytag(a)
    expect_grep(a, 'class="row"')
    expect_grep(a, 'plop')
})

test_that("col works", {
  for (i in 1:12){
    a <-dr_col(i, "plop")
    expect_shinytag(a)
    expect_grep(a, sprintf('class="col-lg-%s"', i))
    expect_grep(a, 'plop')
  }
  a <-dr_col_12("plop")
  expect_shinytag(a)
  expect_grep(a, sprintf('class="col-lg-%s"', 12))
  expect_grep(a, 'plop')
  a <-dr_col_6("plop")
  expect_shinytag(a)
  expect_grep(a, sprintf('class="col-lg-%s"', 6))
  expect_grep(a, 'plop')
  a <-dr_col_4("plop")
  expect_shinytag(a)
  expect_grep(a, sprintf('class="col-lg-%s"', 4))
  expect_grep(a, 'plop')
  a <-dr_col_3("plop")
  expect_shinytag(a)
  expect_grep(a, sprintf('class="col-lg-%s"', 3))
  expect_grep(a, 'plop')
})

