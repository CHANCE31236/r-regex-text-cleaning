# r-regex-text-cleaning

Regular expressions & string cleaning practice set in **R**, written in the style of a university *Data Preparation* lab session (step-by-step exercises a), b), c) ... with hints, plus a commented solution file).

Built for a GitHub portfolio to demonstrate **hands-on data-wrangling skills** for data analyst / business analytics interviews.

## What this project shows

- Matching strings with `grepl()`, `regexpr()`, `gregexpr()` and anchored patterns
- Finding the **position** of a match inside a string and extracting with `substr()`
- Cleaning real-world messy text: phone numbers, order references
- Vectorised string handling with `stringr::str_remove_all()`, `str_extract()`, `str_detect()`
- Validation logic (is this phone number valid?) and building tidy output tables

## Files

| File          | Purpose                                                    |
|---------------|------------------------------------------------------------|
| `exercises.R` | The exercises with hints - try them before peeking         |
| `solutions.R` | Fully commented solutions with expected outputs printed    |

## How to run

```r
install.packages("stringr")   # once
source("solutions.R")         # run the whole solution file
```

Requires **R >= 4.0**. Only `stringr` (tidyverse) is needed.

## Exercises at a glance

1. **Exercise 1.1 - Regex fundamentals**: a single business string, 11 small steps covering `grepl`, `gregexpr`, `regexpr`, `sub`, position extraction and anchored patterns.
2. **Exercise 1.2 - Phone number cleaning**: remove non-digits, normalise `0033`/`+33` prefixes to French national format, validate with `^0[0-9]{9}$`, summarise valid/invalid counts.
3. **Exercise 1.3 - Order reference parsing**: extract the year and trailing sequence from `INV-YYYY-NNNNN`, using both `str_extract()` and position-based `substr()` extraction.

## Learning outcomes (interview talking points)

- Write and explain regex patterns: character classes, quantifiers, anchors, `.` as any character
- Know the difference between `regexpr` (first match) and `gregexpr` (all matches)
- Clean and validate free-text fields without losing missing values
