CREATE OR REPLACE TRIGGER trg_validate_donation_value
BEFORE UPDATE OF value ON donations
FOR EACH ROW
BEGIN
    IF :NEW.value <= 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Invalid update: Donation value must be greater than 0.');
    END IF;
END;
/

--Invadlid Values
UPDATE donations
SET value = -500
WHERE donation_id = 2;

--Valid Values
UPDATE donations
SET value = 1800
WHERE donation_id = 2;


-- Q9.2 Trigger Explanation:
-- This BEFORE UPDATE trigger enforces data validation by preventing 
-- donation value updates to invalid (zero or negative) amounts.