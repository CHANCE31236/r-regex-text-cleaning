# =============================================================================
# r-regex-text-cleaning - SOLUTIONS
# -----------------------------------------------------------------------------
# Every step prints the expected result in a comment. Run the whole file:
#   source("solutions.R")
# =============================================================================

library(stringr)

# -----------------------------------------------------------------------------
# Exercise 1.1 - Regex fundamentals on a single string
# -----------------------------------------------------------------------------

# a) Create the string
text1 <- "Ref 2AB-2025 arrived at 0915"

# b) Pattern for any digit + grepl() check
my_pattern <- "[0-9]"
has_digit  <- grepl(my_pattern, text1)
has_digit                    # [1] TRUE

# c) Positions of ALL digits
string_position <- gregexpr("[0-9]", text1)
unlist(string_position)      # [1]  5  9 10 11 12 25 26 27 28
# Explanation: 2(5) A(6) B(7) -(8) 2(9) 0(10) 2(11) 5(12) ... 0(25) 9(26) 1(27) 5(28)

# d) One digit immediately followed by one uppercase letter
my_pattern <- "[0-9][A-Z]"
grepl(my_pattern, text1)     # [1] TRUE   (the "2A" in "2AB")
regexpr(my_pattern, text1)   # match starts at position 5

# e) Position of the FIRST space
first_space <- regexpr(" ", text1)
first_space                  # [1] 4

# f) Lowercase letter + any character + digit
my_pattern <- "[a-z].[0-9]"
grepl(my_pattern, text1)     # [1] TRUE   ("f 2": f(3) space(4) 2(5))

# g) Starting position of the pattern from (f)
string_pos2 <- regexpr("[a-z].[0-9]", text1)
string_pos2                  # [1] 3

# h) Space + two lowercase letters + space
string_pos3 <- regexpr(" [a-z][a-z] ", text1)
string_pos3                  # [1] 21   (the " at " in "...arrived at 0915")

# i) Replace the pattern from (h) with " in "
text2 <- sub(" [a-z][a-z] ", " in ", text1)
text2                        # [1] "Ref 2AB-2025 arrived in 0915"

# j) Four digits at the END of the string
string_pos4 <- regexpr("[0-9]{4}$", text2)
string_pos4                  # [1] 25   (the "0915")

# k) Extract the first two digits starting at string_pos4
year_prefix <- substr(text2, string_pos4, string_pos4 + 1)
year_prefix                  # [1] "09"

# -----------------------------------------------------------------------------
# Exercise 1.2 - Cleaning a vector of messy phone numbers
# -----------------------------------------------------------------------------

# a) The raw input
phones <- c("+33 6 12 34 56 78", "0612345678", "(+33) 6 23 45 67 89",
            "06.23.45.67.89", "0033 6 12 34 56 78", "06 23 45 67 8", NA)

# b) Keep only digits (str_remove_all keeps NA as NA)
digits_only <- str_remove_all(phones, "[^0-9]")
digits_only                  # [1] "33612345678" "0612345678"  "33623456789" "0623456789"
                             # [5] "0033612345678" "062345678"  NA

# c) Normalise to French national format
#    "0033..." -> "0" ; "33..." on an 11-digit string -> "0"
phone_national <- sub("^0033", "0", digits_only)
phone_national <- ifelse(nchar(phone_national) == 11 & grepl("^33", phone_national),
                         sub("^33", "0", phone_national),
                         phone_national)
phone_national               # [1] "0612345678" "0612345678" "0623456789" "0623456789"
                             # [5] "0612345678" "062345678"  NA

# d) Validate: 0 followed by exactly 9 digits
valid_flag <- str_detect(phone_national, "^0[0-9]{9}$")
valid_flag                   # [1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE    NA

# e) Build the summary table
phone_table <- data.frame(
  original      = phones,
  national      = phone_national,
  is_valid      = valid_flag
)
phone_table
sum(valid_flag, na.rm = TRUE)      # [1] 5 valid entries
sum(!valid_flag, na.rm = TRUE)     # [1] 1 invalid entry ("062345678" only has 9 digits)
sum(is.na(valid_flag))             # [1] 1 missing value kept as NA

# -----------------------------------------------------------------------------
# Exercise 1.3 - Extracting structured fields from order references
# -----------------------------------------------------------------------------

# a) The raw input
refs <- c("INV-2025-00123", "INV-2024-00876", "INV-2025-00001",
          "INV-2023-09999", "INV-2026-12345")

# b) Which references belong to year 2025?
grepl("-2025-", refs)        # [1]  TRUE FALSE  TRUE FALSE FALSE

# c) Extract the year
ref_year <- str_extract(refs, "[0-9]{4}")
ref_year                     # [1] "2025" "2024" "2025" "2023" "2026"

# d) Extract the trailing 5-digit number
ref_number <- str_extract(refs, "[0-9]{5}$")
ref_number                   # [1] "00123" "00876" "00001" "09999" "12345"

# e) Maximum trailing number
max(as.integer(ref_number))  # [1] 12345

# f) Position where the year starts ("INV-" occupies positions 1-4)
year_start <- regexpr("[0-9]{4}", refs)
year_start                   # [1] 5 5 5 5 5

# g) Extract the year using positions and substr(), then compare
extracted <- substr(refs, year_start, year_start + 3)
extracted                    # [1] "2025" "2024" "2025" "2023" "2026"
all(extracted == ref_year)   # [1] TRUE
