#!/usr/bin/env Rscript
library(slidify)
slidify("index.Rmd", "index.html")
#library(markdown)
#argv = commandArgs(trailingOnly = TRUE)
#call_logs_file = argv[1]
#output = sub("tsv", "md",
#             sub("call_logs", "report", call_logs_file))
#knit("report.Rmd", output=output)
#markdownToHTML(output,  sub("md", "html", output))
#cat(paste("HTML Output: ", sub("md", "html", output), "\n"))
