#----------------------plot4------------------------

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

#create plot4.png

png(filename='plot4.png',width=480,height=480,units='px')

# set 2x2 quardrant
par(mfrow=c(2,2))

# Create top left plot
plot(dataXplot$Time,dataXplot$Global_active_power,ylab='Global Active Power',xlab='',type='l')

# Create top right plot
plot(dataXplot$Time,dataXplot$Voltage,xlab='datetime',ylab='Voltage',type='l')

# Create bottom left plot
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(dataXplot$Time,dataXplot$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(dataXplot$Time,dataXplot$Sub_metering_2,col=lncol[2])
lines(dataXplot$Time,dataXplot$sub_metering_3,col=lncol[3])
legend('topright',legend=lbls,col=lncol,lty='solid')

# Create bottom right plot
plot(dataXplot$Time,dataXplot$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')

# Close off graphic device
x<-dev.off()