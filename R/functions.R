# Helper functions for the Belgian births data story.
# Data: Human Mortality Database (HMD) input file for Belgium (births).

suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
})

#' Read the raw HMD births input file
#'
#' @param path Path to bel_birth.csv
#' @return A tibble with one row per area, sex and year.
load_births <- function(path) {
  read_csv(
    path,
    col_types = cols(
      PopName   = col_character(),
      Area      = col_integer(),
      Sex       = col_character(),
      Year      = col_integer(),
      YearReg   = col_integer(),
      RefCode   = col_integer(),
      Access    = col_character(),
      Births    = col_integer(),
      NoteCode1 = col_character(),
      NoteCode2 = col_character(),
      NoteCode3 = col_character(),
      LDB       = col_integer()
    ),
    na = c("", "NA", ".")
  )
}

#' Keep only the rows HMD uses in its final series (LDB == 1)
#'
#' This gives exactly one row per year and sex.
clean_births <- function(raw) {
  out <- raw %>%
    filter(LDB == 1) %>%
    arrange(Year, Sex)

  dupes <- out %>% count(Year, Sex) %>% filter(n > 1)
  if (nrow(dupes) > 0) {
    stop("More than one LDB == 1 row for some year/sex combinations.")
  }
  out
}

#' National totals per year: births by sex, total, sex ratio and yearly change
national_totals <- function(clean) {
  clean %>%
    group_by(Year) %>%
    summarise(
      female = sum(Births[Sex == "f"]),
      male   = sum(Births[Sex == "m"]),
      .groups = "drop"
    ) %>%
    mutate(
      births     = female + male,
      sex_ratio  = male / female * 100,
      pct_change = (births / lag(births) - 1) * 100,
      period     = assign_period(Year)
    )
}

#' Group years into the historical periods used in the story
assign_period <- function(year) {
  cut(
    year,
    breaks = c(-Inf, 1913, 1918, 1939, 1945, 1989, Inf),
    labels = c("1840-1913", "WWI 1914-18", "1919-39",
               "WWII 1940-45", "1946-89", "1990-2024")
  )
}

#' Format a number with thousands separators
fmt <- function(x, digits = 0) {
  formatC(x, format = "f", digits = digits, big.mark = ",")
}
