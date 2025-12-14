-- s-06-ilap-historico-status-laptop-trigger.sql
-- @Autor       : SCH / SAKCC
-- @Fecha       : dd/mm/yyyy
-- @Descripción : Trigger INSTEAD OF para vista HISTORICO_STATUS_LAPTOP
--                Fragmentación horizontal por FECHA_STATUS:
--                <= 31-12-2009  -> F2 (almacenamiento)
--                >= 01-01-2010  -> F1 (procesamiento)

set serveroutput on
prompt Creando trigger sobre vista HISTORICO_STATUS_LAPTOP ...

create or replace trigger trg_hist_status_laptop_io
instead of insert or delete or update on historico_status_laptop
declare
    v_fecha date;
begin
    if inserting then
        if :new.fecha_status is null then
            raise_application_error(
                -20010,
                'Fecha_status nula en HISTORICO_STATUS_LAPTOP.'
            );
        end if;

        v_fecha := trunc(:new.fecha_status);

        if v_fecha < date '2010-01-01' then
            insert into historico_status_laptop_f2(
              laptop_id, status_laptop_id, fecha_status, observaciones
            ) values (
              :new.laptop_id, :new.status_laptop_id,
              :new.fecha_status, :new.observaciones
            );
        else
            insert into historico_status_laptop_f1(
              laptop_id, status_laptop_id, fecha_status, observaciones
            ) values (
              :new.laptop_id, :new.status_laptop_id,
              :new.fecha_status, :new.observaciones
            );
        end if;

    elsif deleting then
        v_fecha := trunc(:old.fecha_status);

        if v_fecha < date '2010-01-01' then
            delete from historico_status_laptop_f2
            where laptop_id        = :old.laptop_id
              and status_laptop_id = :old.status_laptop_id
              and fecha_status     = :old.fecha_status;
        else
            delete from historico_status_laptop_f1
            where laptop_id        = :old.laptop_id
              and status_laptop_id = :old.status_laptop_id
              and fecha_status     = :old.fecha_status;
        end if;

    else
        raise_application_error(
            -20030,
            'Operación UPDATE aún no implementada sobre vista HISTORICO_STATUS_LAPTOP.'
        );
    end if;
end;
/
show errors
