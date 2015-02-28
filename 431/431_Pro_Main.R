setwd("C:/Users/Seongjin/Google Drive/rcode")

require(sqldf) #R& sql Connection
library(ggplot2) #ggplot Connection
library(XLConnect) #Load Excel File
library(dplyr) #Data Analysis Packages
library(WriteXLS)
library(plyr)

#Save as Excel Type
#testPerl(perl = "perl", verbose = TRUE)
#WriteXLS("df_total", "df_total.xls")
source("431_Dataset.R") # Load all the dataset

#pkg_info / gas_diesel / mpg_report / vehicle_to_center / slic_name

ls(pkg_info)

#TODO1: vol vs car graph
df_vol <- select(pkg_info, Total_Vol, VEH_NR)
df_carinfo <- select(vehicle_to_center, VEH_NR, Group)

df_total <- sqldf("select pkg_info.*, vehicle_to_center.* from  pkg_info join vehicle_to_center on (pkg_info.VEH_NR = vehicle_to_center.VEH_NR)")

# load library
library(stringr)
# extract numbers only
df_total.num <- as.numeric(str_extract(df_total$Group, "[0-9]+"))
# check output  

vehicle_size <- as.numeric(df_total.num, na.rm = TRUE)
real_size <- vehicle_size * 10

#See size matches
head(real_size)
head(df_total$Group)

df_pkg <- data.frame(df_total)
#df_total <- sqldf("select df_vehicle.*, df_pkg.* from df_vehicle join df_pkg on (df_vehicle.Car_num = df_package.VEH_NR)")
df_adj <- cbind(df_pkg,real_size)

df_adj <- data.frame(df_adj)

testPerl(perl = "perl", verbose = TRUE)
WriteXLS("df_adj", "df_total.xls")





df_total <- sqldf("select df_vehicle.*, df_pkg.* from df_vehicle join df_pkg on (df_vehicle.Car_num = df_package.VEH_NR)")

ddply(df_pkg,~VEH_NR,summarise,mean=mean(Miles),sd=sd(Miles))



summary(real_size)

#hist(real_size, breaks=seq(100,1300,by=3), main="Breaks=3")
#hist(real_size, breaks=2, xlim=c(100,1200), main="Breaks=3")
#Draw the histogram of data with bin width
my.bin.width <- 5
hist(vehicle_size, breaks = seq(0,130,by=my.bin.width))

#Create Scatter Plot of Miles vs. MPG Based on Route
route.plt = ggplot(a, aes(x=real_size, y=Total_Vol))
route.plt + geom_point(aes(colour = Group))
geom_point(shape=1, alpha = 1/4,
           position = position_jitter(width=1,height=.5)) +
  geom_smooth(method = lm)

#stat_smooth_func(geom="text",method="lm",hjust=0,parse=TRUE) +

df_total <- sqldf("select df_vehicle.*, df_pkg.* from df_vehicle join df_pkg on (df_vehicle.Car_num = df_package.VEH_NR)")
df_total_name <- sqldf("select df_total.*, slic_name.* from df_total join slic_name on (df_total.Slic = slic_name.PKG_CTR_NR")
df_pkg <- transform(pkg_info, VEH_NR = as.numeric(VEH_NR))
df_vehicle <- transform((vehicle_to_center), Slic = as.numeric(Slic))

