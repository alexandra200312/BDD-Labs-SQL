set SERVEROUTPUT on;

-- id citit de la tastatura
-- afiseaza numele, functia, dep, locatia dep
-- locatia va cuprinde orasul, statul/judetul, tara, regiunea

DECLARE
    prenume_ang employees.first_name%type;
    nume_ang employees.last_name%type;
    venit employees.salary%type;
    id_dept employees.department_id%type;
    dept_row departments%rowtype;
    location_row locations%rowtype;
    country_row countries%rowtype;
    region_row regions%rowtype;
BEGIN
    SELECT department_id, first_name, last_name, salary + nvl(COMMISSION_PCT, 0) * salary
    INTO
        id_dept, prenume_ang, nume_ang, venit
    FROM
    employees 
    where employee_id = &id;

    SELECT d.*
    INTO
    dept_row
    from departments d
    where department_id = id_dept;

    SELECT l.*
    INTO location_row
    from locations l
    where l.location_id = dept_row.location_id;

    SELECT c.*
    into country_row
    from countries c
    where c.country_id = location_row.country_id;

    SELECT r.*
    into region_row
    from regions r
    where r.region_id = country_row.region_id;

    DBMS_OUTPUT.PUT_LINE(prenume_ang || ' ' || nume_ang || ' face parte din departamentul ' || dept_row.department_name
    || ' din ' || location_row.city || ', ' || location_row.state_province || ', ' || country_row.country_name || ', ' || region_row.region_name
    );

EXCEPTION
    when no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('no data, sorry');
    when too_many_rows then 
        DBMS_OUTPUT.PUT_LINE('too many rows, sorry');

END;
/