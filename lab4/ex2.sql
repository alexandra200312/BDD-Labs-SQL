set serveroutput on;


DECLARE
    salariu number;
BEGIN
    select salary into salariu
    from employees
    where employee_id = 100;
end; 
