# Run from the repository root: Rscript --vanilla tests/smoke.R
options(warn = 2)
source("solutions.R")
stopifnot(isTRUE(has_digit),
          identical(as.integer(string_position[[1]]), c(5L, 9L, 10L, 11L, 12L, 25L, 26L, 27L, 28L)),
          as.integer(first_space) == 4L, as.integer(string_pos2) == 3L,
          as.integer(string_pos3) == 21L, as.integer(string_pos4) == 25L,
          identical(first_two_digits, "09"),
          identical(text2, "Ref 2AB-2025 arrived in 0915"),
          sum(valid_flag, na.rm = TRUE) == 5L,
          sum(!valid_flag, na.rm = TRUE) == 1L, sum(is.na(valid_flag)) == 1L,
          identical(phone_national[1:5], c("0612345678", "0612345678", "0623456789", "0623456789", "0612345678")),
          identical(ref_year, extracted), max(as.integer(ref_number)) == 12345L)
cat("Regex practice checks passed.\n")
