-- set serveroutput on;

-- DECLARE
--     CURSOR c_angajati IS
--         select d.department_name, e.employee_id,
--             e.first_name || ' ' || e.last_name as name,   
--             e.salary, e.hire_date
--             from employees e inner join departments d on e.department_id = d.department_id
--             where hire_date like '%03'
--             order by hire_date;
--     v_angajat c_angajati%ROWTYPE;
-- BEGIN
--     OPEN c_angajati;
--     loop
--         fetch c_angajati into v_angajat;
--         exit when c_angajati%NOTFOUND;

--         DBMS_OUTPUT.PUT_LINE(v_angajat.department_name || ' ' ||
--                             v_angajat.employee_id || ' ' || 
--                             v_angajat.name || ' ' || 
--                             v_angajat.salary || ' ' ||
--                             v_angajat.hire_date 
        
--         );
--     END LOOP;
--     close c_angajati;


-- END;

-- sa se declare un cursor care selecteaza denumirea dept,
-- numele angajatului, salariul si data angajarii
-- pentru acei ang care au venit in anul 2003

set SERVEROUTPUT on;

DECLARE
    CURSOR c_angajati IS
        select d.department_name, e.employee_id,
            e.first_name || ' ' || e.last_name as name, e.salary,
            e.hire_date
            from employees e inner join departments d on e.department_id = d.department_id
            where hire_date like '%03'
            order by hire_date;
    v_angajat c_angajati%rowtype;
BEGIN

    open c_angajati;
    LOOP
        fetch c_angajati into v_angajat;
        exit when c_angajati%NOTFOUND;

        dbms_output.put_line(v_angajat.department_name || ' ' ||
                            v_angajat.employee_id || ' ' ||
                            v_angajat.name || ' ' ||
                            v_angajat.salary || ' ' ||
                            v_angajat.hire_date
        
        );

    end loop;
    close c_angajati;

end;