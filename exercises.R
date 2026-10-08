# =============================================================================
# r-regex-text-cleaning
# Data Preparation practice set: Regular Expressions & String Cleaning in R
# -----------------------------------------------------------------------------
# Style: step-by-step exercises with hints (a), b), c), ...).
# Solutions are in solutions.R - try the exercises first!
#
# Required packages: stringr (part of tidyverse). Install once with:
#   install.packages("stringr")
# =============================================================================

library(stringr)

# -----------------------------------------------------------------------------
# Exercise 1.1 - Regex fundamentals on a single string
# -----------------------------------------------------------------------------
# a) Create a variable called text1 with the value
#    "Ref 2AB-2025 arrived at 0915"
# b) Create a pattern that finds ANY digit in text1 and use grepl() to verify
#    that there is at least one digit. Store the result in has_digit.
# c) Use gregexpr() to find ALL positions of digits in text1.
#    Store the result in string_position.
# d) Create a pattern that finds one digit IMMEDIATELY followed by one
#    uppercase letter (e.g. "2A"). Check whether text1 contains it.
# e) Use regexpr() to find the position of the FIRST space in text1.
#    Store the result in first_space.
# f) Create a pattern that finds a lowercase letter, followed by ANY character,
#    and then by a digit (e.g. "f 2").
# g) Find the STARTING position of the pattern from (f) in text1.
#    Store the result in string_pos2.
# h) Find the following pattern: one space, followed by two lowercase letters,
#    and then one more space (e.g. " at "). Store the starting position in
#    string_pos3.
# i) Using sub(), replace the pattern found in (h) by the string " in ".
#    Store the result in text2.
# j) Find in text2 the following pattern: four digits at the END of the string.
#    Store the starting position in string_pos4.
# k) According to string_pos4, extract the FIRST TWO digits that start at that
#    position. Store the result in first_two_digits (the hour prefix).

# -----------------------------------------------------------------------------
# Exercise 1.2 - Cleaning a vector of messy phone numbers
# -----------------------------------------------------------------------------
# You have a customer phone list entered manually. Formatting is inconsistent:
#   "+33 6 12 34 56 78", "0612345678", "(+33) 6 23 45 67 89", "06.23.45.67.89",
#   "0033 6 12 34 56 78", "06 23 45 67 8", and one missing value (NA).
# a) Create the vector phones with the values above.
# b) Remove every non-digit character from each element using str_remove_all()
#    with the pattern "[^0-9]". Store the result in digits_only.
# c) Normalise international prefixes to French national format:
#      - a leading "0033" should become "0"  (e.g. "0033612345678" -> "0612345678")
#      - a leading "33" on an 11-digit number should become "0"
#    Use sub() on digits_only. Store the result in phone_national.
# d) Check the French national number format with "^0[0-9]{9}$".
#    This checks formatting; it does not prove a number is assigned or mobile.
#    Use str_detect() to create a logical vector valid_flag.
# e) Build a data frame (tibble) with the original value, the national format
#    and the validity flag. How many entries are valid? How many are invalid?

# -----------------------------------------------------------------------------
# Exercise 1.3 - Extracting structured fields from order references
# -----------------------------------------------------------------------------
# Order references have the shape "INV-YYYY-NNNNN", e.g. "INV-2025-00123".
# a) Create the vector refs with:
#    "INV-2025-00123", "INV-2024-00876", "INV-2025-00001",
#    "INV-2023-09999", "INV-2026-12345"
# b) Use grepl() to find which references belong to year 2025.
# c) Use str_extract() with a 4-digit pattern to pull the YEAR out of every
#    reference. Store the result in ref_year (character).
# d) Use str_extract() with an anchored 5-digit pattern ("[0-9]{5}$") to pull
#    the trailing number out of every reference. Store it in ref_number.
# e) Convert ref_number to integer with as.integer() and compute the maximum.
# f) Use regexpr() to find the position where the YEAR starts in each string.
#    Store the result in year_start.
# g) Using the positions from (f) and substr(), extract the year from each
#    reference and verify it matches ref_year from (c).
