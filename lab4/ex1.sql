SET serveroutput ON;

DECLARE 
    salariu NUMBER;
BEGIN
    SELECT salary 
    into salariu
    from employees
    where department_id = 80;
end;