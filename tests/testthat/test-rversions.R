context("rversions")

RE_DASH <- "^[0-9]+-[0-9]+(-[0-9]+)?$"
RE_DOT <- "^[0-9]+\\.[0-9]+(\\.[0-9]+)?$"

test_that("versions", {
  d <- r_versions()
  expect_is(d, "data.frame")
  expect_equal(names(d), c("version", "date"))
  expect_is(d$version, "character")
  expect_is(d$date, "character")
})

test_that("dots", {
  expect_match(tail(r_versions(FALSE)$version, 1), RE_DASH)
  expect_match(tail(r_versions(TRUE)$version, 1), RE_DOT)
  expect_equal(gsub("-", ".", r_versions(FALSE)$version),
               r_versions(TRUE)$version)
})

test_that("r_release respects dots", {
  expect_match(r_release(TRUE), RE_DOT)
  expect_match(r_release(FALSE), RE_DASH)
})

test_that("r_oldrel respects dots", {
  expect_match(r_oldrel(TRUE), RE_DOT)
  expect_match(r_oldrel(FALSE), RE_DASH)
})