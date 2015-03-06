# Load packakges
setwd("C:/Users/Seongjin/Documents/sungjin712/431/dataset")
#require(sqldf) #R& sql Connection
library(ggplot2) #ggplot Connection
library(XLConnect) #Load Excel File
library(dplyr) #Data Analysis Packages
library(WriteXLS)
library(plyr)

#Found out missing values
#install.packages('Amelia')
#require(Amelia)
#Correlation Analysis
#install.packages('corrplot')
#library(corrplot)


#Load data from excel from df.ups
ups = loadWorkbook("df.ups.xls")
ups.raw = readWorksheet(ups, sheet="df.ups")
ups.raw <- data.frame(ups.raw) # Convert to dataframe

#Save as Excel Type
#testPerl(perl = "perl", verbose = TRUE)
#WriteXLS("df_total", "df_total.xls")
