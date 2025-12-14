-- s-06-ilap-laptop-trigger.sql
-- @Autor       : SCH / SAKCC
-- @Fecha       : dd/mm/yyyy
-- @Descripción : Trigger INSTEAD OF para vista LAPTOP (con BLOB)
--                Fragmentación horizontal primaria por NUM_SERIE
--                y almacenamiento de foto en LAPTOP_FOTO_F1.

set serveroutput on
prompt Creando trigger sobre vista LAPTOP ...

create or replace trigger trg_laptop_io
instead of insert or delete or update on laptop
declare
    v_primera varchar2(1);
begin
    if inserting then
        if :new.num_serie is null then
            raise_application_error(-20010,'NUM_SERIE nulo en LAPTOP.');
        end if;

        v_primera := substr(:new.num_serie,1,1);

        -- Reglas de distribución:
        --  0-1 -> F1 (Norte)
        --  2-3 -> F4 (Sur)
        --  4-5 -> F3 (Oeste)
        --  6-9 -> F2 (Este)

        if v_primera in ('0','1') then
            insert into laptop_f1(
                laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
                tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
                tipo_monitor_id,laptop_reemplazo_id
            ) values (
                :new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
                :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
                :new.tipo_monitor_id,:new.laptop_reemplazo_id
            );

        elsif v_primera in ('6','7','8','9') then
            insert into laptop_f2(
                laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
                tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
                tipo_monitor_id,laptop_reemplazo_id
            ) values (
                :new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
                :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
                :new.tipo_monitor_id,:new.laptop_reemplazo_id
            );

        elsif v_primera in ('4','5') then
            insert into laptop_f3(
                laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
                tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
                tipo_monitor_id,laptop_reemplazo_id
            ) values (
                :new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
                :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
                :new.tipo_monitor_id,:new.laptop_reemplazo_id
            );

        elsif v_primera in ('2','3') then
            insert into laptop_f4(
                laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
                tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
                tipo_monitor_id,laptop_reemplazo_id
            ) values (
                :new.laptop_id,:new.num_serie,:new.cantidad_ram,:new.caracteristicas_extras,
                :new.tipo_tarjeta_video_id,:new.tipo_procesador_id,:new.tipo_almacenamiento_id,
                :new.tipo_monitor_id,:new.laptop_reemplazo_id
            );

        else
            raise_application_error(
                -20010,
                'Violación de fragmentación primaria en LAPTOP. num_serie='||:new.num_serie
            );
        end if;

        -- Foto: siempre en LAPTOP_FOTO_F1 (sitio Sur, vía sinónimo).
        if :new.foto is not null then
            insert into laptop_foto_f1 (laptop_id,foto)
            values (:new.laptop_id,:new.foto);
        end if;

    elsif deleting then
        v_primera := substr(:old.num_serie,1,1);

        if v_primera in ('0','1') then
            delete from laptop_f1 where laptop_id = :old.laptop_id;

        elsif v_primera in ('6','7','8','9') then
            delete from laptop_f2 where laptop_id = :old.laptop_id;

        elsif v_primera in ('4','5') then
            delete from laptop_f3 where laptop_id = :old.laptop_id;

        elsif v_primera in ('2','3') then
            delete from laptop_f4 where laptop_id = :old.laptop_id;

        else
            raise_application_error(
                -20010,
                'Registro LAPTOP no localizado en ningún fragmento para num_serie='||:old.num_serie
            );
        end if;

        delete from laptop_foto_f1 where laptop_id = :old.laptop_id;

    else
        raise_application_error(
            -20030,
            'Operación UPDATE aún no implementada sobre vista LAPTOP.'
        );
    end if;
end;
/
show errors
