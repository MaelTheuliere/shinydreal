context("test-icons")

test_that("icons works", {
  for (ic in dr_icon_list){
    a <- dr_icon(ic)
    expect_shinytag(a)
    expect_grep(a, ic)
    for (x in 1:3){
      a <- dr_icon(ic, size = x)
      expect_grep(a, sprintf('font-size:%srem', x))
    }
  }
})
