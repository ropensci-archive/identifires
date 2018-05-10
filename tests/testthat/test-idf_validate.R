context("idf_validate")

test_that("idf_validate - works", {
  vcr::use_cassette("idf_validate", {
    aa <- idf_validate(ids = "MIR:00100675")

    expect_is(aa, "data.frame")
    expect_is(aa, "tbl_df")
    expect_match(aa$url, 'identifiers.org')
    expect_named(aa, c('prefix', 'identifier', 'url'))
  })
})

test_that("fails well", {
  skip_on_cran()

  expect_error(idf_validate(), "\"ids\" is missing")
  expect_error(idf_validate(5), "ids must be of class character")
})
