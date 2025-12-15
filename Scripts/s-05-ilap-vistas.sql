-- s-05-ilap-vistas.sql
-- @Autor        : SCH / SAKCC
-- @Fecha        : dd/mm/yyyy
-- @Descripción  : Definición de vistas globales SIN columnas BLOB/CLOB.

set serveroutput on
Prompt Creando vistas globales sin BLOB ...

/***************************************************************************
 * SUCURSAL
 ***************************************************************************/
-- SUCURSAL (base)
CREATE OR REPLACE VIEW sucursal AS
    SELECT sucursal_id,
           clave,
           es_venta,
           es_taller,
           nombre,
           latitud,
           longitud,
           url
      FROM sucursal_f1
    UNION ALL
    SELECT sucursal_id,
           clave,
           es_venta,
           es_taller,
           nombre,
           latitud,
           longitud,
           url
      FROM sucursal_f2
    UNION ALL
    SELECT sucursal_id,
           clave,
           es_venta,
           es_taller,
           nombre,
           latitud,
           longitud,
           url
      FROM sucursal_f3
    UNION ALL
    SELECT sucursal_id,
           clave,
           es_venta,
           es_taller,
           nombre,
           latitud,
           longitud,
           url
      FROM sucursal_f4;

-- SUCURSAL_VENTA
CREATE OR REPLACE VIEW sucursal_venta AS
    SELECT sucursal_id,
           hora_apertura,
           hora_cierre
      FROM sucursal_venta_f1
    UNION ALL
    SELECT sucursal_id,
           hora_apertura,
           hora_cierre
      FROM sucursal_venta_f2
    UNION ALL
    SELECT sucursal_id,
           hora_apertura,
           hora_cierre
      FROM sucursal_venta_f3
    UNION ALL
    SELECT sucursal_id,
           hora_apertura,
           hora_cierre
      FROM sucursal_venta_f4;

-- SUCURSAL_TALLER 
CREATE OR REPLACE VIEW sucursal_taller AS
    SELECT sucursal_id,
           dia_descanso,
           telefono_atencion
      FROM sucursal_taller_f1
    UNION ALL
    SELECT sucursal_id,
           dia_descanso,
           telefono_atencion
      FROM sucursal_taller_f2
    UNION ALL
    SELECT sucursal_id,
           dia_descanso,
           telefono_atencion
      FROM sucursal_taller_f3
    UNION ALL
    SELECT sucursal_id,
           dia_descanso,
           telefono_atencion
      FROM sucursal_taller_f4;
/***************************************************************************
 * LAPTOP_INVENTARIO  (sin foto)
 ***************************************************************************/
CREATE OR REPLACE VIEW laptop_inventario AS
SELECT
  li1.laptop_id,
  li1.status_laptop_id,
  li1.fecha_status,
  li1.sucursal_id,
  li2.rfc_cliente,
  li2.num_tarjeta
FROM laptop_inventario_f1 li1
JOIN laptop_inventario_f2 li2
  ON li1.laptop_id = li2.laptop_id;
/***************************************************************************
 * HISTORICO_STATUS_LAPTOP
 ***************************************************************************/
CREATE OR REPLACE VIEW historico_status_laptop AS
SELECT
  historico_status_laptop_id,
  laptop_id,
  status_laptop_id,
  fecha_status
FROM historico_status_laptop_f1
UNION ALL
SELECT
  historico_status_laptop_id,
  laptop_id,
  status_laptop_id,
  fecha_status
FROM historico_status_laptop_f2;
/***************************************************************************
 * CATÁLOGOS REPLICADOS
 ***************************************************************************/
-- tipo_procesador
create or replace view tipo_procesador as
select tipo_procesador_id, descripcion, clave
from tipo_procesador_r1
union all
select tipo_procesador_id, descripcion, clave
from tipo_procesador_r2
union all
select tipo_procesador_id, descripcion, clave
from tipo_procesador_r3
union all
select tipo_procesador_id, descripcion, clave
from tipo_procesador_r4;

-- tipo_tarjeta_video
create or replace view tipo_tarjeta_video as
select tipo_tarjeta_video_id, descripcion, clave
from tipo_tarjeta_video_r1
union all
select tipo_tarjeta_video_id, descripcion, clave
from tipo_tarjeta_video_r2
union all
select tipo_tarjeta_video_id, descripcion, clave
from tipo_tarjeta_video_r3
union all
select tipo_tarjeta_video_id, descripcion, clave
from tipo_tarjeta_video_r4;

-- tipo_monitor
create or replace view tipo_monitor as
select tipo_monitor_id, descripcion, clave
from tipo_monitor_r1
union all
select tipo_monitor_id, descripcion, clave
from tipo_monitor_r2
union all
select tipo_monitor_id, descripcion, clave
from tipo_monitor_r3
union all
select tipo_monitor_id, descripcion, clave
from tipo_monitor_r4;

-- tipo_almacenamiento
create or replace view tipo_almacenamiento as
select tipo_almacenamiento_id, descripcion, clave
from tipo_almacenamiento_r1
union all
select tipo_almacenamiento_id, descripcion, clave
from tipo_almacenamiento_r2
union all
select tipo_almacenamiento_id, descripcion, clave
from tipo_almacenamiento_r3
union all
select tipo_almacenamiento_id, descripcion, clave
from tipo_almacenamiento_r4;


Prompt Vistas sin BLOB creadas.

