-- sa se afiseze inf despre ultimul angajat care a venit in firma
-- in anul 2001

set SERVEROUTPUT on;

DECLARE
    nume_ang varchar2(20);
    functie string(30);
    max_data date;
    start_date date := '1-JAN-2001';
    end_date date := '31-DEC-2001';
BEGIN
    select 
        first_name || ' ' || last_name,
        job_id
    into nume_ang, functie
    from employees 
    where hire_date = (
                        select max(hire_date) from employees
                        where hire_date between start_date and end_date
                     );
    DBMS_OUTPUT.PUT_LINE(nume_ang || ' cu functia de ' || functie || ' este ultimul angajat din 2001.');

EXCEPTION
    when no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('no data, sorry');

END;