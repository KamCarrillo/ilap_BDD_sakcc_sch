-- @Autor       : Samuel Chong (SCH)
-- @Fecha       : dd/mm/yyyy
-- @Descripción : Validación de sinónimos de fragmentos y réplicas

set serveroutput on
set echo on
set feedback on

-------------------------------------------------------------------------------
-- SUCURSAL
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para SUCURSAL
prompt ==================================================
select
  (select count(*) from sucursal_f1) as sucursal_f1,
  (select count(*) from sucursal_f2) as sucursal_f2,
  (select count(*) from sucursal_f3) as sucursal_f3,
  (select count(*) from sucursal_f4) as sucursal_f4
from dual;

-------------------------------------------------------------------------------
-- SUCURSAL_VENTA
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para SUCURSAL_VENTA
prompt ==================================================
select
  (select count(*) from sucursal_venta_f1) as sucursal_venta_f1,
  (select count(*) from sucursal_venta_f2) as sucursal_venta_f2,
  (select count(*) from sucursal_venta_f3) as sucursal_venta_f3,
  (select count(*) from sucursal_venta_f4) as sucursal_venta_f4
from dual;

-------------------------------------------------------------------------------
-- SUCURSAL_TALLER
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para SUCURSAL_TALLER
prompt ==================================================
select
  (select count(*) from sucursal_taller_f1) as sucursal_taller_f1,
  (select count(*) from sucursal_taller_f2) as sucursal_taller_f2,
  (select count(*) from sucursal_taller_f3) as sucursal_taller_f3,
  (select count(*) from sucursal_taller_f4) as sucursal_taller_f4
from dual;

-------------------------------------------------------------------------------
-- LAPTOP
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para LAPTOP
prompt ==================================================
select
  (select count(*) from laptop_f1) as laptop_f1,
  (select count(*) from laptop_f2) as laptop_f2,
  (select count(*) from laptop_f3) as laptop_f3,
  (select count(*) from laptop_f4) as laptop_f4
from dual;

-------------------------------------------------------------------------------
-- LAPTOP_INVENTARIO
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para LAPTOP_INVENTARIO
prompt ==================================================
select
  (select count(*) from laptop_inventario_f1) as laptop_inventario_f1,
  (select count(*) from laptop_inventario_f2) as laptop_inventario_f2
from dual;

-------------------------------------------------------------------------------
-- LAPTOP_FOTO (solo f4 en tu diseño)
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para LAPTOP_FOTO
prompt ==================================================
select
  (select count(*) from laptop_foto_f4) as laptop_foto_f4
from dual;

-------------------------------------------------------------------------------
-- HISTORICO_STATUS_LAPTOP
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para HISTORICO_STATUS_LAPTOP
prompt ==================================================
select
  (select count(*) from historico_status_laptop_f1) as historico_status_laptop_f1,
  (select count(*) from historico_status_laptop_f2) as historico_status_laptop_f2
from dual;

-------------------------------------------------------------------------------
-- SERVICIO_LAPTOP
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para SERVICIO_LAPTOP
prompt ==================================================
select
  (select count(*) from servicio_laptop_f1) as servicio_laptop_f1,
  (select count(*) from servicio_laptop_f2) as servicio_laptop_f2,
  (select count(*) from servicio_laptop_f3) as servicio_laptop_f3,
  (select count(*) from servicio_laptop_f4) as servicio_laptop_f4
from dual;

-------------------------------------------------------------------------------
-- TABLAS REPLICADAS: TIPO_PROCESADOR
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para TIPO_PROCESADOR (réplicas)
prompt ==================================================
select
  (select count(*) from tipo_procesador_r1) as tipo_procesador_r1,
  (select count(*) from tipo_procesador_r2) as tipo_procesador_r2,
  (select count(*) from tipo_procesador_r3) as tipo_procesador_r3,
  (select count(*) from tipo_procesador_r4) as tipo_procesador_r4
from dual;

-------------------------------------------------------------------------------
-- TABLAS REPLICADAS: TIPO_TARJETA_VIDEO
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para TIPO_TARJETA_VIDEO (réplicas)
prompt ==================================================
select
  (select count(*) from tipo_tarjeta_video_r1) as tipo_tarjeta_video_r1,
  (select count(*) from tipo_tarjeta_video_r2) as tipo_tarjeta_video_r2,
  (select count(*) from tipo_tarjeta_video_r3) as tipo_tarjeta_video_r3,
  (select count(*) from tipo_tarjeta_video_r4) as tipo_tarjeta_video_r4
from dual;

-------------------------------------------------------------------------------
-- TABLAS REPLICADAS: TIPO_ALMACENAMIENTO
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para TIPO_ALMACENAMIENTO (réplicas)
prompt ==================================================
select
  (select count(*) from tipo_almacenamiento_r1) as tipo_almacenamiento_r1,
  (select count(*) from tipo_almacenamiento_r2) as tipo_almacenamiento_r2,
  (select count(*) from tipo_almacenamiento_r3) as tipo_almacenamiento_r3,
  (select count(*) from tipo_almacenamiento_r4) as tipo_almacenamiento_r4
from dual;

-------------------------------------------------------------------------------
-- TABLAS REPLICADAS: TIPO_MONITOR
-------------------------------------------------------------------------------
prompt ==================================================
prompt validando sinónimos para TIPO_MONITOR (réplicas)
prompt ==================================================
select
  (select count(*) from tipo_monitor_r1) as tipo_monitor_r1,
  (select count(*) from tipo_monitor_r2) as tipo_monitor_r2,
  (select count(*) from tipo_monitor_r3) as tipo_monitor_r3,
  (select count(*) from tipo_monitor_r4) as tipo_monitor_r4
from dual;

-------------------------------------------------------------------------------
-- STATUS_LAPTOP
-- Nota: status_laptop se maneja como copia manual, sin sinónimos.
-------------------------------------------------------------------------------

prompt ==========================================
prompt Validación de sinónimos finalizada.
prompt ==========================================
