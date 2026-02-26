
create or replace TYPE listaproiecte as varray(20) of varchar(20);

create table proiecte 
(
    iddept number(2),
    denumire varchar2(20),
    buget number(11, 2),
    proiect listaproiecte
);

create or replace type listaproiecte_nt
    as TABLE of varchar2(30);

create table proiecte_nt 
(
    iddept number(2),
    denumire VARCHAR2(20),
    buget number(11, 2),
    proiect listaproiecte_nt
) nested table proiect store as proiect_store;

set serveroutput on;
DECLARE 
    proiect listaproiecte;
BEGIN
    proiect := listaproiecte('E-commerce', 'Carduri bancare ');

    insert into proiecte 
    values (20, 'Proiectare', 165580, proiect);

    dbms_output.put_line('Proiectul bancar se numeste ' || proiect(2));

end;