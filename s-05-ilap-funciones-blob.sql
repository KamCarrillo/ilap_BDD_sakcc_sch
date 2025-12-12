-- s-05-ilap-funciones-blob.sql
-- @Autor        : SCH / SAKCC
-- @Fecha        : dd/mm/yyyy
-- @Descripción  : Funciones para manejo de datos BLOB vía tablas temporales.

set serveroutput on

/***************************************************************************
 * Funciones para foto de LAPTOP
 *  - La tabla que contiene el BLOB es laptop_foto_f1 (vertical).
 *    Se accede siempre vía sinónimo laptop_foto_f1.
 ***************************************************************************/

create or replace function get_remote_foto_f1_by_id(
  p_laptop_id in number
) return blob
is
  v_foto blob;
begin
  -- Limpia la tabla temporal
  delete from ts_laptop_f1;

  -- Inserta el BLOB (local o remoto vía sinónimo)
  insert into ts_laptop_f1 (laptop_id, foto)
  select laptop_id, foto
  from   laptop_foto_f1
  where  laptop_id = p_laptop_id;

  select foto
  into   v_foto
  from   ts_laptop_f1
  where  laptop_id = p_laptop_id;

  return v_foto;

exception
  when no_data_found then
    return null;
end;
/
show errors

/***************************************************************************
 * Funciones para factura de SERVICIO_LAPTOP
 *  - Cada fragmento servicio_lap_fN tiene su propia factura (BLOB).
 *  - Desde cada nodo, los fragmentos remotos se alcanzan vía sinónimos
 *    servicio_lap_f1, servicio_lap_f2, servicio_lap_f3, servicio_lap_f4.
 ***************************************************************************/

create or replace function get_remote_serv_lap_f1_by_id(
  p_num_servicio in number,
  p_laptop_id    in number
) return blob
is
  v_factura blob;
begin
  delete from ts_servicio_laptop_f1;

  insert into ts_servicio_laptop_f1(
    num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id
  )
  select num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id
  from   servicio_lap_f1
  where  num_servicio = p_num_servicio
  and    laptop_id    = p_laptop_id;

  select factura
  into   v_factura
  from   ts_servicio_laptop_f1
  where  num_servicio = p_num_servicio
  and    laptop_id    = p_laptop_id;

  return v_factura;

exception
  when no_data_found then
    return null;
end;
/
show errors

create or replace function get_remote_serv_lap_f2_by_id(
  p_num_servicio in number,
  p_laptop_id    in number
) return blob
is
  v_factura blob;
begin
  delete from ts_servicio_laptop_f2;

  insert into ts_servicio_laptop_f2(
    num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id
  )
  select num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id
  from   servicio_lap_f2
  where  num_servicio = p_num_servicio
  and    laptop_id    = p_laptop_id;

  select factura
  into   v_factura
  from   ts_servicio_laptop_f2
  where  num_servicio = p_num_servicio
  and    laptop_id    = p_laptop_id;

  return v_factura;

exception
  when no_data_found then
    return null;
end;
/
show errors

create or replace function get_remote_serv_lap_f3_by_id(
  p_num_servicio in number,
  p_laptop_id    in number
) return blob
is
  v_factura blob;
begin
  delete from ts_servicio_laptop_f3;

  insert into ts_servicio_laptop_f3(
    num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id
  )
  select num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id
  from   servicio_lap_f3
  where  num_servicio = p_num_servicio
  and    laptop_id    = p_laptop_id;

  select factura
  into   v_factura
  from   ts_servicio_laptop_f3
  where  num_servicio = p_num_servicio
  and    laptop_id    = p_laptop_id;

  return v_factura;

exception
  when no_data_found then
    return null;
end;
/
show errors

create or replace function get_remote_serv_lap_f4_by_id(
  p_num_servicio in number,
  p_laptop_id    in number
) return blob
is
  v_factura blob;
begin
  delete from ts_servicio_laptop_f4;

  insert into ts_servicio_laptop_f4(
    num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id
  )
  select num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id
  from   servicio_lap_f4
  where  num_servicio = p_num_servicio
  and    laptop_id    = p_laptop_id;

  select factura
  into   v_factura
  from   ts_servicio_laptop_f4
  where  num_servicio = p_num_servicio
  and    laptop_id    = p_laptop_id;

  return v_factura;

exception
  when no_data_found then
    return null;
end;
/
show errors

Prompt Funciones para BLOB creadas.

