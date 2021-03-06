test_that("Light mode / default `tune_color`s work", {
  old <- options(tidymodels.dark = NULL)
  on.exit(options(old))

  expect_equal(
    tune:::tune_color$symbol$go("hi"),
    crayon::black("hi")
  )

  expect_equal(
    tune:::tune_color$message$info("hi"),
    crayon::black("hi")
  )
})

test_that("Dark mode `tune_color`s work", {
  old <- options(tidymodels.dark = TRUE)
  on.exit(options(old))

  expect_equal(
    tune:::tune_color$symbol$go("hi"),
    crayon::white("hi")
  )

  expect_equal(
    tune:::tune_color$message$info("hi"),
    crayon::white("hi")
  )
})

test_that("`tune_color` falls back to light mode with back `tidymodels.dark` option", {
  old <- options(tidymodels.dark = "oh no")
  on.exit(options(old))

  expect_equal(
    tune:::tune_color$symbol$go("hi"),
    crayon::black("hi")
  )

  expect_equal(
    tune:::tune_color$message$info("hi"),
    crayon::black("hi")
  )
})
