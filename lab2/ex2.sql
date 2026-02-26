-- -- sa se acorde un comision de 10% din sal ang care au o vechime de cel putin 15 ani

-- DECLARE
--     nume_ang varchar2(50);
--     functie jobs.JOB_TITLE%type;
--     data_ang date;
--     ecuson employees.employee_id%type;
--     vechime int;
-- BEGIN
--     select 
--         first_name || ' ' || last_name,
--         job_title, 
--         hire_date
--     into nume_ang, functie, data_ang
--     from employees natural join jobs
--     where employee_id = ecuson;

--     vechime := round(sysdate - data_ang, 2);
--     DBMS_OUTPUT.PUT_LINE(vechime || ' ' || data_ang);


-- EXCEPTION
--     when no_data_found then
--         DBMS_OUTPUT.PUT_LINE('no data found, sorry');
--     when too_many_rows then
--         dbsm_output.put_line('too many rows');

-- END;

set serveroutput on;
-- -- sa se acorde un comision de 10% din sal ang care au o vechime de cel putin 15 ani

DECLARE
    ecuson employees.employee_id%type := &id;
    nume varchar2(50);
    vechime number;
    data_angajare date;
    comision employees.commission_pct%type;

BEGIN
    select
        first_name || ' ' || last_name,
        hire_date, 
        nvl(commission_pct, 0)
    into
        nume, data_angajare, comision
    from employees
    where employee_id = ecuson;

    vechime := round(months_between(sysdate,data_angajare)/12, 2);
    dbms_output.put_line(nume || ' ' || vechime || ' ' || comision );

    if vechime >= 15 then
        update employees
        set commission_pct = nvl(commission_pct, 0) + 0.1
        where employee_id = ecuson;

        comision := comision + 0.1;
        commit;

        dbms_output.put_line(nume || ' ' || vechime || ' ' || comision );
    end if;

EXCEPTION
    when no_data_found then
        dbms_output.put_line('ups');
END;
/
