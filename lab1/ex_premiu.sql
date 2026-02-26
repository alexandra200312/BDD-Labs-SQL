-- -- pt toate departamentele  in care exitra schimnari
-- -- sa se gaseasca diferenta procentuala maxima si ceilalti ang sa fie sortati descrescator dupa ea
-- -- diferenta procentuala dintre salariul maxim si cel minim pe grila procentuala: grila veche din job history -> job id -> de acolo, grila noua: employee_id-> job_id->grila salariu
-- -- sal max de la cel mai mare pe care l-am detinut vreodata
-- -- sal min pe care l am detinut vreodata
-- --max(max_salary) - min(max_salary)
-- DECLARE 
--     type dept_id_table IS TABLE OF departments.department_id%type index BY binary_integer;
--     tabela dept_id_table;

-- BEGIN
--     SELECT DISTINCT department_id
--     bulk collect into tabela
--     from job_history;

--     --job_id, max_salary
--     --max(max_salary) - min(max_salary)
--     union(job_history, employees).join(jobs).select(max_salary - min(max_salary))

--     for contor in tabela.first .. tabela.last
--     LOOP
--         DBMS_OUTPUT.PUT_LINE(tabela(contor));
--     end loop;
-- END;

-- -- select job_id, max salary from jobs;
-- select e.employee_id, j.job_id, max(max_salary) max_max, min(max_salary) max_min
-- from employees e join jobs j on e.job_id = j.job_id group by e.employee_id
-- union
-- select job_history

-- -- with all_emps as 
-- -- (select jh.employee_id, jh.job)
-- -- inner join 
-- -- union
-- -- bagat in dictionar si am employee_id si departament

-- -- chestie usoara: grupam la nivel de departament: GROUP BY CU LISTA DE AGREGARE!!!!!
-- DECLARE
--     persoane varc