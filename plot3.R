library(plyr)
library(ggplot2)
setwd("~/R/exData/Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset NEI to only show data from Baltimore City, Maryland
marylandTotal <- subset(NEI, fips == "24510")
#use ddply to summarize by two variables (type and year)
mlPM25yearly <- ddply(marylandTotal, .(type,year), summarize, Emissions = sum(Emissions))
#Create chart
qplot(year, Emissions,data=mlPM25yearly,group=type,color=type,
      geom=c("point","line"),ylab="Total Emissions of PM2.5",
      xlab="Year", 
      main="Total Emissions in Baltimore City, Maryland, by Pollutant type")
ggsave("plot3.png",width=7,height=4)