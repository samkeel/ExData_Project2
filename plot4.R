library(plyr)
library(ggplot2)
setwd("~/R/exData/Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coalSources <- SCC[grepl("Comb ", SCC$Short.Name) & grepl("Coal", SCC$Short.Name), ]
coalData = merge(NEI,coalSources,by.x = "SCC", by.y = "SCC")
coalEmissions <- ddply(NEI, .(as.character(year)), summarize, total=sum(Emissions))
colnames <- c("year","tons")
colnames(coalEmissions) <- colnames
ggplot(data=coalEmissions, aes(x=year, y = tons, fill=year)) + geom_bar(color="black", stat = "identity") + ggtitle("United States coal combustion-related emisssion sources") + theme(plot.title=element_text(lineheight =.8, face="bold")) + ylab("Tons of emissions") 
ggsave("plot4.png",width=7,height=4)