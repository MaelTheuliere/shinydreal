file.create("LICENCE")
write("COPYRIGHT DREAL - 2019", "LICENCE")

usethis::use_test()

usethis::use_vignette("a_getting_started")
usethis::use_vignette("b_inputs")
# Le pkgdown
visualidentity::build_pkgdown(
  yml = system.file("pkgdown/_pkgdown.yml", package = "thinkridentity"),
  favicon = system.file("pkgdown/favicon.ico", package = "thinkridentity"),
  move = TRUE, clean_before = TRUE, clean_after = TRUE
)
