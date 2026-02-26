set SERVEROUTPUT on;

DECLARE
    TYPE secventa is varray(5) of VARCHAR2(10);
    v_sec SECVENTA := secventa('alb', 'negru', 'rosu', 'verde');
    t BOOLEAN;
BEGIN
    dbms_output.put_line(v_sec(1)
                        || ' '
                        || v_sec(2)
                        || ' '
                        || v_sec(3)
                        || ' '
                        || v_sec(4)   
    );

    v_sec(4) := 'rosu';

    dbms_output.put_line(v_sec.limit);


    dbms_output.put_line(v_sec(1)
                        || ' '
                        || v_sec(2)
                        || ' '
                        || v_sec(3)
                        || ' '
                        || v_sec(4)   
    );

    v_sec.extend;
    dbms_output.put_line(v_sec(1)
                        || ' '
                        || v_sec(2)
                        || ' '
                        || v_sec(3)
                        || ' '
                        || v_sec(4)
                        || ' '
                        || v_sec(5)   
    );

    v_sec(5) := 'albastru';
    dbms_output.put_line(v_sec(1)
                        || ' '
                        || v_sec(2)
                        || ' '
                        || v_sec(3)
                        || ' '
                        || v_sec(4)
                        || ' '
                        || v_sec(5)   
    );

    dbms_output.put_line(v_sec.limit);
    
END;