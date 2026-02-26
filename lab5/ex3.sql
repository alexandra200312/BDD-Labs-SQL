--sa se creeze o precodura stocata care calculeaza
-- veniturile angajatilor cu o vechime de peste 10 ani
-- in firma, dintr un anumit departament
CREATE OR REPLACE PROCEDURE Sp_venit(
                            iddept IN number,
                            venit in out number,
                            dataref in date default sysdate)
IS
    numedepartament departments.department_name%type;
BEGIN
    select department_name
    into numedepartament
    from departments
    where department_id = iddept;

    select sum(salary + nvl(commission_pct, 0) *salary)
    into venit 
    from employees
    where department_id = iddept
    and add_months(hire_date, 120) < dataref;

    dbms_output.put_line(Rpad(numedepartament, 20) || rpad(venit, 20));
EXCEPTION
    when no_data_found THEN
        dbms_output.put_line('nu a fost gasita nicio inregistrare.');

end Sp_venit;
/

set verify off;
set SERVEROUTPUT on;
DECLARE
    dataref Date default sysdate;
    venit number := 0;
    total number := 0;
    
BEGIN
    for rand in ( select distinct department_id
                from departments
                order by department_id)
        LOOP
            Sp_venit(rand.department_id, venit, dataref);

            total := total + nvl(venit,0);


        end loop;
    dbms_output.put_line('total' || total);    
end;