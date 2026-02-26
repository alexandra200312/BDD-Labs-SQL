-- sa se listeze toti angajatii din tabela employees

set serveroutput on;

DECLARE
    type r_cursor is ref cursor;
    c_angajati r_cursor;

    angajat employees%rowtype;

BEGIN

    open c_angajati for select * from employees;
    LOOP
        fetch c_angajati into angajat;
        exit when c_angajati%NOTFOUND;
        dbms_output.put_line(angajat. first_name 
                            || ' '
                            ||angajat.last_name
                            || ' '
                            || angajat.JOB_ID
                            || ' '
                            || angajat.salary
        
        );

    end loop;
    close c_angajati;

end;