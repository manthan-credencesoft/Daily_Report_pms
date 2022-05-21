CREATE DEFINER=`root`@`localhost` FUNCTION `ecredit`(id int ,current_dat date , business_name varchar(30)) RETURNS int
BEGIN
    SET @ecredit = (select sum(amount) from csoft4.expense where (date = current_dat or date= date(current_dat-1)) and property_id = id and name = business_name and payment_mode=1 and is_reported=0);
 

RETURN @ecredit;
END