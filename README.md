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
  Grade_11_ABM | column correponding to Grade 11 number of enrollees for ABM strand|
  Grade_11_HUMSS | column correponding to Grade 11 number of enrollees for HUMSS strand|
  Grade_11_STEM | column correponding to Grade 11 number of enrollees for STEM strand|
  Grade_11_GAS | column correponding to Grade 11 number of enrollees for GAS strand|
  Grade_11_MARITIME | column correponding to Grade 11 number of enrollees for MARITIME strand|
  Grade_11_TVL | column correponding to Grade 11 number of enrollees for TVL strand|
  Grade_11_AD | column correponding to Grade 11 number of enrollees for A&D strand|
  Grade_12_ABM | column correponding to Grade 12 number of enrollees for ABM strand|
  Grade_12_HUMSS | column correponding to Grade 12 number of enrollees for HUMSS strand|
  Grade_12_STEM | column correponding to Grade 12 number of enrollees for STEM strand|
  Grade_12_GAS | column correponding to Grade 12 number of enrollees for GAS strand|
  Grade_12_MARITIME | column correponding to Grade 12 number of enrollees for MARITIME strand|
  Grade_12_TVL | column correponding to Grade 12 number of enrollees for TVL strand|
  Grade_12_AD | column correponding to Grade 12 number of enrollees for A&D strand|

### Data Exploration and Data Cleaning

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

We will create new tables that will separate the 3 academic levels, **Elementary**, **Junior High School**, **Senior High School**.

**To create the table containing number of enrollees from Elementary Students:**

```
CREATE TABLE ph_elem_enrollment AS
	SELECT item_no, sector, Academic_Year, Region, Kindergarten, Grade_1, Grade_2, Grade_3, Grade_4, Grade_5, Grade_6
    FROM phschoolenrollment;
    
SELECT * FROM ph_elem_enrollment
```

**To create the table containing number of enrollees from Junior High School Students:**

```
CREATE TABLE ph_jhs_enrollment AS
	SELECT item_no, sector, Academic_Year, region, Grade_7, Grade_8, Grade_9, Grade_10
    FROM phschoolenrollment
    
SELECT * FROM ph_jhs_enrollment
```

**To create the table containing number of enrollees from Senior High School Students:**

```
/* Create a table for SHS enrollment, where Academic Year starts in 2016 onwards */
CREATE TABLE ph_shs_enrollment AS
	SELECT item_no, sector, Academic_Year, Region, Grade_11_ABM, Grade_11_HUMSS, Grade_11_STEM, Grade_11_GAS, Grade_11_MARITIME, Grade_11_TVL, Grade_11_SPORTS, Grade_11_AD, Grade_12_ABM, Grade_12_HUMSS, Grade_12_STEM, Grade_12_GAS, Grade_12_MARITIME, Grade_12_TVL, Grade_12_SPORTS, Grade_12_AD
    FROM phschoolenrollment
    WHERE 
    AY_Start >= 2016
    
SELECT *
FROM ph_shs_enrollment
```
_The data has been filtered to only show enrollment data from 2016 up to 2021. This is because K-to-12 has not been implemented before that academic year. The K-to-12 introduced Grade 11 and Grade 12 and the different strands._

**To create the table containing sum of enrollees per strand:**

```
CREATE TABLE ph_shs_strand AS (
	SELECT Academic_Year, sector,
		SUM(Grade_11_ABM) AS G11_ABM,
		SUM(Grade_11_AD) AS G11_AD,
		SUM(Grade_11_GAS) AS G11_GAS,
		SUM(Grade_11_HUMSS) AS G11_HUMSS,
		SUM(Grade_11_MARITIME) AS G11_MARITIME,
		SUM(Grade_11_SPORTS) AS G11_SPORTS,
		SUM(Grade_11_STEM) AS G11_STEM,
		SUM(Grade_11_TVL) AS G11_TVL,
		SUM(Grade_12_ABM) AS G12_ABM,
		SUM(Grade_12_AD) AS G12_AD,
		SUM(Grade_12_GAS) AS G12_GAS,
		SUM(Grade_12_HUMSS) AS G12_HUMSS,
		SUM(Grade_12_MARITIME) AS G12_MARITIME,
		SUM(Grade_12_SPORTS) AS G12_SPORTS,
		SUM(Grade_12_STEM) AS G12_STEM,
		SUM(Grade_12_TVL) AS G12_TVL
	FROM ph_shs_enrollment
	GROUP BY `Academic_Year`,`sector`
    );
```

### Data Visualization

Visualize the number of enrollees per section from SY 2010-2011 to SY 2020-2021

![No  of Enrollees - Total](https://github.com/ryanlacsamana/Philippines_School_Enrollment_Data/assets/138304188/6b0bd719-eadc-4208-ae7a-9130d8a6f199)

The graph shows that enrollment in Public Schools are highest for all academic years. All sector have shown a noticeable increase in enrollment for SY 2016-2017. This could be due to the implementation of Senior High School as part to K-to-12 system. This means that the increase in enrollment could be due to the additional academic level and the students that are enrolling for Senior High School.

Visualize the number of enrollees per region

![No  of Enrollees per Region](https://github.com/ryanlacsamana/Philippines_School_Enrollment_Data/assets/138304188/e88e9f1e-61f5-4b37-8080-bd791d2e6ead)

From the chart above, the number of enrollees is higher for Region IV-A - CALABARZON, which is higher than the number of enrollees in National Capital Region (NCR). This is true for all the number of enrollments observed from SY 2010-2011 to SY 2020-2021.
