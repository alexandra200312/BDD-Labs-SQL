-- sa se afisez numele si functia pentru un angajat al carui id este citit de la tastatura

set serveroutput ON

-- DECLARE
--     idemp number(6) := &id;
--     nume varchar2(50);
--     functie jobs.job_title%TYPE;
-- BEGIN
--     SELECT
--             first_name || ' ' || last_name, job_title
--     INTO
--         nume, functie
--     FROM
--         employees NATURAL JOIN jobs 
--     WHERE
--         employee_id = idemp;
--     dbms_output.put_line('Numele angajatului este : ' || nume || ' si are functia de: ' || functie);
-- EXCEPTION
--     WHEN no_data_found THEN
--         dbms_output.PUT_LINE('Nu am gasit nicio inregistrare pt id ul introdus');
-- END;

-- sa se insereze un nou angajat
/*
    se introduce de la tastatura un nou id de job,id ul angajatlui, nume si prenume
    data angL sysdate
    sal: 2123.85
    id managerului: cel al managerului care are cei mai multi ang cu job ul introdus de la tastatura
    daca sunt mai multi => se ia cel cu id ul cel mai mic

*/
define id = 1000
define fname = 'ion'
define lname = 'ionescu'
define jid = 'it_prog'

DECLARE 
    ecuson employees.EMPLOYEE_ID%TYPE := &id;
    jid employees.JOB_ID%TYPE := upper('&jid');
    mgr_id number(6);
BEGIN
    BEGIN
        select manager_id into mgr_id
        from employees where job_id = upper(jid)
        group by manager_id 
        having count(*) = (
                            select max(cnt) 
                            from (
                                select count(*) cnt from employees where job_id = jid group by manager_id
                            )
        ) order by manager_id 
        FETCH FIRST 1 ROW ONLY;
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('nu am gasit functia ' || jid);
    END;

    DECLARE 
        fname employees.FIRST_NAME%TYPE := ('&fname');
        lname employees.LAST_NAME%TYPE := ('&lname');
        email employees.EMAIL%TYPE;
        sal number(8,2) := 2123.85;
    BEGIN
        email := UPPER(substr(fname, 0, 1) || lname);
        INSERT INTO
        EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, EMAIL, HIRE_DATE, JOB_ID)
        VALUES(ecuson, initcap(fname), initcap(lname), sal, email, sysdate, jid); 
        DBMS_OUTPUT.PUT_LINE('adaugat cu succes');
    END;

    DECLARE
        comision employees.COMMISSION_PCT%TYPE := 0.5;
    
    BEGIN
        UPDATE EMPLOYEES
        SET COMMISSION_PCT = comision
        WHERE EMPLOYEE_ID = ecuson;
    END;

EXCEPTION 
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('A aparut eroarea ' || SQLERRM);

END;
/
-- STERGERE VARIABILA LA FINAL
undefine id
undefine fname
undefine lname
undefine jid

select * from employees where employee_id = 1000;
delete from employees where EMPLOYEE_ID = 1000;