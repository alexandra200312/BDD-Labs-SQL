--

set SERVEROUTPUT on;

DECLARE
    idDepartament NUMBER;
    numeDepartament departments.DEPARTMENT_NAME%TYPE;

BEGIN
    idDepartament := &idDepartament;
    select DEPARTMENT_NAME into numeDepartament 
    from DEPARTMENTS
    where DEPARTMENT_ID = idDepartament;
    DBMS_OUTPUT.PUT_LINE(numeDepartament || ' ' || idDepartament);
EXCEPTION
    when no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('nu exista dept pt id ul ' || idDepartament );
END;