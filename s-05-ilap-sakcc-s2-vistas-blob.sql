-- s-05-ilap-sakcc-s2-vistas-blob.sql
-- @Descripción: Vistas con BLOB para el sitio sakccbdd_s2 (Sur).

set serveroutput on
Prompt Creando vistas con BLOB en sakccbdd_s2 ...

/* LAPTOP
 *  - Aquí el BLOB es LOCAL (laptop_foto_f1_sakcc_s2).
 *    Aprovechamos esto: ya no usamos función, hacemos join directo.
 */
create or replace view laptop as
select  l.laptop_id,
        l.num_serie,
        l.cantidad_ram,
        l.caracteristicas_extras,
        l.tipo_tarjeta_video_id,
        l.tipo_procesador_id,
        l.tipo_almacenamiento_id,
        l.tipo_monitor_id,
        l.laptop_reemplazo_id,
        f.foto
from (
  select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
         tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
         tipo_monitor_id,laptop_reemplazo_id
  from laptop_f1
  union all
  select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
         tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
         tipo_monitor_id,laptop_reemplazo_id
  from laptop_f2
  union all
  select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
         tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
         tipo_monitor_id,laptop_reemplazo_id
  from laptop_f3
  union all
  select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
         tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
         tipo_monitor_id,laptop_reemplazo_id
  from laptop_f4
) l
join laptop_foto_f1 f
  on f.laptop_id = l.laptop_id;

/* SERVICIO_LAPTOP
 *  - fragmento local: servicio_lap_f4
 */
create or replace view servicio_laptop as
select num_servicio,laptop_id,importe,diagnostico,
       get_remote_serv_lap_f1_by_id(num_servicio,laptop_id) factura,
       sucursal_id
from servicio_laptop_f1
union all
select num_servicio,laptop_id,importe,diagnostico,
       get_remote_serv_lap_f2_by_id(num_servicio,laptop_id) factura,
       sucursal_id
from servicio_laptop_f2
union all
select num_servicio,laptop_id,importe,diagnostico,
       get_remote_serv_lap_f3_by_id(num_servicio,laptop_id) factura,
       sucursal_id
from servicio_laptop_f3
union all
select num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id
from servicio_laptop_f4;

Prompt Vistas con BLOB creadas en sakccbdd_s2.

