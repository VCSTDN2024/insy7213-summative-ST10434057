SET SERVEROUTPUT ON;

DECLARE
    v_status VARCHAR2(3);  -- Will store *, **, or ***

BEGIN
    FOR rec IN (
        SELECT 
            b.BIKE_ID,
            b.BIKE_TYPE,
            b.MANUFACTURER,
            d.VALUE AS BIKE_VALUE
        FROM BIKES b
        JOIN DONATIONS d ON b.BIKE_ID = d.BIKE_ID
        ORDER BY d.VALUE
    )
    LOOP
        -- Determine the status
        IF rec.BIKE_VALUE > 3000 THEN
            v_status := '***';
        ELSIF rec.BIKE_VALUE > 1500 THEN
            v_status := '**';
        ELSE
            v_status := '*';
        END IF;

        -- Display neatly aligned report (no space between R and amount)
        DBMS_OUTPUT.PUT_LINE(RPAD('BIKE ID:', 18) || rec.BIKE_ID);
        DBMS_OUTPUT.PUT_LINE(RPAD('BIKE TYPE:', 18) || rec.BIKE_TYPE);
        DBMS_OUTPUT.PUT_LINE(RPAD('MANUFACTURER:', 18) || rec.MANUFACTURER);
        DBMS_OUTPUT.PUT_LINE(
            RPAD('BIKE VALUE:', 18) || 
            'R' || TRIM(TO_CHAR(rec.BIKE_VALUE, 'FM999,999.00'))
        );
        DBMS_OUTPUT.PUT_LINE(RPAD('STATUS:', 18) || v_status);
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------');
    END LOOP;
END;
/

