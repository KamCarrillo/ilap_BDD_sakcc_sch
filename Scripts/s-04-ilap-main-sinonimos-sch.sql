-- @Autor       : Samuel Chong (SCH)
-- @Fecha       : dd/mm/yyyy
-- @Descripción : Creación y validación de sinónimos para las PDBs de SCH

clear screen
whenever sqlerror exit rollback;
set serveroutput on

prompt =========================================
prompt Creación de sinónimos - Lado SCH
prompt =========================================

ACCEPT ilappass CHAR PROMPT 'Proporcione el password de ilap_bdd: ' HIDE

prompt =========================================
prompt Creando sinónimos en schbdd_s1
prompt =========================================
connect ilap_bdd/&&ilappass@SCHBDD_S1
@s-04-ilap-sch-s1-sinonimos.sql

prompt =========================================
prompt Creando sinónimos en schbdd_s2
prompt =========================================
connect ilap_bdd/&&ilappass@SCHBDD_S2
@s-04-ilap-sch-s2-sinonimos.sql

prompt =========================================
prompt Listo: sinónimos creados y validados (lado SCH)
prompt =========================================

prompt =========================================
prompt Creación de sinónimos - Lado SAKCC
prompt =========================================

prompt =========================================
prompt Creando sinónimos en sakccbdd_s1
prompt =========================================
connect ilap_bdd/&&ilappass@sakccbdd_s1
@s-04-ilap-sakcc-s1-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql
prompt =========================================
prompt Creando sinónimos en sakccbdd_s2
prompt =========================================
connect ilap_bdd/&&ilappass@sakccbdd_s2
@s-04-ilap-sakcc-s2-sinonimos.sql
@s-04-ilap-valida-sinonimos.sql
prompt =========================================
prompt Listo: sinónimos creados y validados (lado SAKCC)
prompt =========================================


