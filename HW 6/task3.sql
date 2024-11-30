-- 1 
select first_name 
from restStaff R 
inner join restBill RT
on R.staff_no = RT.waiter_no 
where cust_name = "Tanya Singh"; 
-- 2 
select room_date 
from restRoom_management RQ 
inner join restStaff R 
on RQ.headwaiter = R.staff_no 
where first_name = "Charles" and room_name = "Green" and room_date LIKE "1602%"; 
-- 3 
select R.first_name,R.surname 
from restStaff R 
inner join restStaff R1 
on R.staff_no = R1.staff_no 
where R1.headwaiter = 005; 
-- 4 
select cust_name,bill_total,first_name 
from restBill RB 
inner join restStaff R 
on RB.waiter_no = R.staff_no 
order by bill_total desc;
-- 5 
SELECT DISTINCT R.first_name, R.surname 
FROM restStaff R
INNER JOIN restBill RB
ON R.staff_no = RB.waiter_no
WHERE RB.bill_no IN (14, 17);  
-- 6 
SELECT DISTINCT R.first_name, R.surname
FROM restStaff R
INNER JOIN restRoom_management RM
ON R.staff_no = RM.headwaiter OR R.headwaiter = RM.headwaiter
WHERE RM.room_name = 'Blue' AND RM.room_date = 160312;