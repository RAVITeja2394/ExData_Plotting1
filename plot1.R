
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "C:\\Users\\Ravi\\Desktop\\Coursera_assignment1\\EDA1\\Power.zip")

#Loading data into R

pc<-read.table("C:\\Users\\Ravi\\Desktop\\Coursera_assignment1\\EDA1\\Power\\household_power_consumption.txt",sep = ";",header = T,stringsAsFactors = F)

#Data Subsetting based on date criteria
pc$Date<-as.Date(pc$Date,format = "%d/%m/%Y")
pc$date_time<-strptime(paste(pc$Date,pc$Time,sep = " "),format = "%Y-%m-%d %H:%M:%S")
hpc<-pc[(pc$date_time >= "2007-02-01 00:00:00") & (pc$date_time < "2007-02-03 00:00:00"),]

#Plot Global active power frequency
hpc$Global_active_power <- hpc[hpc$Global_active_power != "?","Global_active_power"]

png(file="C:\\Users\\Ravi\\Desktop\\Coursera_assignment1\\EDA1\\Power\\plot1.png",
    width=480, height=480)

hist(as.numeric(hpc$Global_active_power),main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "red")


dev.off()
