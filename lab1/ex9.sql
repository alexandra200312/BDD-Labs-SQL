-- sa se selecteze departamentul, numele, data angajarii
-- si comisionul unui angajat, folosind id de la tastatura
-- nu are dept => N/A

set SERVEROUTPUT on;

DECLARE
    nume_ang varchar2(50);
    nume_dept departments.department_name%type;
    data_ang date;
    com employees.COMMISSION_PCT%type;
    id employees.employee_id%type;
BEGIN
    SELECT first_name || ' ' || last_name, nvl(department_name, 'N/A'), hire_date, nvl(commission_pct,0)
    into nume_ang, nume_dept, data_ang, com
    from employees e left join departments d
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    where employee_id = &id;

    DBMS_OUTPUT.PUT_LINE(nume_ang || ' din departementul ' ||  nume_dept || ' cu comisionul ' ||  com || ' angajat in data ' ||  data_ang);

EXCEPTION
    when no_data_found then
        dbms_output.put_line('no data, sorry');
    when too_many_rows then
        dbms_output.put_line('too many rows...');

END;