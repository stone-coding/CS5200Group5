

/* Drop the tables if they exist */
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `apply`;
DROP TABLE IF EXISTS `applyout`;
DROP TABLE IF EXISTS `checkout`;
DROP TABLE IF EXISTS `contract`;
DROP TABLE IF EXISTS `houselist`;
DROP TABLE IF EXISTS `paid`;
DROP TABLE IF EXISTS `schedule`;
DROP TABLE IF EXISTS `solve`;
DROP TABLE IF EXISTS `topaid`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `userlist`;
DROP TABLE IF EXISTS `wrong`;
DROP TABLE IF EXISTS `rentlist`;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. Drop Trigger
-- To drop the after_apply_update trigger:
DROP TRIGGER IF EXISTS `after_apply_update`;

-- 2. Drop Function
-- To drop the TotalRentPaid function:
DROP FUNCTION IF EXISTS `TotalRentPaid`;

-- 3. Drop View
-- To drop the HouseDetails view:
DROP VIEW IF EXISTS `HouseDetails`;