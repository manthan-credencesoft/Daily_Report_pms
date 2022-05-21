use csoft1;
call Guests("HOtel Pentagon", '2021-04-07');


use csoft1;
call Current_Booking("HOtel Pentagon", '2020-11-07');


use csoft1;
call Advance_Booking("HOtel Pentagon", '2020-11-07');


use csoft4;
call Payment(237, '2022-04-22');

use csoft3;
call Expenditure(107, '2020-10-22');

use csoft4;
call Service_Order(267, '2021-03-19');

use csoft1;
call new_procedure("HOTEL AYUSH INTERNATIONAL", '2022-04-22');

select checkin_guests("HOTEL AYUSH INTERNATIONAL",'2022-04-22');

use csoft4;
call Daily_Payment(276, '2021-04-21', "Accommodation");


set @current_dat = '2022-04-23';
SET @upi = (select sum(transaction_amount) as total_amount from csoft4.payment where property_id=495 and date = '2022-04-23' or  date >= date('2022-04-23' -1) and  business_service_name="Accommodation" and payment_mode =3);
select @upi;

use csoft4;
call Daily_Expense(442, '2021-12-11', "Cleaning Fee");
select count(is_reported) from expense where is_reported=1;
use csoft4;
call Daily_Expense(494, '2022-04-19', "PURCHASE");

select sum(transaction_amount) as total_amount from csoft4.payment where property_id=495 and business_service_name="Accommodation" and payment_mode =3 and is_reported=0 and date = '2021-12-09' or date = date('2021-12-09' -1);
select sum(transaction_amount) as total_amount from csoft4.payment where (property_id=276) and (business_service_name="Accommodation") and (payment_mode =1) and (is_reported=0) and (date = '2021-04-21' or date = date('2021-04-20' -1));



select * from expense where is_reported=1 and property_id=420 and date = '2022-02-07';
select count(is_reported) from payment where is_reported=0;

alter table expense drop is_reported;
alter table payment drop is_reported;

alter table payment add is_reported bit default 0;
alter table expense  add is_reported bit default 0;

select sum(amount) from csoft4.expense where (date = '2021-12-09' or date = date('2021-12-09'-1)) and property_id = 442 and name = "Cleaning Fee" and payment_mode=1 and is_reported=0;

set @ecredit = (select ecredit(424, '2021-01-12', '2021-12-12', "Booking Refund"));
select @ecredit;