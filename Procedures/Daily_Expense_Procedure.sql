CREATE DEFINER=`root`@`localhost` PROCEDURE `Daily_Expense`(in hotel_id int, in current_dat date, expense_name varchar(30))
BEGIN
        
	  Set @ecredit = (select ecredit(hotel_id,current_dat,expense_name));
	 Set @ecash = (select ecash(hotel_id,current_dat, expense_name));
	 Set @eupi = (select eupi(hotel_id,current_dat, expense_name));
     
     
     
     CREATE TABLE if not exists Daily_expense (
     id int AUTO_INCREMENT PRIMARY KEY,
     hotelid int,
     currentdat date,
     expensename varchar(30),
     ecredit int,
     ecash int,
     eupi int
	 );
     
	 set @count = (select count(id) from Daily_Expense where hotelid = hotel_id and currentdat = current_dat and expensename = expense_name);
     if @count = 0 then
     
     insert into Daily_expense (hotelid,currentdat,expensename,ecredit,ecash,eupi) values (hotel_id,current_dat,expense_name,@ecredit, @ecash, @eupi);
     
     SET SQL_SAFE_UPDATES=0;
     update expense set is_reported=1 where is_reported=0 and property_id=hotel_id and name=expense_name and date = current_dat or date = date(current_dat-1) ; 
     SET SQL_SAFE_UPDATES=1;
	end if;
    
END