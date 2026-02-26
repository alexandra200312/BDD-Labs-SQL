-- as se modifica comisionul cu 10% din salariu pt angajatii
-- care au peste 18 ani vechime in companie


set SERVEROUTPUT on;

DECLARE
    cursor c_angajati is 
        select d.department_name, e.employee_id, e.commission_pct, e.hire_date, e.salary,
            e.first_name || ' ' || e.last_name as name
        from employees e inner join departments d on d.department_id = e.department_id
        for update of commission_pct;
    angajat c_angajati%rowtype;

    comision_nou NUMBER default 0;

BEGIN

    open c_angajati;
    LOOP
        fetch c_angajati into angajat;
        exit when c_angajati%NOTFOUND;

        if add_months(angajat.hire_date, 216) < SYSDATE then 
            comision_nou := nvl(angajat.commission_pct, 0) + 0.1;
            update employees set commission_pct = comision_nou
            where current of c_angajati;
        end if;

    end loop;
    close c_angajati;

END;