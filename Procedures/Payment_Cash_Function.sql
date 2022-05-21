CREATE DEFINER=`root`@`localhost` FUNCTION `cash`(id int ,current_dat date , business_name varchar(30)) RETURNS int
BEGIN
    SET @cash = (select sum(transaction_amount) as total_amount from csoft4.payment where (property_id=id) and (business_service_name=business_name) and (payment_mode =2) and (is_reported=0) and (date = current_dat or date = date(current_dat-1)) );

RETURN @cash;
END