-- Query 1: Join query 
-- 1. Join query: List all rented houses with tenant details
SELECT 
    h.houseid AS House_ID, 
    h.address AS Address, 
    h.price AS Rent, 
    u.name AS Tenant_Name, 
    u.phone AS Tenant_Contact
FROM houselist h
JOIN rentlist r ON h.houseid = r.house_id
JOIN userlist u ON r.userlist_id = u.id
WHERE h.status = 'Rented';



-- Query 2: Aggregate query with GROUP BY and HAVING
-- Find the total rent paid by each user, grouped by user, where the total exceeds $1000, sorted by total rent in descending order.
SELECT 
    p.userlist_id,
    u.name AS user_name,
    SUM(p.price) AS total_rent
FROM 
    paid p
JOIN 
    userlist u
ON 
    p.userlist_id = u.id
GROUP BY 
    p.userlist_id, u.name
HAVING 
    total_rent > 1000
ORDER BY 
    total_rent DESC;
		
-- Query 3: Subquery
-- Find all houses that have been applied for but not yet added to the `applyout` table.
SELECT 
    houseid, address
FROM 
    houselist
WHERE 
    houseid NOT IN (
        SELECT house_id FROM applyout
    );


-- Query 4: Join with multiple tables
-- Find all tenants and the corresponding contracts with their rental house details.
SELECT 
    a.tenant AS tenant_name,
    a.address AS agreement_address,
    h.area AS house_area,
    h.price AS house_price,
    a.fromdate,
    a.todate
FROM 
    agreement a
JOIN 
    houselist h
ON 
    a.house_id = h.houseid;
		
-- Query 5: Aggregate query with GROUP BY, HAVING, and inline subquery
-- Find the average rental price for each user and filter users who rented houses larger than the average house area.
SELECT 
    p.userlist_id,
    u.name AS user_name,
    AVG(p.price) AS avg_rent
FROM 
    paid p
JOIN 
    userlist u
ON 
    p.userlist_id = u.id
WHERE 
    p.house_id IN (
        SELECT houseid FROM houselist WHERE area > (SELECT AVG(area) FROM houselist)
    )
GROUP BY 
    p.userlist_id, u.name
HAVING 
    avg_rent > 1200
ORDER BY 
    avg_rent DESC;