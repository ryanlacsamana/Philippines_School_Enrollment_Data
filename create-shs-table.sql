/* Create a table for SHS enrollment, where Academic Year starts in 2016 onwards */
CREATE TABLE ph_shs_enrollment AS
	SELECT item_no, sector, Academic_Year, Region, Grade_11_ABM, Grade_11_HUMSS, Grade_11_STEM, Grade_11_GAS, Grade_11_MARITIME, Grade_11_TVL, Grade_11_SPORTS, Grade_11_AD, Grade_12_ABM, Grade_12_HUMSS, Grade_12_STEM, Grade_12_GAS, Grade_12_MARITIME, Grade_12_TVL, Grade_12_SPORTS, Grade_12_AD
    FROM phschoolenrollment
    WHERE 
    AY_Start >= 2016
    
SELECT *
FROM ph_shs_enrollment
    