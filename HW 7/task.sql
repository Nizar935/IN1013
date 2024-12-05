-- 1 
create view samsBills 
as select first_name, surname, bill_date, cust_name, bill_total 
from restStaff R
 inner join restBill B 
on R.staff_no = B.waiter_no 
where R.staff_no = 004;
select * from samsBills;
-- 2 
select * from samsBills 
where bill_total > 400;
-- 3 
create view roomTotals 
as select R.room_name,SUM(B.bill_total) AS total_sum  
from restRest_table R 
inner join restBill B  
on R.table_no = B.table_no 
group by R.room_name; 
select * from roomTotals;
-- 4 
create view teamTotals 
as select CONCAT(H.first_name, ' ', H.surname) AS headwaiter_name,SUM(B.bill_total) AS total_sum
from restStaff H 
inner join restStaff W
on H.staff_no = W.headwaiter 
inner join restBill B 
on W.staff_no = B.waiter_no 
group by headwaiter_name; 
select * from teamTotals