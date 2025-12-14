-- s-06-ilap-sucursal-trigger.sql
-- @Autor       : SCH / SAKCC
-- @Fecha       : dd/mm/yyyy
-- @Descripción : INSTEAD OF trigger para vista SUCURSAL
--                Fragmentación horizontal primaria por zona y función.

set serveroutput on
prompt Creando trigger sobre vista SUCURSAL ...

create or replace trigger trg_sucursal_io
instead of insert or delete or update on sucursal
declare
    v_zona  varchar2(2);
begin
    if inserting then
        if :new.clave is null then
            raise_application_error(-20010,'Clave de sucursal nula.');
        end if;

        v_zona := substr(:new.clave,3,2); -- EEZZ000000 (ZZ = zona)

        -- Reglas:
        --  - Todas las sucursales que realizan venta Y taller, o zona NO -> F1 (Norte)
        --  - Zona EA -> F2 (Este)
        --  - Zona WS -> F3 (Oeste)
        --  - Zona SO -> F4 (Sur)

        if (:new.es_venta = 1 and :new.es_taller = 1) or v_zona = 'NO' then
            insert into sucursal_f1 (
                sucursal_id, clave, es_taller, es_venta,
                nombre, latitud, longitud, url
            )
            values (
                :new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta,
                :new.nombre, :new.latitud, :new.longitud, :new.url
            );

        elsif v_zona = 'EA' then
            insert into sucursal_f2 (
                sucursal_id, clave, es_taller, es_venta,
                nombre, latitud, longitud, url
            )
            values (
                :new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta,
                :new.nombre, :new.latitud, :new.longitud, :new.url
            );

        elsif v_zona = 'WS' then
            insert into sucursal_f3 (
                sucursal_id, clave, es_taller, es_venta,
                nombre, latitud, longitud, url
            )
            values (
                :new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta,
                :new.nombre, :new.latitud, :new.longitud, :new.url
            );

        elsif v_zona = 'SO' then
            insert into sucursal_f4 (
                sucursal_id, clave, es_taller, es_venta,
                nombre, latitud, longitud, url
            )
            values (
                :new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta,
                :new.nombre, :new.latitud, :new.longitud, :new.url
            );

        else
            raise_application_error(
                -20010,
                'Violación de fragmentación primaria en SUCURSAL: zona no válida '||v_zona
            );
        end if;

    elsif deleting then
        v_zona := substr(:old.clave,3,2);

        if (:old.es_venta = 1 and :old.es_taller = 1) or v_zona = 'NO' then
            delete from sucursal_f1 where sucursal_id = :old.sucursal_id;

        elsif v_zona = 'EA' then
            delete from sucursal_f2 where sucursal_id = :old.sucursal_id;

        elsif v_zona = 'WS' then
            delete from sucursal_f3 where sucursal_id = :old.sucursal_id;

        elsif v_zona = 'SO' then
            delete from sucursal_f4 where sucursal_id = :old.sucursal_id;

        else
            raise_application_error(
                -20010,
                'Registro SUCURSAL no localizado en ningún fragmento.'
            );
        end if;

    else  -- updating
        raise_application_error(
            -20030,
            'Operación UPDATE aún no implementada sobre vista SUCURSAL.'
        );
    end if;
end;
/
show errors
