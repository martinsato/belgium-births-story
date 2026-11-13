# Belgium's Births, 1840–2024: A Data Story

An R Markdown data story about 185 years of live births in Belgium, using data
from the [Human Mortality Database](https://www.mortality.org) (HMD).

**Main finding:** in 2024, Belgium recorded 109,154 live births. Only five years
since 1840 had fewer, and all of them were during a world war.

The report follows five chapters:

1. **Growth:** births rise to an all-time peak of 201,608 in 1901.
2. **War:** World War I halves births, and World War II cuts them by a quarter. Both times they bounce back.
3. **Boom and bust:** births peak in 1964, then fall 29% by 1985.
4. **A new low:** births fall in 14 of the 16 years after 2008.
5. **Sex ratio:** about 105 boys are born per 100 girls, with a rise during World War II.

## View the report

- Open `docs/index.html` in a browser, or
- Turn on GitHub Pages (Settings → Pages → branch `main`, folder `/docs`) to
  publish it as a website.

## Project structure

```
belgium-births-story/
├── analysis/
│   ├── belgium_births_story.Rmd   # the data story (R Markdown)
│   └── references.bib             # bibliography (HMD, R, ggplot2)
├── data/
│   ├── raw/bel_birth.csv          # HMD births input file for Belgium
│   └── README.md                  # data dictionary, source and licence
├── docs/
│   └── index.html                 # rendered report
├── R/
│   ├── functions.R                # loading, cleaning and summary functions
│   └── install_packages.R         # installs required packages
├── render.R                       # renders the Rmd to docs/index.html
├── belgium-births-story.Rproj     # RStudio project file
├── CITATION.cff
├── LICENSE
└── README.md
```

## How to reproduce

You need R (4.1 or later) and [pandoc](https://pandoc.org). Pandoc comes with RStudio.

```r
# 1. Open belgium-births-story.Rproj in RStudio (or set the working directory
#    to the project folder)

# 2. Install the packages (once)
source("R/install_packages.R")

# 3. Render the report to docs/index.html
source("render.R")
```

You can also open `analysis/belgium_births_story.Rmd` and press **Knit**. The
file finds the data whether you knit from the project root or from `analysis/`.

## Data

The data come from the Human Mortality Database. See
[`data/README.md`](data/README.md) for the column descriptions and how the file
is cleaned. In short: only rows with `LDB == 1` are used, which gives one row
per year and sex for 1840–2024.

## Citation

**Data:**

> HMD. Human Mortality Database. Max Planck Institute for Demographic Research
> (Germany), University of California, Berkeley (USA), and French Institute for
> Demographic Studies (France). Available at www.mortality.org (data downloaded
> in 2026).

**Methods:**

> Wilmoth, J. R., Andreev, K., Jdanov, D., Glei, D. A., Riffe, T., Boe, C.,
> Bubenheim, M., Philipov, D., Shkolnikov, V., Vachon, P., Winant, C., &
> Barbieri, M. (2021). *Methods Protocol for the Human Mortality Database (v6).*

## Licence

The code is released under the [MIT Licence](LICENSE). The data are not covered
by this licence. HMD-constructed data are published under CC BY 4.0, while
input data like `bel_birth.csv` remain under the original provider's licence.
See the [HMD User Agreement](https://www.mortality.org/Data/UserAgreement).

## Author

Beverley Ogenche
