library(plyr)
setwd("~/R/exData/Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#sum the total amounts and group by year
pm25Total <- with(NEI, aggregate(Emissions, by = list(year), sum))
#plot output to PNG file.
png("plot1.png", width=480, height=480)
barplot(pm25Total$x, main=expression("Total emissions from PM2.5 in the United States"), xlab = "Years", ylab = "Amount of PM2.5 emitted", names.arg=pm25Total$Group.1)
dev.off()