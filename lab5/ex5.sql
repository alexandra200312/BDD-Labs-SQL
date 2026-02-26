-- set SERVEROUTPUT on;


-- -- select d.department_name, d.manager_id, e.first_name || ' ' || e.last_name as name 
-- -- from departments d inner join employees e on e.department_id = d.DEPARTMENT_ID
-- -- where d.manager_id is not null and d.manager_id = e.manager_ID 

-- -- ;

-- DECLARE
--    nrgrupa1 number := 0;
--    nrgrupa2 number := 0;
--    nrang1 number := 0;
--    nrang2 number := 0;
--    numesef varchar2(50);
--    salariusef employees.SALARY%TYPE;
--    vechime number;


-- BEGIN
--     for sef in ( select distinct manager_id from departments where manager_id is not null)
--     loop 

--         nrgrupa1 := 0;
--         nrgrupa2:= 0;
--      --pt fiecare sef selectez nume, sal, depart
--         select first_name || ' ' || last_name, salary
--         into numesef, salariusef
--         from EMPLOYEES where EMPLOYEE_ID = sef.manager_id;

--         for angajat in (select distinct employee_id
--                                 from employees 
--                                 where employees.MANAGER_ID = sef.manager_id
--                                 )
--             LOOP

--                 select trunc(months_between(hire_date, sysdate)/12) into vechime from EMPLOYEES
--                 where angajat.employee_id = EMPLOYEE_ID;

--                 if vechime < 31 then 
--                     nrgrupa1 := nrgrupa1 + 1;
--                 else nrgrupa2 := nrgrupa2 + 1;
--                 end if;
                


--             end loop;

     
    

--         for angajat in (select distinct first_name || ' ' || last_name fullnume, 
--                                         trunc(months_between(hire_date, sysdate)) vechime
--                                         from EMPLOYEES
--                                         where manager_id = sef.manager_id) LOOP


--         distributie(salsef, angajat.vechime, nrang1, nrang2, )
        
--         end loop;
--     end loop;

-- end;