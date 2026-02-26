-- acelasi ex ca la 8, doar ca rezolvat cu for


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

    for contor in 100 .. 206
    loop
        BEGIN
            select first_name || ' ' || last_name, 
                hire_date,
                salary + nvl(commission_pct, 0) * salary
            into numeangajat, dataangajare, venit
            from employees
            where employee_id = contor and department_id = deptid;

            dbms_output.Put_line(Rpad(numeangajat, 30, '=')
                                || Rpad(dataangajare, 15, '=')
                                || Lpad(venit, 10, '=')

            );
        EXCEPTION
            when no_data_found THEN
                null;
        end;
    end loop;


EXCEPTION
    when no_data_found then
        dbms_output.put_line('no data found');
END;