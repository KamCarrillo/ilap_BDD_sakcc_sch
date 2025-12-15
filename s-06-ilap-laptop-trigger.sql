-- INSTEAD OF sobre vista LAPTOP (INSERT/DELETE). Foto se guarda remoto en Sur.

create or replace trigger t_dml_laptop
instead of insert or update or delete on laptop
declare
  v_d1 char(1);
begin
  if updating then
    raise_application_error(-20030,'UPDATE no implementado para LAPTOP');
  end if;

  if inserting then
    if :new.num_serie is null then
      raise_application_error(-20010,'NUM_SERIE nulo en LAPTOP');
    end if;

    v_d1 := substr(:new.num_serie,1,1);

    -- 0-1 -> F1 (NO), 2-3 -> F4 (SO), 4-5 -> F3 (WS), 6-9 -> F2 (EA)
    if v_d1 in ('0','1') then
      insert into laptop_f1(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
        tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,laptop_reemplazo_id)
      values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
        :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_reemplazo_id);

    elsif v_d1 in ('2','3') then
      insert into laptop_f4(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
        tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,laptop_reemplazo_id)
      values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
        :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_reemplazo_id);

    elsif v_d1 in ('4','5') then
      insert into laptop_f3(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
        tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,laptop_reemplazo_id)
      values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
        :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_reemplazo_id);

    elsif v_d1 in ('6','7','8','9') then
      insert into laptop_f2(laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
        tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,tipo_monitor_id,laptop_reemplazo_id)
      values(:new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
        :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,:new.tipo_monitor_id,:new.laptop_reemplazo_id);
    else
      raise_application_error(-20010,'No cumple fragmentación primaria LAPTOP (1er dígito='||v_d1||')');
    end if;

    -- FOTO: dueño = Sur => ejecutar procedimiento remoto
    if :new.foto is not null then
      sp_set_laptop_foto_f1@sakccbdd_s2.fi.unam(:new.laptop_id, :new.foto);
    end if;

  elsif deleting then
    v_d1 := substr(:old.num_serie,1,1);

    if v_d1 in ('0','1') then
      delete from laptop_f1 where laptop_id=:old.laptop_id;
    elsif v_d1 in ('2','3') then
      delete from laptop_f4 where laptop_id=:old.laptop_id;
    elsif v_d1 in ('4','5') then
      delete from laptop_f3 where laptop_id=:old.laptop_id;
    elsif v_d1 in ('6','7','8','9') then
      delete from laptop_f2 where laptop_id=:old.laptop_id;
    else
      raise_application_error(-20010,'No cumple fragmentación primaria LAPTOP (1er dígito='||v_d1||')');
    end if;

    -- borrar foto en Sur (si existe)
    sp_del_laptop_foto_f1@sakccbdd_s2.fi.unam(:old.laptop_id);
  end if;
end;
/
show errors
