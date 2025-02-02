-- Load the csv File
inputFile = LOAD 'hdfs:///user/ajith/sales.csv' USING PigStorage(',') AS (Product:chararray,Price:chararray,Payment_Type:chararray,Name:chararray,City:chararray,State:chararray,Country:chararray);
-- Group the sales by country
grpd = GROUP inputFile BY Country;
-- Format the output
salesCount = FOREACH grpd GENERATE CONCAT((chararray)$0, CONCAT(':', (chararray)COUNT($1)));
-- To remove old ouputs
rmf /user/ajith/pigresultsAc4
-- Save result in HDFS folder
STORE salesCount INTO '/user/ajith/pigresultsAc4' USING PigStorage('\t');

