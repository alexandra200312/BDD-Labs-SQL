set SERVEROUTPUT on;

DECLARE
    contor integer;

BEGIN
    for contor in 1..10 loop
        if contor = 5 then 
            goto label1;
        else 
            goto label2;
        end if;

        <<label1>>
        dbms_output.put_line('Contorul este la jumatate!');

        <<label2>>
        dbms_output.put_line('Valoarea contorului este  ' || contor);


    end loop;

end;