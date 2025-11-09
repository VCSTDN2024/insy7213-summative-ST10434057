CREATE OR REPLACE TRIGGER trg_prevent_donation_delete
BEFORE DELETE ON donations
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Deletion not allowed: Donations cannot be removed from the system.');
END;
/
DELETE FROM donations WHERE donation_id = 1;
-- Q9.1 Trigger Explanation:
-- This BEFORE DELETE trigger prevents accidental or intentional deletion 
-- of donation records, ensuring data integrity and auditability.