-- s-06-ilap-tipo-monitor-trigger.sql (DELETE relajado)
-- Trigger de replicación síncrona para la vista tipo_monitor.

CREATE OR REPLACE TRIGGER t_dml_tipo_monitor
   INSTEAD OF INSERT OR UPDATE OR DELETE ON tipo_monitor
DECLARE
   v_count NUMBER;
BEGIN
   CASE
      WHEN INSERTING THEN
         v_count := 0;

         INSERT INTO tipo_monitor_r1 (tipo_monitor_id, clave, descripcion)
         VALUES (:NEW.tipo_monitor_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         INSERT INTO tipo_monitor_r2 (tipo_monitor_id, clave, descripcion)
         VALUES (:NEW.tipo_monitor_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         INSERT INTO tipo_monitor_r3 (tipo_monitor_id, clave, descripcion)
         VALUES (:NEW.tipo_monitor_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         INSERT INTO tipo_monitor_r4 (tipo_monitor_id, clave, descripcion)
         VALUES (:NEW.tipo_monitor_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         IF v_count <> 4 THEN
            RAISE_APPLICATION_ERROR(
               -20040,
               'Número incorrecto de registros insertados en tipo_monitor: ' || v_count
            );
         END IF;

      WHEN DELETING THEN
         v_count := 0;

         DELETE FROM tipo_monitor_r1
          WHERE tipo_monitor_id = :OLD.tipo_monitor_id;
         v_count := v_count + SQL%ROWCOUNT;

         DELETE FROM tipo_monitor_r2
          WHERE tipo_monitor_id = :OLD.tipo_monitor_id;
         v_count := v_count + SQL%ROWCOUNT;

         DELETE FROM tipo_monitor_r3
          WHERE tipo_monitor_id = :OLD.tipo_monitor_id;
         v_count := v_count + SQL%ROWCOUNT;

         DELETE FROM tipo_monitor_r4
          WHERE tipo_monitor_id = :OLD.tipo_monitor_id;
         v_count := v_count + SQL%ROWCOUNT;

         -- DELETE relajado: no validamos v_count
         NULL;

      WHEN UPDATING THEN
         v_count := 0;

         UPDATE tipo_monitor_r1
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_monitor_id = :NEW.tipo_monitor_id;
         v_count := v_count + SQL%ROWCOUNT;

         UPDATE tipo_monitor_r2
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_monitor_id = :NEW.tipo_monitor_id;
         v_count := v_count + SQL%ROWCOUNT;

         UPDATE tipo_monitor_r3
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_monitor_id = :NEW.tipo_monitor_id;
         v_count := v_count + SQL%ROWCOUNT;

         UPDATE tipo_monitor_r4
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_monitor_id = :NEW.tipo_monitor_id;
         v_count := v_count + SQL%ROWCOUNT;

         IF v_count <> 4 THEN
            RAISE_APPLICATION_ERROR(
               -20040,
               'Número incorrecto de registros actualizados en tipo_monitor: ' || v_count
            );
         END IF;
   END CASE;
END;
/
SHOW ERRORS TRIGGER t_dml_tipo_monitor;
/

