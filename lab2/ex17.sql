set SERVEROUTPUT on;

DECLARE
    TYPE tabindex
        IS TABLE OF departments%ROWTYPE INDEX BY BINARY_INTEGER;
    mytabindex tabindex;
    rowdept departments%rowtype;

BEGIN
    select * 
    into rowdept
    from departments
    where department_id = 10;

    mytabindex(1) := rowdept;

    select *
    into mytabindex(2)
    from departments
    where department_id = 20;

    dbms_output.put_line(Rpad('Id', 20)
                        || Rpad('Nume', 20)
                        || Rpad('Idlocatie', 20)
    );

    dbms_output.put_line(Rpad(mytabindex(1).department_id, 20)
                        || Rpad(mytabindex(1).department_name, 20)
                        || Rpad(mytabindex(1).location_id, 20)
    );

    dbms_output.put_line(Rpad(mytabindex(2).department_id, 20)
                        || Rpad(mytabindex(2).department_name, 20)
                        || Rpad(mytabindex(2).location_id, 20)
    );


END;