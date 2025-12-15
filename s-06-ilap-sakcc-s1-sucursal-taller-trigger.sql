--@Autor: SCH / SAKCC
--@Fecha: dd/mm/yyyy
--@Descripción: Trigger INSTEAD OF para vista global SUCURSAL_TALLER (INSERT/DELETE)

create or replace trigger t_dml_sucursal_taller
instead of insert or update or delete on sucursal_taller
declare
  v_count number := 0;
begin
  if updating then
    raise_application_error(-20030,'UPDATE no implementado para SUCURSAL_TALLER');
  end if;

  if inserting then
    -- Inserta en el fragmento donde existe el padre SUCURSAL y es taller
    insert into sucursal_taller_f1(sucursal_id,dia_descanso,telefono_atencion)
      select :new.sucursal_id,:new.dia_descanso,:new.telefono_atencion
      from sucursal_f1 where sucursal_id=:new.sucursal_id and es_taller=1;
    v_count := v_count + sql%rowcount;

    insert into sucursal_taller_f2(sucursal_id,dia_descanso,telefono_atencion)
      select :new.sucursal_id,:new.dia_descanso,:new.telefono_atencion
      from sucursal_f2 where sucursal_id=:new.sucursal_id and es_taller=1;
    v_count := v_count + sql%rowcount;

    insert into sucursal_taller_f3(sucursal_id,dia_descanso,telefono_atencion)
      select :new.sucursal_id,:new.dia_descanso,:new.telefono_atencion
      from sucursal_f3 where sucursal_id=:new.sucursal_id and es_taller=1;
    v_count := v_count + sql%rowcount;

    insert into sucursal_taller_f4(sucursal_id,dia_descanso,telefono_atencion)
      select :new.sucursal_id,:new.dia_descanso,:new.telefono_atencion
      from sucursal_f4 where sucursal_id=:new.sucursal_id and es_taller=1;
    v_count := v_count + sql%rowcount;

    if v_count <> 1 then
      raise_application_error(-20020,'No se localizó SUCURSAL padre (derivada) o no es taller. count='||v_count);
    end if;

  elsif deleting then
    v_count := 0;
    delete from sucursal_taller_f1 where sucursal_id=:old.sucursal_id; v_count := v_count + sql%rowcount;
    delete from sucursal_taller_f2 where sucursal_id=:old.sucursal_id; v_count := v_count + sql%rowcount;
    delete from sucursal_taller_f3 where sucursal_id=:old.sucursal_id; v_count := v_count + sql%rowcount;
    delete from sucursal_taller_f4 where sucursal_id=:old.sucursal_id; v_count := v_count + sql%rowcount;

    if v_count <> 1 then
      raise_application_error(-20020,'No se localizó registro en fragmento derivado SUCURSAL_TALLER. count='||v_count);
    end if;
  end if;
end;
/
show errors
