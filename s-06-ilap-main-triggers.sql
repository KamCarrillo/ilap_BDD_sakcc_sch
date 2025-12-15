--@Autor: SCH / SAKCC
--@Fecha: dd/mm/yyyy
--@Descripción: MAIN de triggers (incluye soporte BLOB para pruebas)

clear screen
set serveroutput on
whenever sqlerror exit rollback

prompt ======================================================
prompt (0) Compilando soporte BLOB / funciones remotas (si aplica)
prompt ======================================================

prompt ==============================
prompt Soporte BLOB en schbdd_s1 (NO)
prompt ==============================
connect ilap_bdd/ilap_bdd@schbdd_s1.fi.unam
-- FOTO remota (lee desde Sur)
@s-07b-ilap-blob-foto-func-remote.sql
-- FACTURA API (local F1 + get_remote_serv_lap_*)
@s-07c-ilap-sch-s1-blob-factura-api.sql

prompt ==============================
prompt Soporte BLOB en schbdd_s2 (EA)
prompt ==============================
connect ilap_bdd/ilap_bdd@schbdd_s2.fi.unam
@s-07b-ilap-blob-foto-func-remote.sql
@s-07c-ilap-sch-s2-blob-factura-api.sql

prompt ==============================
prompt Soporte BLOB en sakccbdd_s1 (WS)
prompt ==============================
connect ilap_bdd/ilap_bdd@sakccbdd_s1.fi.unam
@s-07b-ilap-blob-foto-func-remote.sql
@s-07c-ilap-sakcc-s1-blob-factura-api.sql

prompt ==============================
prompt Soporte BLOB en sakccbdd_s2 (SO) (DUENO FOTO)
prompt ==============================
connect ilap_bdd/ilap_bdd@sakccbdd_s2.fi.unam
-- Dueño de foto: procedure + función local
@s-07b-ilap-sakcc-s2-blob-foto-api.sql
-- Factura API (local F4 + get_remote_serv_lap_*)
@s-07c-ilap-sakcc-s2-blob-factura-api.sql


prompt ======================================================
prompt (1) Compilando TRIGGERS (vista global / replicados / blobs)
prompt ======================================================

prompt ==============================
prompt Triggers en schbdd_s1 (NO)
prompt ==============================
connect ilap_bdd/ilap_bdd@schbdd_s1.fi.unam
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-sch-s1-sucursal-taller-trigger.sql
@s-06-ilap-sch-s1-sucursal-venta-trigger.sql
@s-06-ilap-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
-- servicio_laptop con BLOB (usa RPC sp_set_servicio_factura@...)
@s-06-ilap-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql

prompt ==============================
prompt Triggers en schbdd_s2 (EA)
prompt ==============================
connect ilap_bdd/ilap_bdd@schbdd_s2.fi.unam
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

prompt ==============================
prompt Triggers en sakccbdd_s1 (WS)
prompt ==============================
connect ilap_bdd/ilap_bdd@sakccbdd_s1.fi.unam
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

prompt ==============================
prompt Triggers en sakccbdd_s2 (SO)
prompt ==============================
connect ilap_bdd/ilap_bdd@sakccbdd_s2.fi.unam
@s-06-ilap-sucursal-trigger.sql
@s-06-ilap-sakcc-s2-sucursal-taller-trigger.sql
@s-06-ilap-sakcc-s2-sucursal-venta-trigger.sql
-- version especial para Sur (foto local)
@s-06-ilap-sakcc-s2-laptop-trigger.sql
@s-06-ilap-laptop-inventario-trigger.sql
@s-06-ilap-historico-status-laptop-trigger.sql
@s-06-ilap-servicio-laptop-trigger.sql
@s-06-ilap-tipo-procesador-trigger.sql
@s-06-ilap-tipo-almacenamiento-trigger.sql
@s-06-ilap-tipo-monitor-trigger.sql
@s-06-ilap-tipo-tarjeta-video-trigger.sql


prompt Listo! MAIN terminado.
disconnect
