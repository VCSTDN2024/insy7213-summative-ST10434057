SELECT 
    d.donor_id AS "Donor ID",
    b.bike_type AS "Bike Type",
    b.description AS "Bike Description",
    'R ' || TO_CHAR(n.value, '9999') AS "Bike Value"
FROM 
    donations n
    JOIN bikes b ON n.bike_id = b.bike_id
    JOIN donors d ON n.donor_id = d.donor_id
WHERE 
    n.value > 1500
ORDER BY 
    n.value DESC;
