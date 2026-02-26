-- sa se faca o lista cu angajatii care fac parte dintr-un departament specificat
-- au o anumita functie si au venit in companie la o data specificata
-- aceste data sunt transmise ca parametru unui cursor


set serveroutput on;

DECLARE
    CURSOR c_angajati(departmentID NUMBER, jobId char, hireDate DATE) IS
        SELECT department_id, hire_date, job_id, first_name || ' ' || last_name as name
        from employees
        where department_id = departmentID and upper(job_id) = upper(jobId) and hire_date > hireDate;
    
    angajat c_angajati%ROWTYPE;
 
BEGIN
    dbms_output.put_line('cursor 1');
    open c_angajati(20, 'MK_REP', '1-JUN-02');
    loop 
        fetch c_angajati into angajat;
        exit when c_angajati%NOTFOUND;

        dbms_output.put_line(rpad(angajat.department_id, 10) ||
                            rpad(angajat.name, 30) ||
                            rpad(angajat.job_id, 15) ||
                            lpad(angajat.hire_date, 20)    
        );

        



    end loop;
    close c_angajati;


end;