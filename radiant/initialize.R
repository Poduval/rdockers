# install.packages(
#   "radiant", 
#   repos = "https://radiant-rstats.github.io/minicran/", 
#   type = "binary")

library(radiant)

options(radiant.maxRequestSize = -1)  ## no file size limit
options(radiant.report = TRUE)