-- sa se faca o lista cu toate departamentele

set serveroutput on;

DECLARE
    type r_cursor is ref cursor;
    c_departamente r_cursor;

    departament departments.department_name%type;

BEGIN

    open c_departamente for select department_name from departments;
    loop
        fetch c_departamente into departament;
        exit when c_departamente%NOTFOUND;

        dbms_output.put_line(departament);
    end loop;
    close c_departamente;

end;
