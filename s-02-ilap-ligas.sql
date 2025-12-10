--@Autor: Jorge A. Rodríguez C
--@Fecha creación:
--@Descripción: Creación de ligas en los 4 nodos.
clear screen
whenever sqlerror exit rollback;
--Prompt ============================
--Prompt Creando ligas ens schbdd_s1
--Prompt ============================


--Prompt Creando ligas en schbdd_s1
--connect ilap_bdd/ilap_bdd@schbdd_s1
---- PDB local
--create database link schbdd_s2.fi.unam using 'SCHBDD_S2';
----PDB remotas
--create database link sakccbdd_s1.fi.unam using 'SAKCCBDD_S1';
--Create database link sakccbdd_s2.fi.unam using 'SAKCCBDD_S2';
--
--
--Prompt ============================
--Prompt Creando ligas ens schbdd_s2
--Prompt ============================
--
--
--Prompt Creando ligas en schbdd_s2
--connect ilap_bdd/ilap_bdd@schbdd_s2
---- PDB local
--create database link schbdd_s1.fi.unam using 'SCHBDD_S1';
----PDB remotas
--create database link sakccbdd_s1.fi.unam using 'SAKCCBDD_S1';
--Create database link sakccbdd_s2.fi.unam using 'SAKCCBDD_S2';
----completar


Prompt ============================
Prompt Creando ligas ens sakccbdd_s1
Prompt ============================


Prompt Creando ligas en sakccbdd_s1
connect ilap_bdd/ilap_bdd@sakccbdd_s1
-- PDB local
Create database link sakccbdd_s2.fi.unam using 'SAKCCBDD_S2';
--PDB remotas
create database link schbdd_s1.fi.unam using 'SCHBDD_S1';
create database link schbdd_s2.fi.unam using 'SCHBDD_S2';


Prompt ============================
Prompt Creando ligas ens sakccbdd_s2
Prompt ============================


Prompt Creando ligas en sakccbdd_s2
connect ilap_bdd/ilap_bdd@sakccbdd_s2
-- PDB local
Create database link sakccbdd_s1.fi.unam using 'SAKCCBDD_S1';
--PDB remotas
create database link schbdd_s1.fi.unam using 'SCHBDD_S1';
create database link schbdd_s2.fi.unam using 'SCHBDD_S2';




Prompt Listo!