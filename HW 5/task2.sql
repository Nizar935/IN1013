 -- 1
    select sum(bill_total) as "Income" 
    from restBill;
    -- 2  
    select sum(bill_total) as " Feb Income" 
    from restBill 
    where bill_date LIKE "1602%"; 
    -- 3 
    select avg(bill_total) 
    from restBill 
    where table_no = 002; 
    -- 4 
    select min(no_of_seats) as "Min",max(no_of_seats) as "Max",avg(no_of_seats) as "Avg" 
    from restRest_table 
    where room_name = "Blue"; 
    -- 5  
    select count(DISTINCT table_no) 
    from restBill 
    where waiter_no = 004 or waiter_no = 002;