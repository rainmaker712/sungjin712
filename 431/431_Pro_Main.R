#Load UPS Data
ups.path <- "https://github.com/sungjin712/sungjin712/blob/master/431/dataset/"
ups.data.file <- "df.431.csv"
missing.types <- c("NA", "")
ups.col.types <- c('numeric', #Vehicle_size
                   'factor', #OGZ_NR
                   'character', #RTE_NR
                   'Date', #Date
                   'numeric', #RTE_Miles
                   'factor', #VEH_NR
                   'numeric', #Total_Vol
                   'numeric', #Total_Stop
                   'character', #Car_Group
                   'character', #Make
                   'character', #Model
                   'character', #Fuel
                   'character', #Engine_Type
                   'numeric', #MilesRun
                   'numeric', #Fuel_Used
                   'interger') #MPG



#Data Munging
#Draw the missing data
missmap(ups.raw, main="Ups_raw - Missings Map", 
        col=c("yellow", "black"), legend=FALSE)

return(print('Big'))

#ups.raw / ups.name

ups.raw <- na.omit(ups.raw) (Remove data)


duplicated(ups.raw$VEH_NR)
a <- ups.raw$VEH_NR[!duplicated(ups.raw$VEH_NR)]


ups.name






  #else if 500 <= size < 1000 {
  #  return(print('Med'))
  #}
  else size < 500 {
    return(print('Small'))
  }
}



#Save as Excel Type
#testPerl(perl = "perl", verbose = TRUE)
#WriteXLS("df_total", "df_total.xls")





#ups.raw, select d=VEH_NR, Mpg,
ls(ups.raw)
#[1] "Car_Group"    "Date"         "Engine_Type"  "Fuel"        
#[5] "Fuel_Used"    "Make"         "MilesRun"     "Model"       
#[9] "MPG"          "OGZ_NR"       "RTE_Miles"    "RTE_NR"      
#[13] "Total_Stop"   "Total_Vol"    "VEH_NR"       "Vehicle_size"



df.ups <- data.frame(ups.raw) #Convert data frame
#create new table and omit all values NA
mpgvs.size <- select(df.ups, MPG, Vehicle_size)
mpgvs.size2 <- na.omit(mpgvs.size)




#TODO1: why it keep saying data is not numeric .. ggplot

#Correlation Analysis
mcor <- cor(mpgvs.size2)
round(mcor, 2) 
corrplot(mcor, method='shade', shade.col=NA, tl.col='black', tl.srt=45)

ggplot(mpgvs.size2, aes(MPG, Vehicle_size)) +
  geom_point(aes(size=Vehicle_size))

#m + geom_histogram(aes(y = ..Vehicle_size..)) + geom_density()


ggplot(df.ups1, aes(x=MPG, y=Vehicle_size)) 


ups_summary <- data.frame(ups_summary)
#df.ups <- mutate(ups_summary, real_size2) #Add real_size CAr

#Subtract unneccesary vaules and save as df.ups
#ups_ = loadWorkbook("UPS_Summary.xlsx")
#pkg_info = readWorksheet(ups_summary, sheet="Pkg Info Project 1")
summary(ups.raw$Vehicle_size)

#Small(100~570), Medium(570~1000), Big(1000~)
#qplot(ups.raw$Vehicle_size) #Distribution

ls(ups.raw)
ggplot(ups.raw, aes(x=Vehicle_size, y=RTE_Miles)) + geom_point(aes(colour=Vehicle_size))






