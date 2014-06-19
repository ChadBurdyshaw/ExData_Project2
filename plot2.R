#exploratory data analysis Project 2 plot 2


#Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#merge data to obtain classification codes
NEISCC=merge(NEI,SCC,by="SCC")
rm(NEI)#release memory for NEI
rm(SCC)#release memory for SCC
year=c(1999,2002,2005,2008)


#2) Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.
BaltMD=subset(NEISCC,NEISCC$fips=="24510")
TotalBaltMDEmissions=tapply(BaltMD$Emissions,BaltMD$year,sum)

#create png graphics device
png(filename="plot2.png",width=480,height=480,units="px")

plot(year,TotalBaltMDEmissions,type="b",xlab="Year",ylab="PM_2.5 Emissions (tons)",main="Total PM_2.5 Emissions from Baltimore City MD")

#close graphics device
dev.off()
