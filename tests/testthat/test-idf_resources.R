context("idf_resources")

test_that("idf_resources - works", {
  vcr::use_cassette("idf_resources", {
    aa <- idf_resources()

    expect_is(aa, "data.frame")
    expect_is(aa, "tbl_df")
    expect_is(aa$urlPrefix, 'character')
    expect_is(aa$institution, 'character')
    expect_is(aa$official, 'integer')
    expect_is(aa$obsolete, 'integer')
  })
})

test_that("fails well", {
  skip_on_cran()

  expect_error(idf_resources(5), "ids must be of class character")
})
