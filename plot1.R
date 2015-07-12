# plot1.R - Histogram for data subset 2/2007

# First confirm we have our source file plotting_file.R that included downloadin the project zip and subsetting the data fro 2/1/2007 & 2/2/2007.
# if the file doesn't exisit we set our working directory: /ExData_Plotting1/, i.e name of unzipped folder.

if (!"~/plotting_file.R" %in% list.files()) {
  setwd("~/ExData_Plotting1/")
} 

source("~/plotting_file.R")

# Create a histogram image for the GAP frequency over 2/1 and 2/2 of 2007
GAP <- as.numeric(subfeb.data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()