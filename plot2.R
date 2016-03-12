library(plyr)
setwd("~/R/exData/Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset NEI to only show data from Baltimore City, Maryland
marylandTotal <- subset(NEI, fips == "24510")
#sum the total amounts and group by year
pm25marylandTotal <- with(marylandTotal, aggregate(Emissions, by = list(year), sum))
#plot output to PNG file.
png("plot2.png", width=480, height=480)
barplot(pm25marylandTotal$x, main=expression("Total emissions from PM2.5 in Baltimore City, Marylands"), xlab = "Years", ylab = "Amount of PM2.5 emitted", names.arg=pm25marylandTotal$Group.1)
dev.off()