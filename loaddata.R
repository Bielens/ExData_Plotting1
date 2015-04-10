## This script downloads the household power consumption data set and
## loads the data for 1/2/2007 and 2/2/2007 into a data frame with the name 'hpc'
## The script is called by the plot1.R, plot2.R, plot3.R and plot4.R scripts

## Download the data, if not done already
if (!file.exists("./household_power_consumption.txt")) {
   fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
   download.file(fileurl,destfile="hpc.zip",method="curl")
   unzip("hpc.zip")
}

## Read the data - assume enoug RAM to hold it - my machine has 16G, should do
##library(data.table)
##fread("household_power_consumption.txt",sep=";",na.strings=c("?")) -> hpc_all
read.csv("household_power_consumption.txt",sep=";",na.strings=c("?")) -> hpc_all

## We only need the data for 1st and 2nd of feb, 2007
subset(hpc_all,Date=="1/2/2007"|Date=="2/2/2007") -> hpc

## Clean up some memory
rm(hpc_all)

