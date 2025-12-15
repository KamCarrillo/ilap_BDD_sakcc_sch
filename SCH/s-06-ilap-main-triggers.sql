-- s-06-ilap-main-triggers.sql
-- @Autor       : SCH / SAKCC
-- @Fecha       : dd/mm/yyyy
-- @Descripción : Creación de triggers de replicación para catálogos
--                en las 4 PDBs del proyecto.

whenever sqlerror exit rollback;
set serveroutput on

prompt ===========================================
prompt Creando triggers de replicación en schbdd_s1
prompt ===========================================
connect ilap_bdd/ilap_bdd@schbdd_s1

@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql

prompt ===========================================
prompt Creando triggers de replicación en schbdd_s2
prompt ===========================================
connect ilap_bdd/ilap_bdd@schbdd_s2

@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql

prompt ===========================================
prompt Creando triggers de replicación en sakccbdd_s1
prompt ===========================================
connect ilap_bdd/ilap_bdd@sakccbdd_s1

@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql

prompt ===========================================
prompt Creando triggers de replicación en sakccbdd_s2
prompt ===========================================
connect ilap_bdd/ilap_bdd@sakccbdd_s2

@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql

prompt ===========================================
prompt Triggers de replicación creados en los 4 nodos
prompt ===========================================

disconnect
exit

