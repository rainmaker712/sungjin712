# Load packakges
setwd("D:/github_shin/sungjin712/431/dataset")
#require(sqldf) #R& sql Connection
library(ggplot2) #ggplot Connection
library(XLConnect) #Load Excel File
library(dplyr) #Data Analysis Packages
library(WriteXLS)
library(plyr)

#Reading csv function
readData <- function(path.name, file.name, column.types, missing.types) {
  read.csv( url( paste(path.name, file.name, sep="") ),
            colClasses=column.types,
            na.strings=missing.types )
}


#Found out missing values
#install.packages('Amelia')
require(Amelia)
#Correlation Analysis
#install.packages('corrplot')
#library(corrplot)

#Load data from excel from df.ups
ups.raw <- read.csv('df.ups.csv', header = TRUE,
                    sep = ",", quote = "\"",
                    dec = ".", fill = TRUE, comment.char = "")

#Load data from excel from center num.
ups.name <- read.csv('SLIC_Center_Name.csv', header = TRUE,
                    sep = ",", quote = "\"",
                    dec = ".", fill = TRUE, comment.char = "")

#Load data from excel from center num.
ups = loadWorkbook("SLIC-Center Name")
ups.name = readWorksheet(ups, sheet="DIVCT")
ups.name <- data.frame(ups.name) # Convert to dataframe



#Save as Excel Type
#testPerl(perl = "perl", verbose = TRUE)
#WriteXLS("df_total", "df_total.xls")
