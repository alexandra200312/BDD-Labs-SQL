set SERVEROUTPUT on;

define id = 1000
define fname = 'ion'
define lname = 'ionescu'
define jid = 'it_prog'

DECLARE 
    jid employees.JOB_ID%TYPE := upper('&jid');
    mgr_id number(6);

BEGIN
    select manager_id into mgr_id
    from employees where job_id = upper(jid)
    group by manager_id
    having count(*) = (
                            select max(cnt) from 
                            (
                                select count(*) cnt from employees where job_id = jid group by manager_id
                            )
    )
    order by manager_id
    fetch first 1 rows only;

    DECLARE 
        fname employees.first_name%type := '&fname';
        lname employees.last_name%type := '&lname';
        email employees.email%type;
        ecuson employees.employee_id%type := &id;
        sal number(8,2) := 2123.85;
    BEGIN
        email := upper(substr(fname, 0, 1) || lname);
        INSERT INTO
        EMPLOYEES(employee_id, first_name, last_name, salary, email, HIRE_DATE, job_id)
        VALUES(ecuson, initcap(fname), initcap(lname), sal, email, sysdate, jid);

        DECLARE 
            comision employees.comision%type := 0.5;
        BEGIN
            UPDATE employees
            SET comision_pct = comision
            WHERE employee_id = ecuson;
        END;
    EXCEPTION
        When others THEN
            DBMS_OUTPUT.PUT_LINE('a aparut eroarea ' || SQLERRM);
    END; 

EXCEPTION
    WHen no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('nu am gasit functia ' || jid);

END;
/

undefine id
undefine lname
undefine fname
undefine jid

select * from employees where employee_id = 1000;
delete from employees where employee_id = 1000;