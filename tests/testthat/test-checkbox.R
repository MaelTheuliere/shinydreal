context("test-checkbox")

test_that("checkbox works", {
  for (type in c("primary", "secondary")){
    a <- dr_checkboxGroupInput("a", "Un bouton", type = type, choices = letters)
    expect_shinytaglist(a)
    expect_grep(a, 'id="a"')
    expect_grep(a, "custom-control-parent-checkbox")
    expect_grep(a, "custom-control-indicator")
    expect_grep(a, "custom-control-description")
    expect_grep(a, 'Un bouton')
    for (x in letters){
      expect_grep(a, sprintf('<span class="custom-control-description">%s</span>', x))
    }
  }
})
