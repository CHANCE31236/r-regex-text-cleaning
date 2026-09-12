# r-regex-text-cleaning

A practice set for regular expressions and string handling in R, laid out as a
lab session: exercises `a)`, `b)`, `c)` with hints, then a fully commented
solution file.

## Files

| File | Purpose |
|------|---------|
| `exercises.R` | The exercises with hints |
| `solutions.R` | Commented solutions, each step printing its expected output |

## Running it

```r
install.packages("stringr")   # once
source("solutions.R")
```

R 4.0 or newer. Only `stringr` is needed.

## Contents

1. **Exercise 1.1 — Regex fundamentals.** One business string, eleven small
   steps: `grepl()`, `gregexpr()`, `regexpr()`, `sub()`, extracting a match by
   position with `substr()`, and anchored patterns.
2. **Exercise 1.2 — Phone number cleaning.** Strip non-digits, normalise the
   `0033` / `+33` prefixes to French national format, validate against
   `^0[0-9]{9}$`, then count valid, invalid and missing entries.
3. **Exercise 1.3 — Order reference parsing.** Pull the year and the trailing
   sequence out of `INV-YYYY-NNNNN`, using both `str_extract()` and
   position-based `substr()` extraction, and check that the two agree.

## Notes on the patterns used

- `regexpr()` returns the first match, `gregexpr()` returns all of them.
- Anchors matter: `[0-9]{4}$` only matches at the end of the string.
- `.` matches any character, so `[a-z].[0-9]` deliberately spans a space.
- Missing values survive the cleaning steps as `NA` rather than becoming empty
  strings, so the valid / invalid / missing counts stay separable.

## License

MIT — see [LICENSE](LICENSE).
