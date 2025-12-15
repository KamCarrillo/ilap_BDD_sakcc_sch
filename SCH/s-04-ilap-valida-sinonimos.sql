-- @Autor       : Samuel Chong (SCH)
-- @Fecha       : dd/mm/yyyy
-- @Descripción : Validación de sinónimos (conteo por fragmento / réplica)

set serveroutput on

prompt =========================================
prompt Validando sinónimos para SUCURSAL
prompt =========================================
select
  (select count(*) from sucursal_f1) as sucursal_f1,
  (select count(*) from sucursal_f2) as sucursal_f2,
  (select count(*) from sucursal_f3) as sucursal_f3,
  (select count(*) from sucursal_f4) as sucursal_f4
from dual;

prompt =========================================
prompt Validando sinónimos para SUCURSAL_VENTA
prompt =========================================
select
  (select count(*) from sucursal_venta_f1) as suc_venta_f1,
  (select count(*) from sucursal_venta_f2) as suc_venta_f2,
  (select count(*) from sucursal_venta_f3) as suc_venta_f3,
  (select count(*) from sucursal_venta_f4) as suc_venta_f4
from dual;

prompt =========================================
prompt Validando sinónimos para SUCURSAL_TALLER
prompt =========================================
select
  (select count(*) from sucursal_taller_f1) as suc_taller_f1,
  (select count(*) from sucursal_taller_f2) as suc_taller_f2,
  (select count(*) from sucursal_taller_f3) as suc_taller_f3,
  (select count(*) from sucursal_taller_f4) as suc_taller_f4
from dual;

prompt =========================================
prompt Validando sinónimos para LAPTOP
prompt =========================================
select
  (select count(*) from laptop_f1) as laptop_f1,
  (select count(*) from laptop_f2) as laptop_f2,
  (select count(*) from laptop_f3) as laptop_f3,
  (select count(*) from laptop_f4) as laptop_f4
from dual;

prompt =========================================
prompt Validando sinónimos para LAPTOP_INV
prompt =========================================
select
  (select count(*) from laptop_inv_f1) as laptop_inv_f1,
  (select count(*) from laptop_inv_f2) as laptop_inv_f2
from dual;

prompt =========================================
prompt Validando sinónimos para HISTORICO_STATUS
prompt =========================================
select
  (select count(*) from hist_status_f1) as hist_status_f1,
  (select count(*) from hist_status_f2) as hist_status_f2
from dual;

prompt =========================================
prompt Validando sinónimos para SERVICIO_LAPTOP
prompt =========================================
select
  (select count(*) from servicio_lap_f1) as serv_lap_f1,
  (select count(*) from servicio_lap_f2) as serv_lap_f2,
  (select count(*) from servicio_lap_f3) as serv_lap_f3,
  (select count(*) from servicio_lap_f4) as serv_lap_f4
from dual;

prompt =========================================
prompt Validando sinónimos para tablas REPLICADAS
prompt =========================================

prompt -> tipo_procesador
select
  (select count(*) from tipo_procesador_r1) as tp_r1,
  (select count(*) from tipo_procesador_r2) as tp_r2,
  (select count(*) from tipo_procesador_r3) as tp_r3,
  (select count(*) from tipo_procesador_r4) as tp_r4
from dual;

prompt -> tipo_tarjeta_video
select
  (select count(*) from tipo_tarjeta_video_r1) as ttv_r1,
  (select count(*) from tipo_tarjeta_video_r2) as ttv_r2,
  (select count(*) from tipo_tarjeta_video_r3) as ttv_r3,
  (select count(*) from tipo_tarjeta_video_r4) as ttv_r4
from dual;

prompt -> tipo_almacenamiento
select
  (select count(*) from tipo_almacenamiento_r1) as ta_r1,
  (select count(*) from tipo_almacenamiento_r2) as ta_r2,
  (select count(*) from tipo_almacenamiento_r3) as ta_r3,
  (select count(*) from tipo_almacenamiento_r4) as ta_r4
from dual;

prompt -> tipo_monitor
select
  (select count(*) from tipo_monitor_r1) as tm_r1,
  (select count(*) from tipo_monitor_r2) as tm_r2,
  (select count(*) from tipo_monitor_r3) as tm_r3,
  (select count(*) from tipo_monitor_r4) as tm_r4
from dual;

prompt Listo: validación de sinónimos terminada.

