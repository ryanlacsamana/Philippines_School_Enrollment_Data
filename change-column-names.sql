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