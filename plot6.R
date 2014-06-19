#exploratory data analysis Project 2 plot 6


#Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#merge data to obtain classification codes
NEISCC=merge(NEI,SCC,by="SCC")
rm(NEI)#release memory for NEI
rm(SCC)#release memory for SCC
year=c(1999,2002,2005,2008)
library(ggplot2)

BaltMD=subset(NEISCC,NEISCC$fips=="24510")
BM_MV=BaltMD[grep("Vehicle",BaltMD$EI.Sector),]

g1=ggplot(BM_MV,aes(x=year,y=Emissions))
g1=g1+stat_summary(fun.y="sum",geom="point")
g1=g1+stat_summary(fun.y="sum",geom="line")
g1=g1+ylab("PM_2.5 Emissions (tons)")
g1=g1+ggtitle("Baltimore City MD Motor Vehicle Emissions")
#print(g1)

#6) Compare emissions from motor vehicle sources in Baltimore City with 
#emissions from motor vehicle sources in Los Angeles County, California 
#(fips == "06037"). Which city has seen greater changes over time in motor 
#vehicle emissions?
LACA=subset(NEISCC,NEISCC$fips=="06037")
LA_MV=LACA[grep("Vehicle",LACA$EI.Sector),]

#create png graphics device
png(filename="plot6.png",width=960,height=480,units="px")

g2=ggplot(LA_MV,aes(x=year,y=Emissions))
g2=g2+stat_summary(fun.y="sum",geom="point",colour="blue")
g2=g2+stat_summary(fun.y="sum",geom="line",colour="blue")
g2=g2+ylab("")
g2=g2+ggtitle("Los Angeles County CA Motor Vehicle Emissions")
#print(g2)

#install.packages("gridExtra")
require(gridExtra)
grid.arrange(g1,g2,ncol=2)

#close graphics device
dev.off()


