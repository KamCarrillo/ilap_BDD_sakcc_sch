-- s-06-ilap-tipo-procesador-trigger.sql (DELETE relajado)
-- Trigger de replicación síncrona para la vista tipo_procesador.

CREATE OR REPLACE TRIGGER t_dml_tipo_procesador
   INSTEAD OF INSERT OR UPDATE OR DELETE ON tipo_procesador
DECLARE
   v_count NUMBER;
BEGIN
   CASE
      WHEN INSERTING THEN
         v_count := 0;

         INSERT INTO tipo_procesador_r1 (tipo_procesador_id, clave, descripcion)
         VALUES (:NEW.tipo_procesador_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         INSERT INTO tipo_procesador_r2 (tipo_procesador_id, clave, descripcion)
         VALUES (:NEW.tipo_procesador_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         INSERT INTO tipo_procesador_r3 (tipo_procesador_id, clave, descripcion)
         VALUES (:NEW.tipo_procesador_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         INSERT INTO tipo_procesador_r4 (tipo_procesador_id, clave, descripcion)
         VALUES (:NEW.tipo_procesador_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         -- INSERT estricto: deben insertarse 4 filas
         IF v_count <> 4 THEN
            RAISE_APPLICATION_ERROR(
               -20041,
               'Número incorrecto de registros insertados en tipo_procesador: ' || v_count
            );
         END IF;

      WHEN DELETING THEN
         v_count := 0;

         DELETE FROM tipo_procesador_r1
          WHERE tipo_procesador_id = :OLD.tipo_procesador_id;
         v_count := v_count + SQL%ROWCOUNT;

         DELETE FROM tipo_procesador_r2
          WHERE tipo_procesador_id = :OLD.tipo_procesador_id;
         v_count := v_count + SQL%ROWCOUNT;

         DELETE FROM tipo_procesador_r3
          WHERE tipo_procesador_id = :OLD.tipo_procesador_id;
         v_count := v_count + SQL%ROWCOUNT;

         DELETE FROM tipo_procesador_r4
          WHERE tipo_procesador_id = :OLD.tipo_procesador_id;
         v_count := v_count + SQL%ROWCOUNT;

         -- DELETE relajado: no levantamos error aunque v_count <> 4
         NULL;

      WHEN UPDATING THEN
         v_count := 0;

         UPDATE tipo_procesador_r1
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_procesador_id = :NEW.tipo_procesador_id;
         v_count := v_count + SQL%ROWCOUNT;

         UPDATE tipo_procesador_r2
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_procesador_id = :NEW.tipo_procesador_id;
         v_count := v_count + SQL%ROWCOUNT;

         UPDATE tipo_procesador_r3
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_procesador_id = :NEW.tipo_procesador_id;
         v_count := v_count + SQL%ROWCOUNT;

         UPDATE tipo_procesador_r4
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_procesador_id = :NEW.tipo_procesador_id;
         v_count := v_count + SQL%ROWCOUNT;

         -- UPDATE estricto
         IF v_count <> 4 THEN
            RAISE_APPLICATION_ERROR(
               -20041,
               'Número incorrecto de registros actualizados en tipo_procesador: ' || v_count
            );
         END IF;
   END CASE;
END;
/
SHOW ERRORS TRIGGER t_dml_tipo_procesador;
/

