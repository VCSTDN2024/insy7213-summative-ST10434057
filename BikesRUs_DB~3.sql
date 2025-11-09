DECLARE
    v_vat CONSTANT NUMBER := 0.15; -- VAT constant (15%)
    v_label_width CONSTANT NUMBER := 18; -- label spacing
BEGIN
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
        DBMS_OUTPUT.PUT_LINE(RPAD('BIKE DESCRIPTION:', v_label_width) || rec.BIKE_DESCRIPTION);
        DBMS_OUTPUT.PUT_LINE(RPAD('MANUFACTURER:', v_label_width) || rec.BIKE_MANUFACTURER);
        DBMS_OUTPUT.PUT_LINE(RPAD('TYPE:', v_label_width) || rec.BIKE_TYPE);

        -- Clean alignment without space between 'R' and value
        DBMS_OUTPUT.PUT_LINE(RPAD('VALUE:', v_label_width) || 'R' || TO_CHAR(rec.VALUE_AMOUNT, 'FM9990.00'));
        DBMS_OUTPUT.PUT_LINE(RPAD('VAT:', v_label_width) || 'R' || TO_CHAR(rec.VAT_AMOUNT, 'FM9990.00'));
        DBMS_OUTPUT.PUT_LINE(RPAD('TOTAL AMNT:', v_label_width) || 'R' || TO_CHAR(rec.TOTAL_AMOUNT, 'FM9990.00'));

        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');
    END LOOP;
END;
/
