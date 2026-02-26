-- verificare pt un an introdus de la tastatura
-- daca exista o angajare -> mesaj
-- no_data_found -> 
-- too_many_rows -> 

set SERVEROUTPUT on;

DECLARE
    nume_ang varchar2(45);
    functie jobs.job_title%type;
    an number(4) := &an;
    angajari number;

BEGIN
    SELECT COUNT(*) into angajari
    from employees natural join jobs where extract(year from hire_date) = an;

    select first_name || ' ' || last_name, job_title 
    into nume_ang, functie 
    from employees natural join jobs 
    where extract(year from hire_date) = an;

    DBMS_OUTPUT.PUT_LINE('s-au realizat ' || angajari || ' in anul ' || an);

EXCEPTION
    WHEN no_data_found then
        dbms_output.PUT_LINE('nu exista angajari in anul' || an);
    WHEN too_many_rows then
        dbms_output.put_line('au fost mai multe angajari in anul ' || an );
END;

