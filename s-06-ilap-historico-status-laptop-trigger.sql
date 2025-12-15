create or replace trigger trg_hist_status_laptop_io
instead of insert or delete or update on historico_status_laptop
declare
    v_fecha date;
begin
    if inserting then
        if :new.fecha_status is null then
            raise_application_error(-20010, 'Fecha_status nula en HISTORICO_STATUS_LAPTOP.');
        end if;

        v_fecha := trunc(:new.fecha_status);

        -- Lógica de Fragmentación
        if v_fecha < date '2010-01-01' then
            -- Fragmento F2 (Almacenamiento / Histórico antiguo)
            insert into historico_status_laptop_f2(
                historico_status_laptop_id,  -- <--- FALTABA ESTA COLUMNA (PK)
                laptop_id, 
                status_laptop_id, 
                fecha_status
            ) values (
                :new.historico_status_laptop_id, -- <--- Mapeo desde la vista
                :new.laptop_id, 
                :new.status_laptop_id,
                :new.fecha_status
            );
        else
            -- Fragmento F1 (Procesamiento / Reciente)
            insert into historico_status_laptop_f1(
                historico_status_laptop_id,  -- <--- FALTABA ESTA COLUMNA (PK)
                laptop_id, 
                status_laptop_id, 
                fecha_status
            ) values (
                :new.historico_status_laptop_id, -- <--- Mapeo desde la vista
                :new.laptop_id, 
                :new.status_laptop_id,
                :new.fecha_status
            );
        end if;

    elsif deleting then
        v_fecha := trunc(:old.fecha_status);

        if v_fecha < date '2010-01-01' then
            -- Se recomienda borrar por ID para ser preciso
            delete from historico_status_laptop_f2
            where historico_status_laptop_id = :old.historico_status_laptop_id;
        else
            delete from historico_status_laptop_f1
            where historico_status_laptop_id = :old.historico_status_laptop_id;
        end if;

    else
        raise_application_error(-20030, 'Operación UPDATE no implementada.');
    end if;
end;
/
show errors