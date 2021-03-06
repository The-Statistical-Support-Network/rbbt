
test_that("regex for citations works", {
  expect_identical(
    bbt_detect_citations_chr("\n@citation1. \n@citation1991AlphaBetaGamma [@citation2] [@citation2020author]. but not \\@citation3 and not not \\@citation2019NotValid"),
    c("citation1","citation1991AlphaBetaGamma", "citation2", "citation2020author")
  )
})

test_that("detect_citations can operate on a character vector or file", {
  expect_identical(
    bbt_detect_citations("\n@citation1 \n@citation1991AlphaBetaGamma [@citation2] [@citation2020author] but not \\@citation3 and not not \\@citation2019NotValid"),
    c("citation1","citation1991AlphaBetaGamma", "citation2", "citation2020author")
  )

  file <- tempfile()
  write("\n@citation1 \n@citation1991AlphaBetaGamma [@citation2] [@citation2020author] but not \\@citation3 and not not \\@citation2019NotValid", file)
  expect_identical(
    bbt_detect_citations(file),
    c("citation1","citation1991AlphaBetaGamma", "citation2", "citation2020author")
  )
  unlink(file)
})
