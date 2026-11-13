# Render the data story to HTML.
# Run from the project root:  source("render.R")
# Output: docs/index.html (ready for GitHub Pages)

rmarkdown::render(
  input         = "analysis/belgium_births_story.Rmd",
  output_file   = "index.html",
  output_dir    = "docs",
  knit_root_dir = getwd(),
  envir         = new.env()
)
