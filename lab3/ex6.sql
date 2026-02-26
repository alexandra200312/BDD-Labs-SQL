-- pt ang dintr un depratament citit de la tastatura, care au comision NULL, sa se genereze o exceptie definita

set SERVEROUTPUT on;

DECLARE
    idDep Number;
    contor number := 100;
    nume_ang employees.first_name%type;
    comision employees.commission_pct%type;
    data_ang date;
    lipsaComision EXCEPTION;

BEGIN
    idDep := &idDep;
    DBMS_OUTPUT.PUT_LINE(rpad('Nume', 15, ' ') || rpad('Data angajare', 20, ' ') || lpad('Comision', 15, ' '));
    DBMS_OUTPUT.PUT_LINE(rpad('=', 15, '=') || rpad('=', 20, '=') || lpad('=', 15, '='));

    LOOP
        contor := contor + 1;
        BEGIN
            SELECT first_name || ' ' || last_name, hire_date, commission_pct
            into nume_ang, data_ang, comision
            from employees 
            where department_id = idDep and employee_id = contor;

            if comision is NULL THEN
                RAISE lipsaComision;
            END IF;

            DBMS_OUTPUT.PUT_LINE(rpad(nume_ang, 15, ' ') || rpad(data_ang, 20, ' ') || lpad(comision, 15, ' '));

        EXCEPTION
            when no_data_found THEN NULL;

        END;

        EXIT WHEN CONTOR = 300;
    END LOOP;
EXCEPTION
    when lipsaComision THEN
            DBMS_OUTPUT.PUT_LINE(rpad(nume_ang, 15, ' ') || rpad(data_ang, 20, ' ') || lpad('lipsa comision', 15, ' '));
END;