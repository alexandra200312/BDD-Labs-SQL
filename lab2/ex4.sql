-- sa se calculeze impozitul pe salariu al unui angajat dupa algoritmul

set SERVEROUTPUT on;

DECLARE
    nume varchar2(50);
    ecuson employees.employee_id%type;
    functie employees.job_id%type;
    salariu employees.salary%type;
    max_salariu jobs.max_salary%type;
    min_salariu jobs.min_salary%type;
    impozit number;
BEGIN
    ecuson := &id;
    SELECT
        e.first_name || ' ' || e.last_name,
        e.job_id,
        e.salary,
        j.max_salary,
        j.min_salary
    into nume, functie, salariu, max_salariu, min_salariu
    from employees e join jobs j on e.job_id = j.job_id
    where e.employee_id = ecuson;

    -- if salariu = min_salary THEN
    --     impozit := 0.1 * salary;
    -- el
    <<mycase>>
    case salariu
        when min_salariu then impozit := salariu * 0.1;
        when max_salariu then impozit := salariu * 0.3; 
    ELSE
        impozit := salariu * 0.2;
    end case mycase; 

    dbms_output.put_line(nume || ' ' || salariu || ' ' || functie || ' ' || impozit || ' ' || max_salariu ||' ' || min_salariu);

end;