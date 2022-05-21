CREATE DEFINER=`root`@`localhost` FUNCTION `credit`(id int ,current_dat date ,business_name varchar(30)) RETURNS int
BEGIN
    SET @credit = (select sum(transaction_amount) as total_amount from csoft4.payment where (property_id=id) and (business_service_name=business_name) and (payment_mode =1)  and (is_reported=0) and (date = current_dat or date = date(current_dat-1)));

RETURN @credit;
END