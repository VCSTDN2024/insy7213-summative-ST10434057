CREATE OR REPLACE PROCEDURE spDonorDetails(p_bike_id IN VARCHAR2) IS
    -- Declare variables to store fetched values
    v_donor_fname   donors.donor_fname%TYPE;
    v_donor_lname   donors.donor_lname%TYPE;
    v_contact_no    donors.contact_no%TYPE;
    v_vol_fname     volunteers.vol_fname%TYPE;
    v_bike_desc     bikes.description%TYPE;
    v_donation_date donations.donation_date%TYPE;

    -- Custom exception for when no data is found
    e_no_data_found EXCEPTION;

BEGIN
    -- Select query to fetch donor, volunteer, and bike details
    SELECT d.donor_fname, d.donor_lname, d.contact_no, 
           v.vol_fname, b.description, n.donation_date
    INTO   v_donor_fname, v_donor_lname, v_contact_no, 
           v_vol_fname, v_bike_desc, v_donation_date
    FROM donations n
    JOIN donors d ON n.donor_id = d.donor_id
    JOIN volunteers v ON n.volunteer_id = v.vol_id
    JOIN bikes b ON n.bike_id = b.bike_id
    WHERE n.bike_id = p_bike_id;

    -- Display the formatted output message
    DBMS_OUTPUT.PUT_LINE(
        'ATTENTION: ' || v_donor_fname || ' ' || v_donor_lname ||
        ' assisted by: ' || v_vol_fname ||
        ', donated the ' || v_bike_desc ||
        ' on the ' || TO_CHAR(v_donation_date, 'DD/MON/YY')
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No record found for Bike ID: ' || p_bike_id);

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);

END spDonorDetails;
/
SET SERVEROUTPUT ON;
EXEC spDonorDetails('B004');
/*
Explanation of Exception Handling:
1. The NO_DATA_FOUND exception ensures that if no donation exists for the
   specified Bike ID, a user-friendly message is displayed instead of an error.
2. The OTHERS exception catches any unexpected database errors, preventing
   the program from crashing and aiding debugging.
This improves the reliability and user experience of the procedure.
*/
