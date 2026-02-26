-- set serveroutput on;

-- DECLARE
--     TYPE  nested_table IS TABLE OF employees.salary%TYPE;
--     salariu nested_table;

-- BEGIN
--     select salary
--     bulk collect into salariu
--     from employees
--     where department_id = 80;
-- END;

set SERVEROUTPUT on;

declare
    TYPE nested_table is Table of employees.salary%type;
    salariu nested_table;
BEGIN
    select salary
    bulk collect into salariu
    from employees
    where department_id = 80;
end;