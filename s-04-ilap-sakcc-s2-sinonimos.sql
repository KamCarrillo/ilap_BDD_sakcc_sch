-- @Autor       : Samuel Chong (SCH)
-- @Fecha       : dd/mm/yyyy
-- @Descripción : Sinónimos de fragmentos y réplicas para schbdd_s2

set serveroutput on

-------------------------------------------------------------------------------
-- SUCURSAL
-------------------------------------------------------------------------------
create or replace synonym sucursal_f1 for sucursal_f1_sch_s1@schbdd_s1.fi.unam;
create or replace synonym sucursal_f2 for sucursal_f2_sch_s2@schbdd_s2.fi.unam;
create or replace synonym sucursal_f3 for sucursal_f3_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym sucursal_f4 for sucursal_f4_sakcc_s2;

-------------------------------------------------------------------------------
-- SUCURSAL_VENTA
-------------------------------------------------------------------------------
create or replace synonym sucursal_venta_f1 for sucursal_venta_f1_sch_s1@schbdd_s1.fi.unam;
create or replace synonym sucursal_venta_f2 for sucursal_venta_f2_sch_s2@schbdd_s2.fi.unam;
create or replace synonym sucursal_venta_f3 for sucursal_venta_f3_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym sucursal_venta_f4 for sucursal_venta_f4_sakcc_s2;

-------------------------------------------------------------------------------
-- SUCURSAL_TALLER
-------------------------------------------------------------------------------
create or replace synonym sucursal_taller_f1 for sucursal_taller_f1_sch_s1@schbdd_s1.fi.unam;
create or replace synonym sucursal_taller_f2 for sucursal_taller_f2_sch_s2@schbdd_s2.fi.unam;
create or replace synonym sucursal_taller_f3 for sucursal_taller_f3_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym sucursal_taller_f4 for sucursal_taller_f4_sakcc_s2;

-------------------------------------------------------------------------------
-- LAPTOP
-------------------------------------------------------------------------------
create or replace synonym laptop_f1 for laptop_f1_sch_s1@schbdd_s1.fi.unam;
create or replace synonym laptop_f2 for laptop_f2_sch_s2@schbdd_s2.fi.unam;
create or replace synonym laptop_f3 for laptop_f3_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym laptop_f4 for laptop_f4_sakcc_s2;

-------------------------------------------------------------------------------
-- LAPTOP_INV (f1 y f2)
-------------------------------------------------------------------------------
create or replace synonym laptop_inventario_f1 for laptop_inventario_f1_sch_s1@schbdd_s1.fi.unam;
create or replace synonym laptop_inventario_f2 for laptop_inventario_f2_sakcc_s1@sakccbdd_s1.fi.unam;

create or replace synonym laptop_foto_f4 for laptop_foto_f4_sakcc_s2;
-------------------------------------------------------------------------------
-- HISTORICO_STATUS
-------------------------------------------------------------------------------
create or replace synonym historico_status_laptop_f1
  for historico_status_laptop_f1_sch_s1@schbdd_s1.fi.unam;

create or replace synonym historico_status_laptop_f2
  for historico_status_laptop_f2_sch_s2@schbdd_s2.fi.unam;
-------------------------------------------------------------------------------
-- SERVICIO_LAPTOP
-------------------------------------------------------------------------------
create or replace synonym servicio_laptop_f1 for servicio_laptop_f1_sch_s1@schbdd_s1.fi.unam;
create or replace synonym servicio_laptop_f2 for servicio_laptop_f2_sch_s2@schbdd_s2.fi.unam;
create or replace synonym servicio_laptop_f3 for servicio_laptop_f3_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym servicio_laptop_f4 for servicio_laptop_f4_sakcc_s2;

-------------------------------------------------------------------------------
-- TABLAS REPLICADAS (tipo_*)
-------------------------------------------------------------------------------

-- tipo_procesador
create or replace synonym tipo_procesador_r1 for tipo_procesador_r_sch_s2@schbdd_s2.fi.unam;
create or replace synonym tipo_procesador_r2 for tipo_procesador_r_sch_s1@schbdd_s1.fi.unam;
create or replace synonym tipo_procesador_r3 for tipo_procesador_r_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym tipo_procesador_r4 for tipo_procesador_r_sakcc_s2;

-- tipo_tarjeta_video
create or replace synonym tipo_tarjeta_video_r1 for tipo_tarjeta_video_r_sch_s2@schbdd_s2.fi.unam;
create or replace synonym tipo_tarjeta_video_r2 for tipo_tarjeta_video_r_sch_s1@schbdd_s1.fi.unam;
create or replace synonym tipo_tarjeta_video_r3 for tipo_tarjeta_video_r_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym tipo_tarjeta_video_r4 for tipo_tarjeta_video_r_sakcc_s2;

-- tipo_almacenamiento
create or replace synonym tipo_almacenamiento_r1 for tipo_almacenamiento_r_sch_s2@schbdd_s2.fi.unam;
create or replace synonym tipo_almacenamiento_r2 for tipo_almacenamiento_r_sch_s1@schbdd_s1.fi.unam;
create or replace synonym tipo_almacenamiento_r3 for tipo_almacenamiento_r_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym tipo_almacenamiento_r4 for tipo_almacenamiento_r_sakcc_s2;

-- tipo_monitor
create or replace synonym tipo_monitor_r1 for tipo_monitor_r_sch_s2@schbdd_s2.fi.unam;
create or replace synonym tipo_monitor_r2 for tipo_monitor_r_sch_s1@schbdd_s1.fi.unam;
create or replace synonym tipo_monitor_r3 for tipo_monitor_r_sakcc_s1@sakccbdd_s1.fi.unam;
create or replace synonym tipo_monitor_r4 for tipo_monitor_r_sakcc_s2;
-- status_laptop SIN sinónimos (copia manual).
-------------------------------------------------------------------------------
-- LAPTOP_FOTO (BLOB vertical, local en SAKCC S2)
-------------------------------------------------------------------------------
create or replace synonym laptop_foto_f1
  for laptop_foto_f1_sakcc_s2;

