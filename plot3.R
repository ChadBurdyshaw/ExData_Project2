#exploratory data analysis Project 2 plot 3


#Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#merge data to obtain classification codes
NEISCC=merge(NEI,SCC,by="SCC")
rm(NEI)#release memory for NEI
rm(SCC)#release memory for SCC
year=c(1999,2002,2005,2008)


#3) Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#variable, which of these four sources have seen decreases in emissions from 
#1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)

BaltMD=subset(NEISCC,NEISCC$fips=="24510")

#create png graphics device
png(filename="plot3.png",width=480,height=480,units="px")

g1=ggplot(BaltMD,aes(x=year,y=Emissions,color=type))
g1=g1+stat_summary(fun.y="sum",geom="line")
g1=g1+ylab("PM_2.5 Emissions (tons)")
g1=g1+ggtitle("Total PM_2.5 Emissions of four source types in Baltimore City MD")
print(g1)

#close graphics device
dev.off()
