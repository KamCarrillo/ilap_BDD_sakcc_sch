-- s-06-ilap-main-triggers.sql
-- @Autor       : SCH / SAKCC
-- @Fecha       : dd/mm/yyyy
-- @Descripción : MAIN para compilar soporte BLOB (TI/TS + funciones + procedures)
--                y luego triggers, en las 4 PDBs.

set serveroutput on
whenever sqlerror exit rollback
prompt ======================================================
prompt MAIN TRIGGERS + BLOB (por sinonimos + TI/TS)
prompt ======================================================

-------------------------------------------------------------------------------
-- 1) schbdd_s1
-------------------------------------------------------------------------------
prompt ======================================================
prompt (1/4) schbdd_s1  (Norte)
prompt ======================================================
connect ilap_bdd/ilap_bdd@schbdd_s1


-- Procedimientos BLOB (escritura) que usan TI_*
@s-05b-ilap-procedimientos-blob.sql

-- TRIGGERS
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-sch-s1-sucursal-taller-trigger.sql
@s-06-ilap-sch-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-servicio-laptop-trigger.sql

@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

prompt Objetos inválidos en schbdd_s1:
column object_name format a40
select object_type, object_name, status
from user_objects
where status <> 'VALID'
order by object_type, object_name;

-------------------------------------------------------------------------------
-- 2) schbdd_s2
-------------------------------------------------------------------------------
prompt ======================================================
prompt (2/4) schbdd_s2  (Este)
prompt ======================================================
connect ilap_bdd/ilap_bdd@schbdd_s2
@s-05b-ilap-procedimientos-blob.sql

@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-sch-s2-sucursal-taller-trigger.sql
@s-06-ilap-sch-s2-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-servicio-laptop-trigger.sql

@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

prompt Objetos inválidos en schbdd_s2:
select object_type, object_name, status
from user_objects
where status <> 'VALID'
order by object_type, object_name;

-------------------------------------------------------------------------------
-- 3) sakccbdd_s1
-------------------------------------------------------------------------------
prompt ======================================================
prompt (3/4) sakccbdd_s1 (Oeste)
prompt ======================================================
connect ilap_bdd/ilap_bdd@sakccbdd_s1

@s-05b-ilap-procedimientos-blob.sql

@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-sakcc-s1-sucursal-taller-trigger.sql
@s-06-ilap-sakcc-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-servicio-laptop-trigger.sql

@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

prompt Objetos inválidos en sakccbdd_s1:
select object_type, object_name, status
from user_objects
where status <> 'VALID'
order by object_type, object_name;

-------------------------------------------------------------------------------
-- 4) sakccbdd_s2
-------------------------------------------------------------------------------
prompt ======================================================
prompt (4/4) sakccbdd_s2 (Sur)
prompt ======================================================
connect ilap_bdd/ilap_bdd@sakccbdd_s2

@s-05b-ilap-procedimientos-blob.sql

@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-sakcc-s2-sucursal-taller-trigger.sql
@s-06-ilap-sakcc-s2-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-servicio-laptop-trigger.sql

@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

prompt Objetos inválidos en sakccbdd_s2:
select object_type, object_name, status
from user_objects
where status <> 'VALID'
order by object_type, object_name;

prompt ======================================================
prompt MAIN terminado OK
prompt ======================================================

