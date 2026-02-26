--sa se scrie o procedura nestocata care utlizeaza un cursor 
-- pt care calculeaza numarul de zile de concediu pentru tot angajatii
--astfel
-- manageri de departament
-- vechime < 13 ani => 20de zile 
-- vechime >= 13 22 de zile
-- angajatii care nu sunt sefi
-- vechime < 13 => 15 zile
-- vechime >= 13 => 
-- 


set serveroutput on;

DECLARE
    procedure concediu
    as
        cursor c_concediu is 
            select * from employees
            where department_id is not null
            order by department_id;
        randconcediu c_concediu%rowtype;
        type r_concediu is record (
            numedept departments.department_name%type,
            numeang varchar2(50),
            dataang employees.hire_date%type,
            sef varchar2(2),
            anivechime number,
            zileconcediu number
        );

        concediu r_concediu;

        manager employees.manager_id%type;
        BEGIN
            open c_concediu;
            loop 
                fetch c_concediu into randconcediu;
                exit when c_concediu%NOTFOUND;

                select department_name 
                into concediu.numedept
                from departments
                where department_id = randconcediu.department_id;


                concediu.dataang := randconcediu.hire_date;
                concediu.numeang := randconcediu.first_name
                                || ' ' || randconcediu.last_name;

                concediu.anivechime := trunc(months_between(sysdate, randconcediu.hire_date));

                BEGIN
                    select manager_id
                    into manager
                    from employees
                    where manager_id = randconcediu.employee_id;

                    concediu.sef := 'DA';
                EXCEPTION
                    when no_data_found then 
                        concediu.sef := 'NU';
                    when too_many_rows then
                        concediu.sef := 'DA';

                END;


                if concediu.anivechime < 13 
                    and concediu.sef = 'DA' then
                        concediu.zileconcediu := 20;
            
                elsif concediu.anivechime >= 13 and concediu.sef = 'DA' then
                    concediu.zileconcediu := 22;
                elsif concediu.anivechime < 13 and concediu.sef = 'NU' then
                    concediu.zileconcediu := 15;
                else 
                    concediu.zileconcediu := 17;
                end if;

                dbms_output.put_line(rpad(concediu.numedept, 20) 
                                    || rpad(concediu.numeang, 20)
                                    || rpad(concediu.sef, 20)
                                    || rpad(concediu.anivechime, 20)
                                    || rpad(concediu.zileconcediu, 20)
                                    
                                    );
                                    
                                    
                                    
            end loop;
        end;
BEGIN
    concediu();
END;