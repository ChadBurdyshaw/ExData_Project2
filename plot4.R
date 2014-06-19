#exploratory data analysis Project 2 plot 4


#Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#merge data to obtain classification codes
NEISCC=merge(NEI,SCC,by="SCC")
rm(NEI)#release memory for NEI
rm(SCC)#release memory for SCC
year=c(1999,2002,2005,2008)

#4) Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999-2008?
library(ggplot2)
USCoal=NEISCC[grep("Coal",NEISCC$EI.Sector),]

#create png graphics device
png(filename="plot4.png",width=480,height=480,units="px")

g=ggplot(USCoal,aes(x=year,y=Emissions))
g=g+stat_summary(fun.y="sum",geom="line")
g=g+ylab("PM_2.5 Emissions (tons)")
g=g+ggtitle("Total US Coal Combustion Emissions")
print(g)

#close graphics device
dev.off()
