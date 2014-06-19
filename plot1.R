#exploratory data analysis Project 2 plot 1


#Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#merge data to obtain classification codes
NEISCC=merge(NEI,SCC,by="SCC")
rm(NEI)#release memory for NEI
rm(SCC)#release memory for SCC
year=c(1999,2002,2005,2008)

#1) Have total emissions from PM2.5 decreased in the United States from 
#1999 to 2008? Using the base plotting system, make a plot showing the 
#total PM2.5 emission from all sources for each of the years 1999, 2002, 
#2005, and 2008.
TotalUSEmissions=tapply(NEISCC$Emissions,NEISCC$year,sum)

#create png graphics device
png(filename="plot1.png",width=480,height=480,units="px")

plot(year,TotalUSEmissions,type="b",xlab="Year",ylab="PM_2.5 Emissions (tons)",main="Total PM_2.5 Emissions From All US Sources")

#close graphics device
dev.off()
