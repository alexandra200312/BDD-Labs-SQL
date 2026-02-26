set SERVEROUTPUT on;

-- lista cu daat angajarii si veniturile
-- ang care fac parte dintr-un dept
--specificat

DECLARE
    deptid integer;
    contor integer := 100;
    numeangajat varchar2(30);
    venit number(10);
    dataangajare date;
    numedepartament departments.department_name%type;
    
BEGIN
    deptid := &iddept;

    select department_name
    into numedepartament
    from departments
    where department_id = deptid;

    dbms_output.Put_line(Rpad('Nume', 30, '=') ||
                        Rpad('Data angajare', 15, '=')
                        || Lpad('Venit', 10, '='));

    LOOP 
        contor := contor + 1;

        BEGIN
            select 
                first_name || ' ' || last_name,
                hire_date,
                salary + (nvl(commission_pct, 0) * salary)
            into numeangajat, dataangajare, venit
            from employees
            where department_id = deptid
                and employee_id = contor;
            
            dbms_output.Put_line(Rpad(numeangajat, 30, '=')
                                || Rpad(dataangajare, 15, '=')
                                || Lpad(venit, 10, '=')

            );

            EXCEPTION
                when no_data_found THEN
                    null;
            end;

            exit when contor = 206;
    end loop;


EXCEPTION
    when no_data_found THEN
        dbms_output.put_line('nu sunt angajati in dep');

end;

