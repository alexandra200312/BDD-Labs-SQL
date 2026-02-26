set SERVEROUTPUT on;

DECLARE
    TYPE tabimbricat
        IS TABLE OF varchar2(30);
    curs tabimbricat;
BEGIN
    curs := tabimbricat('Baze de date', 'Proiectare Baze de date');

    dbms_output.put_line('Cursul echivalent pentru BD2 este ' || Curs(2));

END;