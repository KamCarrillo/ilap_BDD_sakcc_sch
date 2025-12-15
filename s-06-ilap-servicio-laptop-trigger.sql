create or replace trigger t_dml_servicio_laptop
instead of insert or update or delete on servicio_laptop
declare
  v_frag number := 0;
  v_count number := 0;
begin
  if updating then
    raise_application_error(-20030,'UPDATE no implementado para SERVICIO_LAPTOP');
  end if;

  select case
           when exists(select 1 from sucursal_taller_f1 where sucursal_id = nvl(:new.sucursal_id,:old.sucursal_id)) then 1
           when exists(select 1 from sucursal_taller_f2 where sucursal_id = nvl(:new.sucursal_id,:old.sucursal_id)) then 2
           when exists(select 1 from sucursal_taller_f3 where sucursal_id = nvl(:new.sucursal_id,:old.sucursal_id)) then 3
           when exists(select 1 from sucursal_taller_f4 where sucursal_id = nvl(:new.sucursal_id,:old.sucursal_id)) then 4
           else 0
         end
    into v_frag
  from dual;

  if v_frag = 0 then
    raise_application_error(-20020,'No se localizó sucursal_taller padre para SERVICIO_LAPTOP');
  end if;

  if inserting then
    if v_frag = 1 then
      insert into servicio_laptop_f1(num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id)
      values(:new.num_servicio,:new.laptop_id,:new.importe,:new.diagnostico,null,:new.sucursal_id);
      if :new.factura is not null then
        sp_set_factura_f1(:new.num_servicio,:new.laptop_id,:new.factura);
      end if;

    elsif v_frag = 2 then
      insert into servicio_laptop_f2(...) values(...,null,...);
      if :new.factura is not null then sp_set_factura_f2(:new.num_servicio,:new.laptop_id,:new.factura); end if;

    elsif v_frag = 3 then
      insert into servicio_laptop_f3(...) values(...,null,...);
      if :new.factura is not null then sp_set_factura_f3(:new.num_servicio,:new.laptop_id,:new.factura); end if;

    else
      insert into servicio_laptop_f4(...) values(...,null,...);
      if :new.factura is not null then sp_set_factura_f4(:new.num_servicio,:new.laptop_id,:new.factura); end if;
    end if;

  elsif deleting then
    v_count := 0;
    delete from servicio_laptop_f1 where num_servicio=:old.num_servicio and laptop_id=:old.laptop_id; v_count := v_count + sql%rowcount;
    delete from servicio_laptop_f2 where num_servicio=:old.num_servicio and laptop_id=:old.laptop_id; v_count := v_count + sql%rowcount;
    delete from servicio_laptop_f3 where num_servicio=:old.num_servicio and laptop_id=:old.laptop_id; v_count := v_count + sql%rowcount;
    delete from servicio_laptop_f4 where num_servicio=:old.num_servicio and laptop_id=:old.laptop_id; v_count := v_count + sql%rowcount;

    if v_count <> 1 then
      raise_application_error(-20020,'No se localizó registro en fragmento derivado SERVICIO_LAPTOP. count='||v_count);
    end if;
  end if;
end;
/
show errors
