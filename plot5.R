#exploratory data analysis Project 2 plot 5


#Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#merge data to obtain classification codes
NEISCC=merge(NEI,SCC,by="SCC")
rm(NEI)#release memory for NEI
rm(SCC)#release memory for SCC
year=c(1999,2002,2005,2008)
library(ggplot2)

#5) How have emissions from motor vehicle sources changed from 1999-2008 in 
#Baltimore City?
BaltMD=subset(NEISCC,NEISCC$fips=="24510")
BM_MV=BaltMD[grep("Vehicle",BaltMD$EI.Sector),]

#create png graphics device
png(filename="plot5.png",width=480,height=480,units="px")

g=ggplot(BM_MV,aes(x=year,y=Emissions))
g=g+stat_summary(fun.y="sum",geom="point")
g=g+stat_summary(fun.y="sum",geom="line")
g=g+ylab("PM_2.5 Emissions (tons)")
g=g+ggtitle("Baltimore City MD Motor Vehicle Emissions")
print(g)

#close graphics device
dev.off()