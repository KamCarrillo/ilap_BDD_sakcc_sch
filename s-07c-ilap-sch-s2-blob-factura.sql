create or replace procedure sp_set_servicio_factura(
  p_num_servicio in number,
  p_laptop_id    in number,
  p_factura      in blob
) as
begin
  update servicio_laptop_f2
     set factura = p_factura
   where num_servicio = p_num_servicio
     and laptop_id    = p_laptop_id;

  if sql%rowcount <> 1 then
    raise_application_error(-20020,'No se encontró servicio_laptop_f2 para actualizar FACTURA');
  end if;
end;
/
show errors

create or replace function get_remote_serv_lap_f2_by_id(p_num_servicio number, p_laptop_id number) return blob is v blob;
begin
  select factura into v from servicio_laptop_f2
   where num_servicio=p_num_servicio and laptop_id=p_laptop_id;
  return v; exception when no_data_found then return null;
end;
/
show errors

create or replace function get_remote_serv_lap_f1_by_id(p_num_servicio number, p_laptop_id number) return blob is v blob;
begin
  select factura into v from servicio_laptop_f1@schbdd_s1.fi.unam
   where num_servicio=p_num_servicio and laptop_id=p_laptop_id;
  return v; exception when no_data_found then return null;
end;
/
show errors

create or replace function get_remote_serv_lap_f3_by_id(p_num_servicio number, p_laptop_id number) return blob is v blob;
begin
  select factura into v from servicio_laptop_f3@sakccbdd_s1.fi.unam
   where num_servicio=p_num_servicio and laptop_id=p_laptop_id;
  return v; exception when no_data_found then return null;
end;
/
show errors

create or replace function get_remote_serv_lap_f4_by_id(p_num_servicio number, p_laptop_id number) return blob is v blob;
begin
  select factura into v from servicio_laptop_f4@sakccbdd_s2.fi.unam
   where num_servicio=p_num_servicio and laptop_id=p_laptop_id;
  return v; exception when no_data_found then return null;
end;
/
show errors
