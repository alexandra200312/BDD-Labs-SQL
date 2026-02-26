--sa se acorde un comision de 10% conducerii companiei
-- care nu a primit comision, dar presedintele sa nu primeasca
set SERVEROUTPUT on;

select 
        first_name || ' ' last_name,
        job_id
    from employees;
    

DECLARE
    nume varchar2(50);
    functie employees.employee_id%type;

BEGIN
    select 
        first_name || ' ' last_name,
        job_id
    into nume, functie
    from employees;
    dbms_output.put_line(nume || ' ' || functie); 
EXCEPTION
    when no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('ups');

END;