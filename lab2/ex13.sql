-- o lista cu nr de angajati care au veniturile mai mici de 
-- 4000 si mai mari de 4000 
-- pentru fiecare departament

set SERVEROUTPUT on;

declare
    contor integer := 0;
    contor1 number;
    contor2 number;
    suma1 number;
    suma2 number;
    numedept departments.department_name%type;
BEGIN
    dbms_output.put_line(Rpad('Nume departament', 20)
                        || Rpad('Nr sal mici', 20)
                        || Rpad('Suma sal mici', 20)
                        || Rpad('Nr sal mari', 20)
                        || Rpad('Suma sal mari', 20)
    );

    loop 
        BEGIN
            contor := contor + 10;
            suma1 := 0;
            suma2 := 0;
            contor1 := 0;
            contor2 := 0;

            select department_name
            into numedept 
            from departments
            where department_id = contor;

            select count(*), 
                sum(salary + nvl(commission_pct, 0) * salary)
            into contor1, suma1
            from employees
            where department_id = contor 
            and (salary + nvl(commission_pct, 0) * salary) < 4000;

            select count(*), 
                sum(salary + nvl(commission_pct, 0) * salary)
            into contor2, suma2
            from employees
            where department_id = contor 
            and (salary + nvl(commission_pct, 0) * salary) > 4000;

            dbms_output.put_line(Rpad(numedept, 20)
                                || Rpad(contor1, 20)
                                || Rpad(nvl(suma1, 0),20)
                                || Rpad(contor2, 20)
                                || Rpad(nvl(suma2, 0), 20)
            );

            if contor1 = 0
                and contor2 = 0 then 
                dbms_output.put_line('DEpartamentul ' || numedept || ' nu are angajati');
            end IF;
        EXCEPTION
            when no_data_found then 
                if contor > 260 then 
                    exit;
                else null;
                end if;
        end;

    end loop;           

end;