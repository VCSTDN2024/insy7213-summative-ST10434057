DECLARE
    v_vat CONSTANT NUMBER := 0.15; -- VAT constant (15%)
BEGIN
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');

    FOR rec IN (
        SELECT 
            b.DESCRIPTION AS BIKE_DESCRIPTION,
            b.MANUFACTURER AS BIKE_MANUFACTURER,
            b.BIKE_TYPE,
            d.VALUE AS VALUE_AMOUNT,
            (d.VALUE * v_vat) AS VAT_AMOUNT,
            (d.VALUE + (d.VALUE * v_vat)) AS TOTAL_AMOUNT
        FROM BIKES b
        JOIN DONATIONS d ON b.BIKE_ID = d.BIKE_ID
        WHERE b.BIKE_TYPE = 'Road Bike'
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('BIKE DESCRIPTION: ' || rec.BIKE_DESCRIPTION);
        DBMS_OUTPUT.PUT_LINE('BIKE MANUFACTURER: ' || rec.BIKE_MANUFACTURER);
        DBMS_OUTPUT.PUT_LINE('BIKE TYPE: ' || rec.BIKE_TYPE);
        DBMS_OUTPUT.PUT_LINE('VALUE: R' || TO_CHAR(rec.VALUE_AMOUNT, '999G999D00'));
        DBMS_OUTPUT.PUT_LINE('VAT: R' || TO_CHAR(rec.VAT_AMOUNT, '999G999D00'));
        DBMS_OUTPUT.PUT_LINE('TOTAL AMNT: R' || TO_CHAR(rec.TOTAL_AMOUNT, '999G999D00'));
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');
    END LOOP;
END;
/

