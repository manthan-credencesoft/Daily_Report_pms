CREATE DEFINER=`root`@`localhost` PROCEDURE `Daily_Payment`(in hotel_id int, in current_dat date, business_service varchar(30))
BEGIN
        
	  Set @credit = (select credit(hotel_id,current_dat,business_service));
	 Set @cash = (select cash(hotel_id,current_dat,business_service));
	 Set @upi = (select upi(hotel_id,current_dat,business_service));
     

     CREATE TABLE if not exists Daily_payment (
     id int AUTO_INCREMENT PRIMARY KEY,
     hotelid int,
     currentdat date,
     businessservice varchar(30),
     credit int,
     cash int,
     upi int
	 );
     
     set @count = (select count(id) from Daily_Payment where hotelid = hotel_id and currentdat = current_dat and businessservice = business_service);
     if @count = 0 then
     insert into Daily_payment (hotelid,currentdat,businessservice ,credit,cash,upi) values (hotel_id,current_dat,business_service,@credit, @cash, @upi);
    
    SET SQL_SAFE_UPDATES=0;
	update payment set is_reported=1 where (is_reported=0) and (property_id=hotel_id) and (business_service_name= business_service) and (date = current_dat or date = date(current_dat-1)) ;
    
	SET SQL_SAFE_UPDATES=1;
    end if;
    
    
END