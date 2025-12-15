--@Autor: SCH / SAKCC
--@Fecha: dd/mm/yyyy
--@Descripción: Trigger INSTEAD OF para vista global LAPTOP_INVENTARIO (vertical)

create or replace trigger t_dml_laptop_inventario
instead of insert or update or delete on laptop_inventario
declare
  v_count number := 0;
begin
  if updating then
    raise_application_error(-20030,'UPDATE no implementado para LAPTOP_INVENTARIO');
  end if;

  if inserting then
    -- Parte NO (processing): fragmento f1
    insert into laptop_inventario_f1(laptop_id,status_laptop_id,fecha_status,sucursal_id)
    values(:new.laptop_id,:new.status_laptop_id,:new.fecha_status,:new.sucursal_id);
    v_count := v_count + sql%rowcount;

    -- Parte WS (security): fragmento f2
    insert into laptop_inventario_f2(laptop_id,rfc_cliente,num_tarjeta)
    values(:new.laptop_id,:new.rfc_cliente,:new.num_tarjeta);
    v_count := v_count + sql%rowcount;

    if v_count <> 2 then
      raise_application_error(-20020,'Fallo fragmentación vertical LAPTOP_INVENTARIO. count='||v_count);
    end if;

  elsif deleting then
    v_count := 0;
    delete from laptop_inventario_f1 where laptop_id=:old.laptop_id; v_count := v_count + sql%rowcount;
    delete from laptop_inventario_f2 where laptop_id=:old.laptop_id; v_count := v_count + sql%rowcount;

    if v_count <> 2 then
      raise_application_error(-20020,'No se localizaron ambas partes verticales LAPTOP_INVENTARIO. count='||v_count);
    end if;
  end if;
end;
/
show errors
