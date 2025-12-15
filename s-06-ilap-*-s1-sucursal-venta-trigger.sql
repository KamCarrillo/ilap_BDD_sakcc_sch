-- s-06-ilap-*-s?-sucursal-venta-trigger.sql

create or replace trigger trg_sucursal_venta_io
instead of insert or delete on sucursal_venta
declare
  v_count number := 0;
begin
  if inserting then
    insert into sucursal_venta_f1 (sucursal_id,hora_apertura,hora_cierre)
      select :new.sucursal_id,:new.hora_apertura,:new.hora_cierre
      from sucursal_f1 where sucursal_id=:new.sucursal_id and es_venta=1;
    v_count := v_count + sql%rowcount;

    insert into sucursal_venta_f2 (sucursal_id,hora_apertura,hora_cierre)
      select :new.sucursal_id,:new.hora_apertura,:new.hora_cierre
      from sucursal_f2 where sucursal_id=:new.sucursal_id and es_venta=1;
    v_count := v_count + sql%rowcount;

    insert into sucursal_venta_f3 (sucursal_id,hora_apertura,hora_cierre)
      select :new.sucursal_id,:new.hora_apertura,:new.hora_cierre
      from sucursal_f3 where sucursal_id=:new.sucursal_id and es_venta=1;
    v_count := v_count + sql%rowcount;

    insert into sucursal_venta_f4 (sucursal_id,hora_apertura,hora_cierre)
      select :new.sucursal_id,:new.hora_apertura,:new.hora_cierre
      from sucursal_f4 where sucursal_id=:new.sucursal_id and es_venta=1;
    v_count := v_count + sql%rowcount;

    if v_count <> 1 then
      raise_application_error(-20021,'Inserción SUCURSAL_VENTA debe afectar 1 fragmento. Afectó: '||v_count);
    end if;

  elsif deleting then
    delete from sucursal_venta_f1 where sucursal_id=:old.sucursal_id;
    delete from sucursal_venta_f2 where sucursal_id=:old.sucursal_id;
    delete from sucursal_venta_f3 where sucursal_id=:old.sucursal_id;
    delete from sucursal_venta_f4 where sucursal_id=:old.sucursal_id;
  end if;
end;
/
show errors
