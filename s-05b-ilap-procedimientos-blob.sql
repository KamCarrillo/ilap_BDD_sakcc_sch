-- s-05b-ilap-procedimientos-blob.sql
-- @Autor: SCH / SAKCC
-- @Fecha: dd/mm/yyyy
-- @Descripción: Procedimientos para ESCRITURA de BLOB usando tablas TI_* + sinónimos.

set serveroutput on

/***************************************************************************
 * FOTO LAPTOP (tabla real: laptop_foto_f1_*; acceso por sinónimo laptop_foto_f1)
 ***************************************************************************/
create or replace procedure sp_set_foto_f1(
  p_laptop_id in number,
  p_foto      in blob
) as
begin
  delete from ti_laptop_f1;
  insert into ti_laptop_f1(laptop_id, foto) values(p_laptop_id, p_foto);

  -- MERGE sobre sinónimo (local o remoto, según el nodo)
  merge into laptop_foto_f1 t
  using (select laptop_id, foto from ti_laptop_f1) s
  on (t.laptop_id = s.laptop_id)
  when matched then update set t.foto = s.foto
  when not matched then insert (laptop_id, foto) values (s.laptop_id, s.foto);

  delete from ti_laptop_f1;
end;
/
show errors

create or replace procedure sp_del_foto_f1(
  p_laptop_id in number
) as
begin
  delete from laptop_foto_f1 where laptop_id = p_laptop_id;
end;
/
show errors


/***************************************************************************
 * FACTURA SERVICIO_LAPTOP (cada fragmento por sinónimo servicio_lap_fN)
 ***************************************************************************/
create or replace procedure sp_set_factura_f1(
  p_num_servicio in number,
  p_laptop_id    in number,
  p_factura      in blob
) as
begin
  delete from ti_servicio_laptop_f1;
  insert into ti_servicio_laptop_f1(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
  values(p_num_servicio,p_laptop_id,0,'',p_factura,0);

  update servicio_laptop_f1
     set factura = (select factura from ti_servicio_laptop_f1
                    where num_servicio=p_num_servicio and laptop_id=p_laptop_id)
   where num_servicio=p_num_servicio and laptop_id=p_laptop_id;

  if sql%rowcount <> 1 then
    raise_application_error(-20020,'No se encontró servicio_lap_f1 para actualizar FACTURA');
  end if;

  delete from ti_servicio_laptop_f1;
end;
/
show errors

create or replace procedure sp_set_factura_f2(
  p_num_servicio in number,
  p_laptop_id    in number,
  p_factura      in blob
) as
begin
  delete from ti_servicio_laptop_f2;
  insert into ti_servicio_laptop_f2(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
  values(p_num_servicio,p_laptop_id,0,'',p_factura,0);

  update servicio_laptop_f2
     set factura = (select factura from ti_servicio_laptop_f2
                    where num_servicio=p_num_servicio and laptop_id=p_laptop_id)
   where num_servicio=p_num_servicio and laptop_id=p_laptop_id;

  if sql%rowcount <> 1 then
    raise_application_error(-20020,'No se encontró servicio_lap_f2 para actualizar FACTURA');
  end if;

  delete from ti_servicio_laptop_f2;
end;
/
show errors

create or replace procedure sp_set_factura_f3(
  p_num_servicio in number,
  p_laptop_id    in number,
  p_factura      in blob
) as
begin
  delete from ti_servicio_laptop_f3;
  insert into ti_servicio_laptop_f3(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
  values(p_num_servicio,p_laptop_id,0,'',p_factura,0);

  update servicio_laptop_f3
     set factura = (select factura from ti_servicio_laptop_f3
                    where num_servicio=p_num_servicio and laptop_id=p_laptop_id)
   where num_servicio=p_num_servicio and laptop_id=p_laptop_id;

  if sql%rowcount <> 1 then
    raise_application_error(-20020,'No se encontró servicio_lap_f3 para actualizar FACTURA');
  end if;

  delete from ti_servicio_laptop_f3;
end;
/
show errors

create or replace procedure sp_set_factura_f4(
  p_num_servicio in number,
  p_laptop_id    in number,
  p_factura      in blob
) as
begin
  delete from ti_servicio_laptop_f4;
  insert into ti_servicio_laptop_f4(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
  values(p_num_servicio,p_laptop_id,0,'',p_factura,0);

  update servicio_laptop_f4
     set factura = (select factura from ti_servicio_laptop_f4
                    where num_servicio=p_num_servicio and laptop_id=p_laptop_id)
   where num_servicio=p_num_servicio and laptop_id=p_laptop_id;

  if sql%rowcount <> 1 then
    raise_application_error(-20020,'No se encontró servicio_lap_f4 para actualizar FACTURA');
  end if;

  delete from ti_servicio_laptop_f4;
end;
/
show errors

prompt Procedimientos BLOB (TI/TS) creados.
