#----------------------plot2------------------------

#Data-set import and class assignemt
variableclass<-c(rep('character',2),rep('numeric',7))
household_power_consumption <- read.csv("~/GIT/ExData_Plotting1/household_power_consumption.txt", sep=";",na.strings='?', colClasses=variableclass)
household_power_consumption$Date  <- as.Date(household_power_consumption$Date, format='%d/%m/%Y')
household_power_consumption$Time  <- paste(household_power_consumption$Date, household_power_consumption$Time, sep=' ')
household_power_consumption$Time <- as.POSIXct(household_power_consumption$Time, format='%Y-%m-%d %H:%M:%S')

#Data-set filtering for required date span
library("dplyr")
household_power_consumption <- tbl_df(household_power_consumption)
dataXplot <- filter(household_power_consumption, Date=='2007-02-01' | Date=='2007-02-02')

#create plot2.png
png(filename='plot2.png',width=480,height=480,units='px')
plot(dataXplot$Time,dataXplot$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
x<-dev.off()