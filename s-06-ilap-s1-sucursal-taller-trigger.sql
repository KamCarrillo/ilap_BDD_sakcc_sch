-- s-06-ilap-jrc-s1-sucursal-taller-trigger.sql
-- @Autor       : SCH / SAKCC
-- @Fecha       : dd/mm/yyyy
-- @Descripción : Trigger INSTEAD OF para vista SUCURSAL_TALLER
--                Fragmentación horizontal derivada de SUCURSAL.

set serveroutput on
prompt Creando trigger sobre vista SUCURSAL_TALLER ...

create or replace trigger trg_sucursal_taller_io
instead of insert or delete or update on sucursal_taller
declare
    v_count number := 0;
begin
    if inserting then
        -- Insertamos en el fragmento donde exista la sucursal Y sea taller.
        insert into sucursal_taller_f1 (
            sucursal_id, capacidad_max_taller,
            horario_taller_apertura, horario_taller_cierre
        )
        select :new.sucursal_id, :new.capacidad_max_taller,
               :new.horario_taller_apertura, :new.horario_taller_cierre
        from sucursal_f1
        where sucursal_id = :new.sucursal_id
          and es_taller = 1;
        v_count := v_count + sql%rowcount;

        insert into sucursal_taller_f2 (
            sucursal_id, capacidad_max_taller,
            horario_taller_apertura, horario_taller_cierre
        )
        select :new.sucursal_id, :new.capacidad_max_taller,
               :new.horario_taller_apertura, :new.horario_taller_cierre
        from sucursal_f2
        where sucursal_id = :new.sucursal_id
          and es_taller = 1;
        v_count := v_count + sql%rowcount;

        insert into sucursal_taller_f3 (
            sucursal_id, capacidad_max_taller,
            horario_taller_apertura, horario_taller_cierre
        )
        select :new.sucursal_id, :new.capacidad_max_taller,
               :new.horario_taller_apertura, :new.horario_taller_cierre
        from sucursal_f3
        where sucursal_id = :new.sucursal_id
          and es_taller = 1;
        v_count := v_count + sql%rowcount;

        insert into sucursal_taller_f4 (
            sucursal_id, capacidad_max_taller,
            horario_taller_apertura, horario_taller_cierre
        )
        select :new.sucursal_id, :new.capacidad_max_taller,
               :new.horario_taller_apertura, :new.horario_taller_cierre
        from sucursal_f4
        where sucursal_id = :new.sucursal_id
          and es_taller = 1;
        v_count := v_count + sql%rowcount;

        if v_count <> 1 then
            raise_application_error(
              -20020,
              'Fragmentación derivada SUCURSAL_TALLER incorrecta. Registros afectados: '
              || v_count
            );
        end if;

    elsif deleting then
        v_count := 0;

        delete from sucursal_taller_f1 where sucursal_id = :old.sucursal_id;
        v_count := v_count + sql%rowcount;

        delete from sucursal_taller_f2 where sucursal_id = :old.sucursal_id;
        v_count := v_count + sql%rowcount;

        delete from sucursal_taller_f3 where sucursal_id = :old.sucursal_id;
        v_count := v_count + sql%rowcount;

        delete from sucursal_taller_f4 where sucursal_id = :old.sucursal_id;
        v_count := v_count + sql%rowcount;

        if v_count <> 1 then
            raise_application_error(
              -20020,
              'El registro SUCURSAL_TALLER no se encontró en exactamente un fragmento. Afectados: '
              || v_count
            );
        end if;

    else
        raise_application_error(
            -20030,
            'Operación UPDATE aún no implementada sobre vista SUCURSAL_TALLER.'
        );
    end if;
end;
/
show errors
