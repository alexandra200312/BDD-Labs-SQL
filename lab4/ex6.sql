set serveroutput on;


DECLARE
    CURSOR c_angajati IS
        select e.job_id, e.first_name || ' ' || last_name as name,
            e.salary + nvl(commission_pct, 0) * salary as venit
        from employees e
        where upper(e.job_id )like '%MGR' or upper(e.JOB_ID) like '%MAN' or upper(e.JOB_ID) like '%PRES';
    v_angajat c_angajati%rowtype;
        

BEGIN
    -- open c_angajati;

    -- LOOP
    --     fetch c_angajati into v_angajat;
    --     exit when c_angajati%notfound;

    --     dbms_output.put_line(v_angajat.name || ' ' || v_angajat.job_id || ' ' || v_angajat.venit);

    -- end loop;
    -- close c_angajati;

    for v_angajat in c_angajati 
    LOOP
        dbms_output.put_line(v_angajat.name || ' ' || v_angajat.job_id || ' ' || v_angajat.venit);

    end loop;
    

end;