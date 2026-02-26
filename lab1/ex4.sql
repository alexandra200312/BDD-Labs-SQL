-- se primeste de la tastatura  un id de angajat si se vor afisa inf despre el

set SERVEROUTPUT on;

DECLARE 
    nume_ang nvarchar2(45);
    id_dep integer;
    dname varchar(20);
    dataAng date;
    idAng number(6) := &id;
    venit float;
    zileLucrate number(10);
    venit_Orar real;
    zileLunaConstant smallint := 21;
BEGIN
    SELECT 
        department_id,
        first_name || ' ' || last_name,
        salary + nvl(commission_pct, 0) * salary,
        hire_date 
    INTO
        id_dep, nume_ang, venit, dataAng
    FROM employees where EMPLOYEE_ID = idAng;

    SELECT 
        department_name 
    INTO
        dname
    from departments 
    where department_id = id_dep;

    venit_Orar := round(venit/(zileLunaConstant*8), 2);
    zileLucrate := sysdate - dataAng;

    DBMS_OUTPUT.PUT_LINE(nume_ang || 'are un venit orar de ' || venit_Orar || ' si face parte din dept ' || dname || '. ' || chr(13) || chr(10) || 'A lucrat in firma un numar total de ' || zileLucrate || ' zile.'); 

EXCEPTION
    when no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('no data, sorry');

END;
/

