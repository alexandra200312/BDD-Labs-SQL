-- folosind cursor, liosta cu veniturile managerilor din companie


-- set serveroutput on;

-- DECLARE
--     CURSOR c_angajati IS
--         select d.department_name, e.employee_id,
--             e.first_name ||  ' ' || e.last_name as name, e.salary, e.commission_pct
--         from employee e inner join departments d on d.department_id = e.department_id
--         where 
--             upper(e.job_id) like '%MGR' or
--             upper(e.job_id) like '%MAN' or
--             upper(e.job_id) like '%PRES';
--     angajat c_angajati%ROWTYPE; 
--     venit number := 0;

-- BEGIN
--     OPEN c_angajati;

--     DBMS_OUTPUT.PUT_LINE(
--         rpad('Ecuson', 10) ||
--         rpad('Nume', 30) ||
--         rpad('Departament', 20) ||
--         rpad('venit', 10)
--     );

--     DBMS_OUTPUT.PUT_LINE(
--         rpad('=', 10, '=') ||
--         rpad('=', 30, '=') ||
--         rpad('=', 20, '=') ||
--         rpad('=', 10, '=')
--     );

--     LOOP
--         fetch c_angajati into angajat;
--         exit when  c_angajati%NOTFOUND;

--         VENIT := round(anagajat.salary + nvl(angajat.commission_pct, 0) * angajat.salary);


--     end loop;

-- end;


set serveroutput on;


DECLARE
    CURSOR c_angajati IS
        select e.job_id, e.first_name || ' ' || last_name as name,
            e.salary + nvl(commission_pct, 0) * salary as venit
        from employees e
        where upper(e.job_id )like '%MGR' or upper(e.JOB_ID) like '%MAN' or upper(e.JOB_ID) like '%PRES';
    v_angajat c_angajati%rowtype;
        

BEGIN
    open c_angajati;

    LOOP
        fetch c_angajati into v_angajat;
        exit when c_angajati%notfound;

        dbms_output.put_line(v_angajat.name || ' ' || v_angajat.job_id || ' ' || v_angajat.venit);

    end loop;
    close c_angajati;
    

end;