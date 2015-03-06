#Rename Table
#rename table mytable to mpg_report;
#RENAME TABLE mytable TO pkg_info;
#RENAME TABLE mytable TO vehicle_center;
RENAME TABLE mytable TO ups_summary;


#Delete all the outliers in mpg_report
DELETE FROM mpg_report WHERE MPG = 0;
#Create new table called mpg_report_clean
#drop table mpg_report_clean;
CREATE TABLE mpg_report_clean LIKE mpg_report;
INSERT mpg_report_clean SELECT * FROM mpg_report;

#Optimize mpg_report_clean table
OPTIMIZE TABLE mpg_report_clean;

#Combine pkg_info and vehicle_center by veh_nb

SELECT pkg_info.*, vehicle_center.*  FROM pkg_info JOIN vehicle_center ON
              (pkg_info.VEH_NR = vehicle_center.VEH_NR);

#CREATE TABLE a like pkg_info;
#3 tables combined, but need to get rid of some of data and ...

#SELECT * FROM (ups_summary LEFT JOIN vehicle_center ON
# ups_summary.VEH_NR=vehicle_center.VEH_NR)
# LEFT JOIN mpg_report ON ups_summary.VEH_NR=mpg_report.VEH_NR; 


DESCRIBE ups_summmary;
EXPLAIN ups_summary;
#OGZ_NR, VEH_NR, Car_Group, Make, Model
SELECT * FROM mpg_report;
SELECT * FROM pkg_info;
SELECT * FROM vehicle_center;

SELECT * FROM ups_summary;
SELECT * FROM ups_summary GROUP BY VEH_NR;

#Extract only numerical values from Car_Group

ALTER TABLE ups_summary ADD NewValue VARCHAR(60) FIRST;

#UPDATE myTable SET ColumnA =NewValue WHERE concat('',ColumnA * 1) = ColumnA 
UPDATE ups_summary SET Car_Group = NewValue WHERE CONCAT('',Car_Group * 1) = Car_Group

#Check whetehr vehicle to Score each vehicle >> Divide by Vehicle Size

SELECT * FROM ups_summary;

#Create another table for this
CREATE TABLE df_size_nr AS SELECT Vehicle_size, VEH_NR
 FROM ups_summary GROUP BY VEH_NR;

#Remove all the null from table df_size_nr
#DELETE FROM df_size_nr WHERE Vehicle_size IS NULL;

DELETE FROM ups_summary WHERE Vehicle_size IS NULL;

SELECT * FROM ups_summary GROUP BY VEH_NR;




