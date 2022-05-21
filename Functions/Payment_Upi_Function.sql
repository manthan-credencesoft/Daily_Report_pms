CREATE DEFINER=`root`@`localhost` FUNCTION `upi`(id int ,current_dat date,business_name varchar(30)) RETURNS int
BEGIN
    SET @upi = (select sum(transaction_amount) as total_amount from csoft4.payment where (property_id=id) and (business_service_name=business_name) and (is_reported=0) and (payment_mode =3) and (date = current_dat or date = date(current_dat-1)) );

RETURN @upi;
END