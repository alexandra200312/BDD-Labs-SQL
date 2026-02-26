-- id de la tastatura
-- pt functia FI_MGR, daca nu are comision, sa i se adauge unul de 10%

-- DECLARE
--     nume_ang varchar2(50);
--     functie jobs.JOB_TITLE%TYPE;
--     comision employees.COMMISSION_PCT%TYPE;
--     ecuson employees.EMAIL%TYPE := &id;

-- BEGIN
--     select 
--         first_name || ' ' || last_name,
--         JOB_TITLE,
--         COMMISSION_PCT
--     into nume_ang, functie, comision
--     from EMPLOYEES natural join jobs 
--     where employee_id = ecuson;

--     IF upper(functie) = 'FI_MGR'
--         AND (comision IS NULL OR comision = 0) then
--         UPDATE EMPLOYEES
--         SET COMMISSION_PCT = 0.1
--         WHERE EMPLOYEE_ID = ecuson;
--     END IF;
    
--     DBMS_OUTPUT.PUT_LINE(nume_ang || ' are comisionul modificat. ' || comision);

-- EXCEPTION
--     when no_data_found then
--         dbms_output.put_line('no data found, sorry');
--     when too_many_rows then
--         dbms_output.put_line('too many rows, sorry');
-- END;

set serveroutput on;

DECLARE
    nume varchar2(50);
    comision employees.commission_pct%type;
    functie employees.job_id%type;
    ecuson employees.employee_id%type := &id;


BEGIN
    select first_name || ' ' || last_name, job_id, commission_pct
    into nume, functie, comision
    from employees
    where employee_id = ecuson;

    if upper(functie) = 'FI_MGR' and (comision = 0 or comision is null) THEN
        update employees
        set commission_pct = 0.1
        where employee_id = ecuson;


        -- DBMS_OUTPUT.PUT_LINE(nume || ' ' || comision || ' ' || functie);
        dbms_output.put_line(nume || ' ' || comision || ' ' || functie);
    end if;

EXCEPTION
    when no_data_found then
        dbms_output.put_line('ups'); 
        

END;