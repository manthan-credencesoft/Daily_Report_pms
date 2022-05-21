CREATE DEFINER=`root`@`localhost` PROCEDURE `Payment`(in hotel_id int, in current_dat date)
BEGIN

 DECLARE payment_name_var varchar(30);
 declare j int;
 declare y int;
 DECLARE done INT DEFAULT 0;

DECLARE cursor1 CURSOR FOR SELECT distinct(business_service_name) from csoft4.payment where property_id=hotel_id and business_service_name is not null ;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
     
OPEN cursor1;
set j = (select count(distinct(business_service_name)) from csoft4.payment);
set y= 0;
loop1:while y<=j do
      FETCH NEXT FROM cursor1 INTO payment_name_var;
	  call Daily_Payment(hotel_id, current_dat, payment_name_var);
      set y=y+1;
END while loop1;
CLOSE cursor1;
select * from Daily_payment;
END