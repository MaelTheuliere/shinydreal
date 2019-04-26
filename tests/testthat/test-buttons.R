context("test-buttons")

test_that("buttons works", {
  for (type in c("primary", "secondary", "info")){
    a <- dr_sm_actionButton("a", "Un bouton", type = type)
    expect_shinytag(a)
    expect_grep(a, 'id="a"')
    expect_grep(a, sprintf('class="btn btn-default action-button btn-%s btn-sm"', type))
    expect_grep(a, 'Un bouton')
  }
})
