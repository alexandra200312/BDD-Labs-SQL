-- folosire bulk collect into cu index-by table

set SERVEROUTPUT on;

DECLARE
    type tableindexat
        is table of departments%rowtype index by binary_integer;
    contor integer;
    tblindexat tableindexat;

BEGIN
    dbms_output.put_line('folosire bulk collect into index ny table');

    select * 
    bulk collect into tblindexat
    from departments;

    for contor in tblindexat.first .. tblindexat.last 
        loop
            dbms_output.put_line('contor=' 
                                ||contor
                                || ' tblIndexat.department='
                                || tblindexat(contor).department_id
                                || ' tblIndexat.departament_name='
                                || tblindexat(contor).department_name
                                || ' tblIndexat.location_id='
                                || tblindexat(contor).location_id
                                
                                );

        end loop;
end;
