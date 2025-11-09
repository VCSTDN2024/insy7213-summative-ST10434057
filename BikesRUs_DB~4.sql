--View to show donor details for those assisted by volunteer 'vol105'
CREATE OR REPLACE VIEW vwBikeRUS AS
SELECT 
    d.donor_fname || ', ' || d.donor_lname AS donor_name,
    d.contact_no AS contact_no,
    b.bike_type AS bike_type,
    TO_CHAR(n.donation_date, 'DD/MON/YY') AS donation_date
FROM donors d
JOIN donations n ON d.donor_id = n.donor_id
JOIN bikes b ON n.bike_id = b.bike_id
WHERE n.volunteer_id = 'vol105';

SELECT * FROM vwBikeRUS;

/*
My justification for using a View:
1. It simplifies complex queries, because the users can access combined data from multiple tables 
   without needing to write long JOIN statements each time.
2. It Enhances security, Sensitive data (e.g., donor emails) can be hidden by only
   exposing selected columns through the view.

These benefits help BikeRUs streamline reporting while protecting confidential data.
*/
