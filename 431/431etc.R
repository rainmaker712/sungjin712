# load library
library(stringr)
# extract numbers only
df_total.num <- as.numeric(str_extract(ups_summary$Car_Group, "[0-9]+"))
# check output  
vehicle_size <- as.numeric(df_total.num, na.rm = TRUE)
real_size <- vehicle_size * 10
real_size2 <- data.frame(real_size)
#colnames(real_size2, do.NULL= TRUE, prefix = "Car_Size")

head(real_size2)

#testPerl(perl = "perl", verbose = TRUE)
#WriteXLS("real_size2", "real_size.xls")
#WriteXLS("df.ups", "df.ups.xls")


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


df_2 <- sqldf("select df_1.*, slic_name.* from df_1 join slic.name on
              (df_1.OGZ_NR = slic_name.OGZ_NR)")


#TODO1: vol vs car graph
df_vol <- select(pkg_info, Total_Vol, VEH_NR)
df_carinfo <- select(vehicle_to_center, VEH_NR, Group)

df_raw1 <- sqldf("select pkg_info.*, vehicle_to_center.* from  pkg_info join vehicle_to_center on (pkg_info.OGZ_NR = vehicle_to_center.OGZ_NR
                )")


#pkg_info / gas_diesel / mpg_report / vehicle_to_center / slic_name

#ups_ = loadWorkbook("UPS_Summary.xlsx")
#pkg_info = readWorksheet(ups_summary, sheet="Pkg Info Project 1")

#df_1 <- sqldf("select pkg_info.*, vehicle_to_center.* from
#              pkg_info join vehicle_to_center on
#              (pkg_info.VEH_NR = vehicle_to_center.VEH_NR)")


#testPerl(perl = "perl", verbose = TRUE)
#WriteXLS("df_total", "df_total.xls")


# check output
aggregate(ups_total$MPG ~Group, mean)


#Extract Values & Save Files
df_pkg <- select(pkg_info, 1:3, 8:9)
df_vehicle <- select(vehicle_to_center, -Status, -Model)

# change data type
df_pkg <- transform(df_pkg, VEH_NR = as.numeric(VEH_NR))
df_vehicle <- transform(df_vehicle, Slic = as.numeric(Slic))

#ls(df_vehicle)
#colnames(df_vehicle)[1] <- "Car_num" #change col name

df_total <- sqldf("SELECT df_pkg.*, df_vehicle.* FROM df_pkg JOIN df_vehicle ON (df_pkg.VEH_NR = df_vehicle.Car_num)")
df_total_name <- sqldf("select df_total.*, slic_name.* from df_total join slic_name on (df_total.Slic = slic_name.PKG_CTR_NR")

ls(slic_name)




#df_pkg.* from df_vehicle join df_pkg on (df_vehicle.Car_num = df_package.VEH_NR)")
vehicle_raw <- vehicle_to_center$Group


# load library
library(stringr)
# extract numbers only
vehicle_raw.num <- as.numeric(str_extract(vehicle_raw, "[0-9]+"))
# check output  
vehicle_size <- as.numeric(vehicle_raw.num, na.rm = TRUE)
vehicle_size



#Previous Coding
#car_size <- as.factor(ups_raw$Group)
#summary(car_size)


####pkg_info & mpg_report#####
#df_pkg1 <- sqldf("select * from pkg_info")
#df_pkg1 <- transform(df_pkg1, VEH_NR = as.numeric(VEH_NR))


#df_mpg1 <- sqldf("select * from mpg_report where MPG > 0 and MilesRun > 0") #Miles & Equip Dat
#df_mpg1 <- transform(df_mpg1, Equip = as.numeric(Equip))

#colnames(df_pkg1) #colnames(df_mpg1)
#str(df_mpg1) #str(df_pkg1)
#df_total <- sqldf("SELECT df_pkg1.*, df_mpg1.* FROM df_pkg1 JOIN df_mpg1 ON (df_pkg1.VEH_NR = df_mpg1.Equip)")






###rt_info <- sqldf("SELECT slic_name.PKG_CTR_NR, slic_name.PKG_CTR_NA, vehicle_to_center.Slic,
#              vehicle_to_center.Make, vehicle_to_center.Model
#             from slic_name, vehicle_to_center, pkg_info
#            where slic_name.PKG_CTR_NR = vehicle_to_center.Slic")




#Engine Type / MPG / Fuel Type / Car Group
engtype_sum <- as.factor(mpg_report$Engine)
summary(engtype_sum)
aggregate(mpg_report$MPG ~ a, mpg_report, mean)


#Find Average of Data
summary(mpg_report$MPG)
summary(mpg_report$MilesRun)
summary(mpg_report$Fuel.Used)
summary(pkg_info$Miles)          
summary(pkg_info$Del_Vol)          
summary(pkg_info$Del_Stops)          
summary(pkg_info$PU_Vol)          
summary(pkg_info$PU_Stops)          

#TODO: Route analysis
colnames(slic_name)
colnames(vehicle_to_center)

rt_info <- sqldf("SELECT slic_name.PKG_CTR_NR, slic_name.PKG_CTR_NA, vehicle_to_center.Slic,
                 vehicle_to_center.Make, vehicle_to_center.Model
                 from slic_name, vehicle_to_center, pkg_info
                 where slic_name.PKG_CTR_NR = vehicle_to_center.Slic")


#####pkg_info & mpg_report#####
df_pkg1 <- sqldf("select * from pkg_info")
df_pkg1 <- transform(df_pkg1, VEH_NR = as.numeric(VEH_NR))

df_mpg1 <- sqldf("select * from mpg_report where MPG > 0 and MilesRun > 0") #Miles & Equip Dat
df_mpg1 <- transform(df_mpg1, Equip = as.numeric(Equip))

#colnames(df_pkg1) #colnames(df_mpg1)
#str(df_mpg1) #str(df_pkg1)
df_total <- sqldf("SELECT df_pkg1.*, df_mpg1.* FROM df_pkg1 JOIN df_mpg1 ON (df_pkg1.VEH_NR = df_mpg1.Equip)")






#Vehicle Analysis
colnames(df_total)
#Diesel + Gasoline
gfuel <- sqldf("select Fuel, MPG from df_total where Fuel = 'G'")
dfuel <- sqldf("select Fuel, MPG from df_total where Fuel = 'D'")

summary(gfuel)
summary(dfuel)

# Overlaid histograms
ggplot(gfuel, aes(x=MPG, colour = "blue")) + geom_histogram(binwidth=.5, alpha=.5, position="identity") + ggtitle("Gasoline MPG Distribution")
# Interleaved histograms
ggplot(dfuel, aes(x=MPG, colour = "green")) + geom_histogram(binwidth=.5, position="dodge") + ggtitle("Diesel MPG Distribution")
# Density plots
ggplot(dfuel, aes(x=MPG, colour=black + geom_density()
                  # Density plots with semi-transparent fill
                  ggplot(dfuel, aes(x=MPG, fill=white)) + geom_density(alpha=.3)
                  
                  
                  
                  
                  
                  
                  
                  plot.new()
                  
                  frame()
                  
                  #TODO3: del.stop + pu.stop
                  # R convert data into character, not the numer
                  df_total$OGZ_NR
                  nr <- as.numeric(df_total$OGZ_NR)
                  
                  
                  df_stops <- sqldf("select Miles, Del_Stops+PU_Stops as DelPUtot from df_total")
                  
                  stops.plt = ggplot(df_stops, aes(x=Miles, y=DelPUtot)) +
                    stat_smooth_func(geom="text",method="lm",hjust=0,parse=TRUE) +
                    geom_point(shape=1, alpha = 1/4,
                               position = position_jitter(width=1,height=.5)) +
                    geom_smooth(method = lm)
                  
                  stops.plt
                  
                  
                  #TODO2: del.pickup + del.dropoff
                  ls(df_total)
                  
                  df_vol <- sqldf("select Miles, Del_Vol+PU_Vol as DelPUtot from df_total")
                  
                  vol.plt = ggplot(df_vol, aes(x=Miles, y=DelPUtot)) +
                    stat_smooth_func(geom="text",method="lm",hjust=0,parse=TRUE) +
                    geom_point(shape=1, alpha = 1/4,
                               position = position_jitter(width=1,height=.5)) +
                    geom_smooth(method = lm)
                  
                  
                  
                  #TODO1: graph miles vs. route
                  #Create Scatter Plot of Miles vs. MPG Based on Route
                  route.plt = ggplot(df_total, aes(x=Miles, y=MPG))
                  route.plt + geom_point(aes(colour = nr))
                  geom_point(shape=1, alpha = 1/4,
                             position = position_jitter(width=1,height=.5)) +
                    geom_smooth(method = lm)
                  
                  #stat_smooth_func(geom="text",method="lm",hjust=0,parse=TRUE) +
                  
                  route.plt