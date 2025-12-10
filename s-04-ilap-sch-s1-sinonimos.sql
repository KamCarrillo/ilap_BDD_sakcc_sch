-- @Autor       : Samuel Chong (SCH)
-- @Fecha       : dd/mm/yyyy
-- @Descripción : Sinónimos de fragmentos y réplicas para schbdd_s1

set serveroutput on

-------------------------------------------------------------------------------
-- SUCURSAL (fragmentada en 4 nodos)
-------------------------------------------------------------------------------
create or replace synonym sucursal_f1 for sucursal_f1_sch_s1;
create or replace synonym sucursal_f2 for sucursal_f2_sch_s2@schbdd_s2.fi.unam;
create or replace synonym sucursal_f3 for sucursal_f3_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym sucursal_f4 for sucursal_f4_sakcc_s2@sakccbdd_s2.fi.unam;

-------------------------------------------------------------------------------
-- SUCURSAL_VENTA
-------------------------------------------------------------------------------
create or replace synonym sucursal_venta_f1 for sucursal_venta_f1_sch_s1;
create or replace synonym sucursal_venta_f2 for sucursal_venta_f2_sch_s2@schbdd_s2.fi.unam;
create or replace synonym sucursal_venta_f3 for sucursal_venta_f3_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym sucursal_venta_f4 for sucursal_venta_f4_sakcc_s2@sakccbdd_s2.fi.unam;

-------------------------------------------------------------------------------
-- SUCURSAL_TALLER
-------------------------------------------------------------------------------
create or replace synonym sucursal_taller_f1 for sucursal_taller_f1_sch_s1;
create or replace synonym sucursal_taller_f2 for sucursal_taller_f2_sch_s2@schbdd_s2.fi.unam;
create or replace synonym sucursal_taller_f3 for sucursal_taller_f3_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym sucursal_taller_f4 for sucursal_taller_f4_sakcc_s2@sakccbdd_s2.fi.unam;

-------------------------------------------------------------------------------
-- LAPTOP (fragmentada primaria en 4 nodos)
-------------------------------------------------------------------------------
create or replace synonym laptop_f1 for laptop_f1_sch_s1;
create or replace synonym laptop_f2 for laptop_f2_sch_s2@schbdd_s2.fi.unam;
create or replace synonym laptop_f3 for laptop_f3_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym laptop_f4 for laptop_f4_sakcc_s2@sakccbdd_s2.fi.unam;

-------------------------------------------------------------------------------
-- LAPTOP_INV (vertical, 2 fragmentos)
-------------------------------------------------------------------------------
create or replace synonym laptop_inv_f1 for laptop_inv_f1_sch_s1;
create or replace synonym laptop_inv_f2 for laptop_inv_f2_sakcc_s1@sakccbdd_s1.fi.unam;

-------------------------------------------------------------------------------
-- HISTORICO_STATUS (2 fragmentos)
-------------------------------------------------------------------------------
create or replace synonym hist_status_f1 for hist_status_f1_sch_s1;
create or replace synonym hist_status_f2 for hist_status_f2_sch_s2@schbdd_s2.fi.unam;

-------------------------------------------------------------------------------
-- SERVICIO_LAPTOP (derivada por sucursal, 4 fragmentos)
-------------------------------------------------------------------------------
create or replace synonym servicio_lap_f1 for servicio_lap_f1_sch_s1;
create or replace synonym servicio_lap_f2 for servicio_lap_f2_sch_s2@schbdd_s2.fi.unam;
create or replace synonym servicio_lap_f3 for servicio_lap_f3_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym servicio_lap_f4 for servicio_lap_f4_sakcc_s2@sakccbdd_s2.fi.unam;

-------------------------------------------------------------------------------
-- TABLAS REPLICADAS (tipo_*)
-- Convención: <nombre_global>_rN, donde N = 1..4 (r1 es réplica local).
-------------------------------------------------------------------------------

-- tipo_procesador
create or replace synonym tipo_procesador_r1 for tipo_procesador_r_sch_s1;
create or replace synonym tipo_procesador_r2 for tipo_procesador_r_sch_s2@schbdd_s2.fi.unam;
create or replace synonym tipo_procesador_r3 for tipo_procesador_r_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym tipo_procesador_r4 for tipo_procesador_r_sakcc_s2@sakccbdd_s2.fi.unam;

-- tipo_tarjeta_video
create or replace synonym tipo_tarjeta_video_r1 for tipo_tarjeta_video_r_sch_s1;
create or replace synonym tipo_tarjeta_video_r2 for tipo_tarjeta_video_r_sch_s2@schbdd_s2.fi.unam;
create or replace synonym tipo_tarjeta_video_r3 for tipo_tarjeta_video_r_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym tipo_tarjeta_video_r4 for tipo_tarjeta_video_r_sakcc_s2@sakccbdd_s2.fi.unam;

-- tipo_almacenamiento
create or replace synonym tipo_almacenamiento_r1 for tipo_almacenamiento_r_sch_s1;
create or replace synonym tipo_almacenamiento_r2 for tipo_almacenamiento_r_sch_s2@schbdd_s2.fi.unam;
create or replace synonym tipo_almacenamiento_r3 for tipo_almacenamiento_r_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym tipo_almacenamiento_r4 for tipo_almacenamiento_r_sakcc_s2@sakccbdd_s2.fi.unam;

-- tipo_monitor
create or replace synonym tipo_monitor_r1 for tipo_monitor_r_sch_s1;
create or replace synonym tipo_monitor_r2 for tipo_monitor_r_sch_s2@schbdd_s2.fi.unam;
create or replace synonym tipo_monitor_r3 for tipo_monitor_r_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym tipo_monitor_r4 for tipo_monitor_r_sakcc_s2@sakccbdd_s2.fi.unam;

-- status_laptop NO requiere sinónimos (copia manual en los 4 nodos).

