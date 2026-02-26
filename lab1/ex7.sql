-- un angajat care are vechimes de 19 ani si 5 luni in firma

set SERVEROUTPUT on;

DECLARE
    nume_ang varchar2(50);
    functie jobs.job_title%type;
    data date;
    vechime interval year(2) to month;

BEGIN
    vechime := interval '19-5' year to month;
    DBMS_OUTPUT.PUT_LINE('vechime solicitate' || vechime);

    select hire_date into data from employees 
    where hire_date < sysdate - vechime
    order by HIRE_DATE
    fetch first 1 row only;


    DBMS_OUTPUT.PUT_LINE('data maxima' || data);

    select 
        first_name || last_name,
        job_title
    into nume_ang, functie 
    from employees natural join jobs 
    where hire_date = data;
    

    DBMS_OUTPUT.PUT_LINE('anagajatul cu vechimea cautata este: ' || nume_ang || ' cu functia de ' || functie);


EXCEPTION
    when no_data_found then 
        DBMS_OUTPUT.put_line('no data, sorry');
    when too_many_rows then
        DBMS_OUTPUT.put_line('too many rows, sorry');
END;