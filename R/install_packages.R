# Install the packages this project needs (run once).
pkgs <- c("dplyr", "tidyr", "readr", "ggplot2", "scales", "rmarkdown", "knitr")
missing <- setdiff(pkgs, rownames(installed.packages()))
if (length(missing) > 0) install.packages(missing)
