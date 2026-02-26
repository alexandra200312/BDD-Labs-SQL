

-- -- 1. join cu departaments
-- -- 2. nume persoana: sau employyes sau job_history join employees
-- -- 3. grila maxima salariala: join cu jobs
-- -- pt restul ca la 2..toata lista, extragem prima persoana, restul coloana 2

-- istoriic -> grila maxima (join intre istoric si employees) -> grupat
-- employee_id, job_id, depratent_is -> restul  + max_salary/min_salary

-- -- Ar trebui sa plecam de la departamente

-- -- distinct ca sa nu imi faca cardinalitate


-- select department_id, department_name
-- from job_history;

-- BEGIN

--     for cursor_schimbari
--      in (select employee_id, job_id, department_id
--                         from job_history h join departments d  on d.department_id =  h.department_id
--                         )-- dupa id)

--     loop
--         for angajat in (select e. first_name || ' ' || e.last_name as full_name,
--         (j.max_salary - j.min_salary) / j.min_salary as rate_ratio
--         from employees e join jobs j on e.job_id = j.job_id
--         where e.department_id  = cursor
--         )
--         dbms_output.put_line(employee_id || '-' || cursor.job_id || '-' || cursor.department_id)

--     end loop;

-- end;
-- !! facem un union la from employees
-- !! max si minim 

-- max

-- !! functii de agregare sunt insotite de group by: cazul nostru 

-- !! join pt obtine numele??
-- ii vreau sa ii un si pe cei care nu si-au schimbat numele

-- pt toate locatiile: sa se afiseze schimbarile