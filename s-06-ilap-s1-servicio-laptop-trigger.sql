-- s-06-ilap-jrc-s1-servicio-laptop-trigger.sql
-- @Autor       : SCH / SAKCC
-- @Fecha       : dd/mm/yyyy
-- @Descripción : Trigger INSTEAD OF para vista SERVICIO_LAPTOP
--                Fragmentación horizontal derivada de SUCURSAL_TALLER
--                (co-localiza el servicio con la sucursal taller).

set serveroutput on
prompt Creando trigger sobre vista SERVICIO_LAPTOP ...

create or replace trigger trg_servicio_laptop_jrc_s1_io
instead of insert or delete or update on servicio_laptop
declare
    v_count number := 0;
begin
    if inserting then
        -- Insertamos en el fragmento donde exista la sucursal taller.
        insert into servicio_laptop_f1(
          num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id
        )
        select :new.num_servicio,:new.laptop_id,:new.importe,
               :new.diagnostico,:new.factura,:new.sucursal_id
        from sucursal_taller_f1
        where sucursal_id = :new.sucursal_id;
        v_count := v_count + sql%rowcount;

        insert into servicio_laptop_f2(
          num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id
        )
        select :new.num_servicio,:new.laptop_id,:new.importe,
               :new.diagnostico,:new.factura,:new.sucursal_id
        from sucursal_taller_f2
        where sucursal_id = :new.sucursal_id;
        v_count := v_count + sql%rowcount;

        insert into servicio_laptop_f3(
          num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id
        )
        select :new.num_servicio,:new.laptop_id,:new.importe,
               :new.diagnostico,:new.factura,:new.sucursal_id
        from sucursal_taller_f3
        where sucursal_id = :new.sucursal_id;
        v_count := v_count + sql%rowcount;

        insert into servicio_laptop_f4(
          num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id
        )
        select :new.num_servicio,:new.laptop_id,:new.importe,
               :new.diagnostico,:new.factura,:new.sucursal_id
        from sucursal_taller_f4
        where sucursal_id = :new.sucursal_id;
        v_count := v_count + sql%rowcount;

        if v_count <> 1 then
            raise_application_error(
              -20020,
              'Fragmentación derivada SERVICIO_LAPTOP incorrecta. Registros afectados: '
              || v_count
            );
        end if;

    elsif deleting then
        v_count := 0;

        delete from servicio_laptop_f1
        where num_servicio = :old.num_servicio
          and laptop_id    = :old.laptop_id;
        v_count := v_count + sql%rowcount;

        delete from servicio_laptop_f2
        where num_servicio = :old.num_servicio
          and laptop_id    = :old.laptop_id;
        v_count := v_count + sql%rowcount;

        delete from servicio_laptop_f3
        where num_servicio = :old.num_servicio
          and laptop_id    = :old.laptop_id;
        v_count := v_count + sql%rowcount;

        delete from servicio_laptop_f4
        where num_servicio = :old.num_servicio
          and laptop_id    = :old.laptop_id;
        v_count := v_count + sql%rowcount;

        if v_count <> 1 then
            raise_application_error(
              -20020,
              'El registro SERVICIO_LAPTOP no se encontró en exactamente un fragmento. Afectados: '
              || v_count
            );
        end if;

    else
        raise_application_error(
            -20030,
            'Operación UPDATE aún no implementada sobre vista SERVICIO_LAPTOP.'
        );
    end if;
end;
/
show errors
