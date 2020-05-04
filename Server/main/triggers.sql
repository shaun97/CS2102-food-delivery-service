-- create or replace function GetCost
-- (promoCode text, totalFoodCost integer, out deliveryCost integer, out subtotal integer) 
-- returns record as $$

--     select (deliverFoodCost * discount) as subtotal, case
--         when extract(hour from current_time) >= 20 then 5
--         else 3
--     end as deliveryCost
--     from 


--Function to get delivery cost based on the time
CREATE OR REPLACE FUNCTION getDeliveryCost (OUT deliveryCost INTEGER) RETURNS INTEGER
    AS $$
SELECT CASE
        WHEN extract(hour from current_time) >= 17 THEN 5
        ELSE 3
    END
$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION insertandscheduleorder(cid int, rname varchar(255), cartcost integer, location varchar(50)) 
RETURNS void AS $$
--schedule here
BEGIN 
    INSERT INTO Orders(cid, rname, cartCost, location) VALUES (cid, rname, cartcost, location);
END
$$ language plpgsql;