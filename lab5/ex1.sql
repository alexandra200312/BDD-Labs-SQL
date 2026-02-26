-- exemplu de procedura declarata intr-un bloc

set VERIFY OFF
set serveroutput on;

declare 
    procedure procFaraProgram
    as 
    BEGIN
        dbms_output.put_line('am apelat o procedura fara parametrii.');
    end procFaraProgram;
BEGIN
    procFaraProgram();
END;