-- s-05-ilap-vistas.sql
-- @Autor        : SCH / SAKCC
-- @Fecha        : dd/mm/yyyy
-- @Descripción  : Definición de vistas globales SIN columnas BLOB/CLOB.

set serveroutput on
Prompt Creando vistas globales sin BLOB ...

/***************************************************************************
 * SUCURSAL
 ***************************************************************************/
create or replace view sucursal as
select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
from sucursal_f1
union all
select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
from sucursal_f2
union all
select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
from sucursal_f3
union all
select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
from sucursal_f4;

/***************************************************************************
 * SUCURSAL_TALLER
 ***************************************************************************/
create or replace view sucursal_taller as
select sucursal_id, capacidad_max_taller, horario_taller_apertura,
       horario_taller_cierre
from sucursal_taller_f1
union all
select sucursal_id, capacidad_max_taller, horario_taller_apertura,
       horario_taller_cierre
from sucursal_taller_f2
union all
select sucursal_id, capacidad_max_taller, horario_taller_apertura,
       horario_taller_cierre
from sucursal_taller_f3
union all
select sucursal_id, capacidad_max_taller, horario_taller_apertura,
       horario_taller_cierre
from sucursal_taller_f4;

/***************************************************************************
 * SUCURSAL_VENTA
 ***************************************************************************/
create or replace view sucursal_venta as
select sucursal_id, capacidad_max_venta, horario_venta_apertura,
       horario_venta_cierre
from sucursal_venta_f1
union all
select sucursal_id, capacidad_max_venta, horario_venta_apertura,
       horario_venta_cierre
from sucursal_venta_f2
union all
select sucursal_id, capacidad_max_venta, horario_venta_apertura,
       horario_venta_cierre
from sucursal_venta_f3
union all
select sucursal_id, capacidad_max_venta, horario_venta_apertura,
       horario_venta_cierre
from sucursal_venta_f4;

/***************************************************************************
 * LAPTOP_INVENTARIO  (sin foto)
 ***************************************************************************/
create or replace view laptop_inventario as
select laptop_id, sucursal_id, existencia, fecha_alta
from laptop_inventario_f1
union all
select laptop_id, sucursal_id, existencia, fecha_alta
from laptop_inventario_f2
union all
select laptop_id, sucursal_id, existencia, fecha_alta
from laptop_inventario_f3
union all
select laptop_id, sucursal_id, existencia, fecha_alta
from laptop_inventario_f4;

/***************************************************************************
 * HISTORICO_STATUS_LAPTOP
 ***************************************************************************/
create or replace view historico_status_laptop as
select laptop_id, status_laptop_id, fecha_status, observaciones
from historico_status_laptop_f1
union all
select laptop_id, status_laptop_id, fecha_status, observaciones
from historico_status_laptop_f2;

/***************************************************************************
 * CATÁLOGOS REPLICADOS
 ***************************************************************************/
-- tipo_procesador
create or replace view tipo_procesador as
select tipo_procesador_id, descripcion
from tipo_procesador_r1
union all
select tipo_procesador_id, descripcion
from tipo_procesador_r2
union all
select tipo_procesador_id, descripcion
from tipo_procesador_r3
union all
select tipo_procesador_id, descripcion
from tipo_procesador_r4;

-- tipo_tarjeta_video
create or replace view tipo_tarjeta_video as
select tipo_tarjeta_video_id, descripcion
from tipo_tarjeta_video_r1
union all
select tipo_tarjeta_video_id, descripcion
from tipo_tarjeta_video_r2
union all
select tipo_tarjeta_video_id, descripcion
from tipo_tarjeta_video_r3
union all
select tipo_tarjeta_video_id, descripcion
from tipo_tarjeta_video_r4;

-- tipo_monitor
create or replace view tipo_monitor as
select tipo_monitor_id, descripcion
from tipo_monitor_r1
union all
select tipo_monitor_id, descripcion
from tipo_monitor_r2
union all
select tipo_monitor_id, descripcion
from tipo_monitor_r3
union all
select tipo_monitor_id, descripcion
from tipo_monitor_r4;

-- tipo_almacenamiento
create or replace view tipo_almacenamiento as
select tipo_almacenamiento_id, descripcion
from tipo_almacenamiento_r1
union all
select tipo_almacenamiento_id, descripcion
from tipo_almacenamiento_r2
union all
select tipo_almacenamiento_id, descripcion
from tipo_almacenamiento_r3
union all
select tipo_almacenamiento_id, descripcion
from tipo_almacenamiento_r4;

-- status_laptop
create or replace view status_laptop as
select status_laptop_id, descripcion
from status_laptop_r1
union all
select status_laptop_id, descripcion
from status_laptop_r2
union all
select status_laptop_id, descripcion
from status_laptop_r3
union all
select status_laptop_id, descripcion
from status_laptop_r4;

Prompt Vistas sin BLOB creadas.