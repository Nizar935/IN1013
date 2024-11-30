-- 1 
SELECT R.first_name, R.surname, RB.bill_date, COUNT(*) AS number_of_bills
FROM restBill RB
INNER JOIN restStaff R
    ON RB.waiter_no = R.staff_no
GROUP BY R.first_name, R.surname, RB.bill_date
HAVING COUNT(*) >= 2; 
-- 2 
SELECT room_name, COUNT(*) AS tables_count
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;
-- 3 
SELECT RT.room_name, SUM(RB.bill_total) AS total_bill_amount
FROM restBill RB
INNER JOIN restRest_table RT
    ON RB.table_no = RT.table_no
GROUP BY RT.room_name;
-- 4 
SELECT R.first_name, R.surname, SUM(RB.bill_total) AS total_bill_amount
FROM restBill RB
INNER JOIN restStaff RW
    ON RB.waiter_no = RW.staff_no
INNER JOIN restStaff R
    ON RW.headwaiter = R.staff_no
GROUP BY R.first_name, R.surname
ORDER BY total_bill_amount DESC;
-- 5 
SELECT cust_name
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;
-- 6 
SELECT R.first_name, R.surname, RB.bill_date, COUNT(*) AS number_of_bills
FROM restBill RB
INNER JOIN restStaff R
    ON RB.waiter_no = R.staff_no
GROUP BY R.first_name, R.surname, RB.bill_date
HAVING COUNT(*) >= 3;