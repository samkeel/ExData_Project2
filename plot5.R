library(plyr)
library(ggplot2)
setwd("~/R/exData/Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
vehicles <- SCC[SCC$Data.Category=="Onroad",]
baltimore <- NEI[NEI$fips=="24510",]
vehicleData = merge(baltimore,vehicles,by.x="SCC",by.y="SCC")
vehicleEmissions <- ddply(vehicleData, .(as.character(year)), summarize, total=sum(Emissions))
colnames <- c("year","tons")
colnames(vehicleEmissions) <- colnames

ggplot(data=vehicleEmissions, aes(x=year, y=tons, fill=year)) + 
    geom_bar(color="black", stat="identity") + 
    ggtitle("Motor vehicle emissions in Baltimore City") + 
    theme(plot.title=element_text(lineheight =.8, face="bold")) + 
    ylab("Emissions in tons")
ggsave("plot5.png",width=6,height=4)