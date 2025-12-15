-- s-01-ilap-main-usuario.sql
-- Crea / recrea el usuario ILAP_BDD en las 4 PDB del proyecto.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

prompt ====================================================
prompt Creación/actualización de ILAP_BDD en los 4 nodos
prompt ====================================================

accept syspass char prompt 'Password de SYS para las PDBs: ' hide

prompt =====================================
prompt 1) schbdd_s1
prompt =====================================
connect sys/&&syspass@schbdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt 2) schbdd_s2
prompt =====================================
connect sys/&&syspass@schbdd_s2 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt 3) sakccbdd_s1
prompt =====================================
connect sys/&&syspass@sakccbdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt 4) sakccbdd_s2
prompt =====================================
connect sys/&&syspass@sakccbdd_s2 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt ILAP_BDD listo en schbdd_s1, schbdd_s2, sakccbdd_s1, sakccbdd_s2
prompt =====================================

disconnect
exit

