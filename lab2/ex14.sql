set SERVEROUTPUT on;

DECLARE
    TYPE deptrecord IS RECORD (
        iddept number,
        numedept varchar2(30),
        idmanager number,
        locatie number
    );
    recdept deptrecord;
    deptinfo departments%rowtype;
BEGIN
    select *
    into deptinfo
    from departments
    where department_id = 10;

    recdept := deptinfo;

    dbms_output.put_line('Denumirea departamentului este ' 
                        || recdept.numedept 
                        || ' pentru id ul'
                        || recdept.iddept
    
    );
end;