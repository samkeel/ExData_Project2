library(plyr)
library(ggplot2)
setwd("~/R/exData/Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
locations <- subset(NEI, fips == "24510" | fips == "06037")
vehicles <- subset(SCC$SCC, grepl("Mobile", SCC$EI.Sector))
v1 <- subset(locations, locations$SCC %in% vehicles)
#replace data in FIPS to become the facet label text
v1$fips[v1$fips=="06037"] <- "Los Angeles County"
v1$fips[v1$fips=="24510"] <- "Baltimore City"
ggplot(data=v1, aes(x=year, y=Emissions, fill=year)) + 
    geom_bar(stat="identity") + 
    facet_grid(.~fips) + 
    ggtitle("Changes in motor vehicle emissions over time") + 
    theme(plot.title=element_text(lineheight =.8, face="bold")) +
    ylab("Emissions in tons")
ggsave("plot6.png", width=6,height=3)