-- sa se introduca un nou employee, dar fara id

set SERVEROUTPUT on;

DECLARE
    insert_angajat EXCEPTION;
    PRAGMA exception_init(insert_angajat, -01400);
BEGIN
    INSERT INTO employees(first_name, last_name, hire_date, salary)
    VALUES('ION', 'Ionescu', '14-AUG-2020', 1450);
    
EXCEPTION
    when insert_angajat THEN
        DBMS_OUTPUT.PUT_LINE('nu se accepta inregistrari noi ' || ' in tabela employees fara id');
        DBMS_OUTPUT.PUT_LINE('Cod eroare sql ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Mesaj ' || SQLERRM);

END;