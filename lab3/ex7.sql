-- pt un ide de ang dat de la tastatura si care nu are comision\
-- sa se def o eroare in momentul generarii exceptiei si care are codul de eroare -20100

set SERVEROUTPUT on;

DECLARE
    ecuson employees.employee_id%type;
    comision employees.commission_pct%type;
    lipsaComision EXCEPTION;
    PRAGMA init_exception(lipsaComision, -20100);

BEGIN
    ecuson := &ecuson;
    select commission_pct into comision
    from employees 
    where employee_id = ecuson;

    if comision is NULL then
        RAISE_APPLICATION_ERROR(-20100, 'Angajatul nu are comision');
    end if;
EXCEPTION
    when lipsaComision THEN
        DBMS_OUTPUT.PUT_LINE('ang cu id ' || ecuson);
        DBMS_OUTPUT.PUT_LINE('cod eroare sql' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('cod eroare sql' || SQLERRM);


END;
