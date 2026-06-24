#!/usr/bin/env Rscript

library(optparse)

option_list <- list(
make_option(c("-i", "--input"), type="character", help="Input file"),
make_option(c("-o", "--output"), type="character", help="Output PDF"),
make_option(c("-v", "--verbose"), action="store_true", default=FALSE)
)

opt <- parse_args(OptionParser(option_list=option_list))

if(opt$verbose){
  cat("R version:", R.version.string, "\n")
}

data <- read.table(opt$input, header=FALSE)

q <- quantile(data$V1)

print(q)

pdf(opt$output)
hist(data$V1,
     main="Histogram",
     xlab="Values")

dev.off()


