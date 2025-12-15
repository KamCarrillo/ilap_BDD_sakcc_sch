-- s-06-ilap-tipo-procesador-trigger.sql
-- @Descripción : Trigger de replicación síncrona para la vista tipo_procesador.

create or replace trigger t_dml_tipo_procesador
   instead of insert or update or delete on tipo_procesador
declare
   v_count number;
begin
   case
      when inserting then
         v_count := 0;

         insert into tipo_procesador_r1 (tipo_procesador_id, clave, descripcion)
         values (:new.tipo_procesador_id, :new.clave, :new.descripcion);
         v_count := v_count + sql%rowcount;

         insert into tipo_procesador_r2 (tipo_procesador_id, clave, descripcion)
         values (:new.tipo_procesador_id, :new.clave, :new.descripcion);
         v_count := v_count + sql%rowcount;

         insert into tipo_procesador_r3 (tipo_procesador_id, clave, descripcion)
         values (:new.tipo_procesador_id, :new.clave, :new.descripcion);
         v_count := v_count + sql%rowcount;

         insert into tipo_procesador_r4 (tipo_procesador_id, clave, descripcion)
         values (:new.tipo_procesador_id, :new.clave, :new.descripcion);
         v_count := v_count + sql%rowcount;

         if v_count <> 4 then
            raise_application_error(
               -20041,
               'Número incorrecto de registros insertados en tipo_procesador: ' || v_count
            );
         end if;

      when deleting then
         v_count := 0;

         delete from tipo_procesador_r1
         where tipo_procesador_id = :old.tipo_procesador_id;
         v_count := v_count + sql%rowcount;

         delete from tipo_procesador_r2
         where tipo_procesador_id = :old.tipo_procesador_id;
         v_count := v_count + sql%rowcount;

         delete from tipo_procesador_r3
         where tipo_procesador_id = :old.tipo_procesador_id;
         v_count := v_count + sql%rowcount;

         delete from tipo_procesador_r4
         where tipo_procesador_id = :old.tipo_procesador_id;
         v_count := v_count + sql%rowcount;

         if v_count <> 4 then
            raise_application_error(
               -20041,
               'Número incorrecto de registros eliminados en tipo_procesador: ' || v_count
            );
         end if;

      when updating then
         v_count := 0;

         update tipo_procesador_r1
         set clave       = :new.clave,
             descripcion = :new.descripcion
         where tipo_procesador_id = :new.tipo_procesador_id;
         v_count := v_count + sql%rowcount;

         update tipo_procesador_r2
         set clave       = :new.clave,
             descripcion = :new.descripcion
         where tipo_procesador_id = :new.tipo_procesador_id;
         v_count := v_count + sql%rowcount;

         update tipo_procesador_r3
         set clave       = :new.clave,
             descripcion = :new.descripcion
         where tipo_procesador_id = :new.tipo_procesador_id;
         v_count := v_count + sql%rowcount;

         update tipo_procesador_r4
         set clave       = :new.clave,
             descripcion = :new.descripcion
         where tipo_procesador_id = :new.tipo_procesador_id;
         v_count := v_count + sql%rowcount;

         if v_count <> 4 then
            raise_application_error(
               -20041,
               'Número incorrecto de registros actualizados en tipo_procesador: ' || v_count
            );
         end if;
   end case;
end;
/
show errors

