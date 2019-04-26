context("test-table")

test_that("table works", {
  for (i in c("striped", "bordered")){
    a <-dr_tableOutput("a", i)
    expect_shinytag(a)
    expect_grep(a, 'id="a"')
    expect_grep(a, sprintf('class="shiny-html-output table-%s"', i))
  }

})