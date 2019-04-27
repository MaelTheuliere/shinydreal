context("test-progress")

test_that("progress works", {
  expect_error(dr_progress("a",type = "j"))
  expect_error(dr_progress("a",value = 1000))
  expect_error(dr_progress("a",value = -123445))
  for (i in c(0, 25, 50, 75, 100)){
    for (j in c("primary", "secondary")){
      a <-dr_progress("a",type = j, value = i)
      expect_shinytag(a)
      expect_grep(a, "progressBar")
      expect_grep(a, j)
      expect_grep(a, sprintf("width: %s", i))
      expect_grep(a, 'aria-valuemin="0"')
      expect_grep(a, 'aria-valuemax="100"')
    }

  }

})

