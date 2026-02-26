set serveroutput on;

DECLARE 
    TYPE myrecord is RECORD (
        iddepartament departments.department_id%type,
        numedept departments.department_name%type,
        idmanager departments.manager_id%type,
        idlocatie departments.location_id%type);
    deptrecord myrecord;
    deptrecordx myrecord;
    deptrecordupdate myrecord;
    deptrecordinsert myrecord;
BEGIN
    deptrecordinsert.iddepartament :=8001;
    deptrecordinsert.numedept := 'IT DEPARTMENT';
    deptrecordinsert.idlocatie := 1700;
    deptrecordinsert.idmanager := NULL;

    insert into departments
    values (
                deptrecordinsert.iddepartament, 
                deptrecordinsert.numedept,
                deptrecordinsert.idmanager, 
                deptrecordinsert.idlocatie
    );


    select * 
    into deptrecord
    from departments
    where department_id = deptrecordinsert.iddepartament;

    dbms_output.Put_line('informatii dupa insert'
                        || deptrecord.iddepartament
                        || ' '
                        || deptrecord.numedept
                        || ' '
                        || deptrecord.idmanager
                        || ' '
                        || deptrecord.idlocatie
    );




END;