-- s-06-ilap-sucursal-trigger.sql
-- INSTEAD OF DML sobre vista SUCURSAL (fragmentación primaria por zona + regla NO / ambas funciones)

create or replace trigger trg_sucursal_io
instead of insert or delete on sucursal
declare
  v_zona varchar2(2);
begin
  if inserting then
    v_zona := substr(:new.clave,3,2);

    if (:new.es_venta=1 and :new.es_taller=1) or v_zona='NO' then
      insert into sucursal_f1 (sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
      values (:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);

    elsif v_zona='EA' then
      insert into sucursal_f2 (sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
      values (:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);

    elsif v_zona='WS' then
      insert into sucursal_f3 (sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
      values (:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);

    elsif v_zona='SO' then
      insert into sucursal_f4 (sucursal_id,clave,es_taller,es_venta,nombre,latitud,longitud,url)
      values (:new.sucursal_id,:new.clave,:new.es_taller,:new.es_venta,:new.nombre,:new.latitud,:new.longitud,:new.url);

    else
      raise_application_error(-20010,'Zona inválida en clave: '||:new.clave);
    end if;

  elsif deleting then
    v_zona := substr(:old.clave,3,2);

    if (:old.es_venta=1 and :old.es_taller=1) or v_zona='NO' then
      delete from sucursal_f1 where sucursal_id=:old.sucursal_id;
    elsif v_zona='EA' then
      delete from sucursal_f2 where sucursal_id=:old.sucursal_id;
    elsif v_zona='WS' then
      delete from sucursal_f3 where sucursal_id=:old.sucursal_id;
    elsif v_zona='SO' then
      delete from sucursal_f4 where sucursal_id=:old.sucursal_id;
    else
      raise_application_error(-20011,'No se pudo ubicar sucursal en fragmento. clave='||:old.clave);
    end if;
  end if;
end;
/
show errors
