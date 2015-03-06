

#install.packages("RMySQL")
library(RMySQL)
mydb = dbConnect(MySQL(), user='root', password='skfkshfo2', dbname='431', host='::1')
dbListTables(mydb) #Check the list

ups_summary <- dbGetQuery(mydb, "SELECT * FROM ups_summary")

#Load data from excel from df.ups
ups = loadWorkbook("df.ups.xls")
ups.raw = readWorksheet(ups, sheet="df.ups")
ups.raw <- data.frame(ups.raw) # Convert to dataframe

#write on the sql
dbWriteTable(mydb, "ups_summary", ups.raw, overwrite = TRUE)

#dbDisconnect(con)