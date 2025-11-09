-- FUNCTION: fn_TotalDonationValue
-- PURPOSE: Calculates the total donation value (including 15% VAT)
--          for a specific donor, identified by their Donor ID.
-- PARAMETERS: 
--      p_donor_id (IN) – The donor’s ID.
-- RETURNS:
--      The total donation amount (including VAT) for that donor.

CREATE OR REPLACE FUNCTION fn_TotalDonationValue(p_donor_id IN VARCHAR2)
RETURN NUMBER
IS
    v_total_value   NUMBER := 0;
    v_vat           CONSTANT NUMBER := 0.15;  -- 15% VAT rate
BEGIN
    -- Calculate the total value including VAT for the given donor
    SELECT NVL(SUM(d.VALUE + (d.VALUE * v_vat)), 0)
    INTO v_total_value
    FROM DONATIONS d
    WHERE d.DONOR_ID = p_donor_id;

    RETURN v_total_value;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('⚠️ No donations found for donor ID: ' || p_donor_id);
        RETURN 0;

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('❌ Unexpected error: ' || SQLERRM);
        RETURN 0;
END;
/
SET SERVEROUTPUT ON;

DECLARE
    v_result NUMBER;
BEGIN
    -- Run the function for a specific donor ID
    v_result := fn_TotalDonationValue('DID12');  -- change to one that exists in your data

    -- Handle case when result is 0 or NULL
    IF v_result = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No donation records found for this donor.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The total donation value (incl. VAT) for Donor DID12 is: R' || TO_CHAR(v_result, '999,999.00'));
    END IF;
END;
/


-- COMMENTs:
-- 1. This function simplifies repeated calculations by allowing the users 
--    to easily obtain a donor’s total donation including the VAT.
-- 2. It enhances the code reusability, improves accuracy, and reduces 
--    human error in manual calculations.
