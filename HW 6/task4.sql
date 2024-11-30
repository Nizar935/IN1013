-- 1 
SELECT cust_name
FROM restBill
WHERE waiter_no IN (
SELECT staff_no
FROM restStaff
WHERE headwaiter = (
SELECT staff_no
FROM restStaff
WHERE first_name = 'Charles'))
AND bill_total > 450.00; 
-- 2  
SELECT first_name, surname
FROM restStaff
WHERE staff_no = (
SELECT headwaiter
FROM restStaff
WHERE staff_no = (
SELECT waiter_no
FROM restBill
WHERE cust_name = 'Nerida Smith' AND bill_date = 160111)); 
-- 3 
SELECT cust_name
FROM restBill
WHERE bill_total = (
SELECT MIN(bill_total)
FROM restBill); 
-- 4 
SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (
SELECT DISTINCT waiter_no
FROM restBill); 
-- 5 
SELECT RB.cust_name,
(SELECT R.first_name
FROM restStaff R
WHERE R.staff_no = (
SELECT headwaiter
FROM restStaff RS
WHERE RS.staff_no = RB.waiter_no)),
(SELECT R.surname
FROM restStaff R
WHERE R.staff_no = (
SELECT headwaiter
FROM restStaff RS
WHERE RS.staff_no = RB.waiter_no)),
(SELECT RT.room_name
FROM restRest_table RT
WHERE RT.table_no = RB.table_no)
FROM restBill RB
WHERE RB.bill_total = (
SELECT MAX(bill_total)
FROM restBill);