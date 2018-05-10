context("idf_collections")

test_that("idf_collections - works", {
  vcr::use_cassette("idf_collections", {
    aa <- idf_collections()

    expect_is(aa, "data.frame")
    expect_is(aa, "tbl_df")
    expect_match(aa$url, 'identifiers.org')
    expect_is(aa$name, 'character')
    expect_is(aa$synonyms, 'list')
  })
})

test_that("fails well", {
  skip_on_cran()

  expect_error(idf_collections(5), "ids must be of class character")
  expect_error(idf_collections(names = 5), "names must be of class character")
  expect_error(idf_collections(providers = 5), "providers must be of class character")
  expect_error(idf_collections("foo", "bar"), "can only pass in one of")
  expect_error(idf_collections("foo", "bar", "adf"), "can only pass in one of")
  expect_error(idf_collections("foo", providers = "adf"), "can only pass in one of")
  expect_error(idf_collections(names = "foo", providers = "adf"), "can only pass in one of")
})
