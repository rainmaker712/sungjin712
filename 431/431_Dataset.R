#install necessary package.

#install.packages("WriteXLS")
#install.packages("Perl")
#install.packages("Rtools")

#install.packages("sqldf")
#install.packages("ggplot2")
#install.packages("XLConnect")
#install.packages("dplyr")
#install.packages("rJava")

#TOPIC1:  DATA SAVING
ups_summary = loadWorkbook("UPS_Summary.xlsx")
pkg_info = readWorksheet(ups_summary, sheet="Pkg Info Project 1")
gas_diesel = readWorksheet(ups_summary, sheet="OVA Gas_Diesel Center Info.")
mpg_report = readWorksheet(ups_summary, sheet="Ohio Valley MPG REPORT")
vehicle_to_center = readWorksheet(ups_summary, sheet="Vehicle to Center Info")
slic_name = readWorksheet(ups_summary, sheet ="SLIC-Center Name")
#pkg_info / gas_diesel / mpg_report / vehicle_to_center / slic_name






