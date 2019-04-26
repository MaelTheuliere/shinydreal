context("test-slider")

test_that("dr_sliderInput works", {
  expect_error(dr_sliderInput("a",min = 1, max = 10, value = 100))
  expect_error(dr_sliderInput("a",min = 100, max = 1, value = 50))
  expect_error(dr_sliderInput("a",min = 100, max = 1000, value = 10))
  for (i in c(0, 25, 50, 75, 100)){
      a <-dr_sliderInput("a",min = i, max = i* 10, value = i * 1.5)
      expect_shinytag(a)
      expect_grep(a, 'id="a"')
      expect_grep(a, "slidecontainer")
      expect_grep(a, sprintf('value="7"', i * 1.5))
      expect_grep(a, sprintf('<span class="range min">%s</span>', i))
      expect_grep(a, sprintf('<span class="range max">%s</span>', i* 10))
    
  }
  
})

