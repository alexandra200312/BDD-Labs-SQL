-- folosire bulk collect into

set SERVEROUTPUT on;

declare
    TYPE vector is varray(28) of departments.department_id%type;
    myvector vector;
    contor integer;

BEGIN
    dbms_output.put_line('folosire bulk collect into varray');

    select department_id
    bulk collect into myvector
    from departments;

    for contor in myvector.first .. myvector.last loop
        dbms_output.put_line('Myvector(' ||contor||')='||Myvector(contor));
    end LOOP;

end;
