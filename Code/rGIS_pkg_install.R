# List packages required to run the script -------------------------------------
pkgs <- c("tidyverse","ggmap","sf","cowplot","here","devtools",
          "knitr","ggrepel","rgeos","FedData","raster","mapview",
          "rnaturalearth","rnaturalearthdata","shadowtext")

# Install and load all CRAN packages provided from a character vector
load_pkgs = function(pkgs) {
  new_pkgs = pkgs[!(pkgs %in% installed.packages()[ ,'Package'])]
  if (length(new_pkgs) > 0) install.packages(new_pkgs,repos = "http://cran.cnr.berkeley.edu/")
  invisible(lapply(pkgs,function(x)
    suppressPackageStartupMessages(library(x,character.only = T))))
}
# Load packages
load_pkgs(pkgs)

# Load dev packages -------------------------------------------------------
# Install and load rnaturalearthdata package from github
if ("rnaturalearthdata" %in% installed.packages()[ ,'Package'] == F) {
  devtools::install_github("ropenscilabs/rnaturalearthdata")
}
library(rnaturalearthdata)

# Install and load rnaturalearthhires package from ropensci
if ("rnaturalearthhires" %in% installed.packages()[ ,'Package'] == F) {
  install.packages("rnaturalearthhires",
                   repos = "http://packages.ropensci.org",
                   type = "source")
}
library(rnaturalearthhires)