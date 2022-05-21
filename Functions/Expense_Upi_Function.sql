CREATE DEFINER=`root`@`localhost` FUNCTION `eupi`(id int ,current_dat date , business_name varchar(30)) RETURNS int
BEGIN
    SET @eupi = (select sum(amount) from csoft4.expense where (date= current_dat or date =date(current_dat-1)) and property_id = id and name = business_name and payment_mode=3 and is_reported=0);
 

RETURN @eupi;
END