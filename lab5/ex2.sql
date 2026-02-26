-- sa se scrie o procedura in cadrul unui bloc
-- care intoarce salariul macim pentru un ID de departament
-- si o functie introduse de la tastatura
-- salariul maxim sa fie returnat folosindu se o 
-- variabila scalara 
-- sa se traduca joburile in limba romana

set serveroutput on;

-- 

declare 
    numedepartament departments.department_name%type;
    iddept employees.department_id%type := '&iddept';

    procedure salariu(
                    deptid in number,
                    functie in out varchar2,
                    salariumaxim out number
    ) is
        salmax number; 
    BEGIN
        select max(salary)
        into salmax
        from employees
        where department_id = deptid and lower(job_id) = lower(functie)
        group by department_id;

        salariumaxim := salmax;

        functie := CASE 
                    WHEN (upper(functie) = 'FI_ACCOUNT') THEN 'contabil'
                    WHEN (upper(functie) = 'IT_PROG') THEN 'programator'
                    when (upper(functie) like '%_CLERK') then 'functionar'
                    when (upper(functie) = 'AD_PRES') then 'presedinte'
                    when (upper(functie) like '%_MAN') then 'manager'
        end;
    EXCEPTION
        when no_data_found THEN
            dbms_output.put_line('nu a fost gasita nicio inregistrare.');

    end salariu;

BEGIN
    DECLARE
        functie varchar(40) := '&numeFunctie';
        salmax NUMBER;
    BEGIN
        select department_name
        into numedepartament
        from departments
        where department_id = iddept;

        SALARIU(iddept, functie, salmax);

        dbms_output.put_line(numedepartament || ' ' ||
                             functie || ' ' ||
                             salmax   
        );

    EXCEPTION
        when no_data_found then
            dbms_output.put_line('departament inexistent.');    
    end;
end;