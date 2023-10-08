## Philippines School Enrollment Data

The dataset contains information about the number of enrollees in the Philippines from 2010 to 2021. This contains information based on Regions and variables based on school grade, from Kindergarten to Grade 12 (classified by strands). The dataset is from the [Department of Education Dataset](https://www.deped.gov.ph/alternative-learning-system/resources/facts-and-figures/datasets/), with values consolidated in a CSV file, then imported to MySQL for practicing purposes.

The dataset contains the following columns:

  Column | Desciption |
  -------|--------|
  item_no | row number that serves as primary key |
  sector | sector from which the data is obtained (public, private, suc-luc)|
  Academic_Year | the customary annual period of classes (SY YYYY-YYYY)|
  AY_Start | start of Academic_Year (YYYY)|
  AY_End | end of Academic_Year (YYYY)|
  Region | region corresponding to each administrative region in the Philippines|
  Kindergarten | column corresponding to Kindergarten number of enrollees|
  Grade_1 | column corresponding to Grade 1 number of enrollees|
  Grade_2 | column corresponding to Grade 2 number of enrollees|
  Grade_3 | column corresponding to Grade 3 number of enrollees|
  Grade_4 | column corresponding to Grade 4 number of enrollees|
  Grade_5 | column corresponding to Grade 5 number of enrollees|
  Grade_6 | column corresponding to Grade 6 number of enrollees|
  Grade_7 | column corresponding to Grade 7 number of enrollees|
  Grade_8 | column corresponding to Grade 8 number of enrollees|
  Grade_9 | column corresponding to Grade 9 number of enrollees|
  Grade_10 | column corresponding to Grade 10 number of enrollees|
  Grade_11 ABM | column correponding to Grade 11 number of enrollees for ABM strand|
  Grade_11 HUMSS | column correponding to Grade 11 number of enrollees for HUMSS strand|
  Grade_11 STEM | column correponding to Grade 11 number of enrollees for STEM strand|
  Grade_11 GAS | column correponding to Grade 11 number of enrollees for GAS strand|
  Grade_11 MARITIME | column correponding to Grade 11 number of enrollees for MARITIME strand|
  Grade_11 TVL | column correponding to Grade 11 number of enrollees for TVL strand|
  Grade_11 AD | column correponding to Grade 11 number of enrollees for A&D strand|
  Grade_12 ABM | column correponding to Grade 12 number of enrollees for ABM strand|
  Grade_12 HUMSS | column correponding to Grade 12 number of enrollees for HUMSS strand|
  Grade_12 STEM | column correponding to Grade 12 number of enrollees for STEM strand|
  Grade_12 GAS | column correponding to Grade 12 number of enrollees for GAS strand|
  Grade_12 MARITIME | column correponding to Grade 12 number of enrollees for MARITIME strand|
  Grade_12 TVL | column correponding to Grade 12 number of enrollees for TVL strand|
  Grade_12 AD | column correponding to Grade 12 number of enrollees for A&D strand|

To start, the dataset has been explored and cleaned. The dataset contains values that conflicts with the MySQL syntax. The [command](https://github.com/ryanlacsamana/Philippines_School_Enrollment_Data/blob/main/change-column-names.sql) below is used to clean the dataset.

  ```
/* Change column names */
ALTER TABLE dbenrollment.phschoolenrollment
CHANGE COLUMN `Grade 1` `Grade_1` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 2` `Grade_2` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 3` `Grade_3` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 4` `Grade_4` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 5` `Grade_5` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 6` `Grade_6` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 7` `Grade_7` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 8` `Grade_8` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 9` `Grade_9` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 10` `Grade_10` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 11 ABM` `Grade_11_ABM` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 11 HUMSS` `Grade_11_HUMSS` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 11 STEM` `Grade_11_STEM` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 11 GAS` `Grade_11_GAS` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 11 MARITIME` `Grade_11_MARITIME` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 11 TVL` `Grade_11_TVL` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 11 SPORTS` `Grade_11_SPORTS` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 11 A&D` `Grade_11_A&D` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 12 ABM` `Grade_12_ABM` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 12 HUMSS` `Grade_12_HUMSS` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 12 STEM` `Grade_12_STEM` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 12 GAS` `Grade_12_GAS` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 12 MARITIME` `Grade_12_MARITIME` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 12 TVL` `Grade_12_TVL` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 12 SPORTS` `Grade_12_SPORTS` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade 12 A&D` `Grade_12_A&D` INT NULL DEFAULT NULL;

/* Changed column name with 'A&D' into 'AD */
ALTER TABLE dbenrollment.phschoolenrollment
CHANGE COLUMN `Grade_11_A&D` `Grade_11_AD` INT NULL DEFAULT NULL,
CHANGE COLUMN `Grade_12_A&D` `Grade_12_AD` INT NULL DEFAULT NULL;

SELECT *
FROM dbenrollment.phschoolenrollment
```
