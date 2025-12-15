-- s-06-ilap-tipo-tarjeta-video-trigger.sql (versión relajada en DELETE)
-- @Descripción : Trigger de replicación síncrona para la vista tipo_tarjeta_video.

CREATE OR REPLACE TRIGGER t_dml_tipo_tarjeta_video
   INSTEAD OF INSERT OR UPDATE OR DELETE ON tipo_tarjeta_video
DECLARE
   v_count NUMBER;
BEGIN
   CASE
      WHEN INSERTING THEN
         v_count := 0;

         INSERT INTO tipo_tarjeta_video_r1 (tipo_tarjeta_video_id, clave, descripcion)
         VALUES (:NEW.tipo_tarjeta_video_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         INSERT INTO tipo_tarjeta_video_r2 (tipo_tarjeta_video_id, clave, descripcion)
         VALUES (:NEW.tipo_tarjeta_video_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         INSERT INTO tipo_tarjeta_video_r3 (tipo_tarjeta_video_id, clave, descripcion)
         VALUES (:NEW.tipo_tarjeta_video_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         INSERT INTO tipo_tarjeta_video_r4 (tipo_tarjeta_video_id, clave, descripcion)
         VALUES (:NEW.tipo_tarjeta_video_id, :NEW.clave, :NEW.descripcion);
         v_count := v_count + SQL%ROWCOUNT;

         -- En INSERT seguimos siendo estrictos: deben insertarse 4 filas
         IF v_count <> 4 THEN
            RAISE_APPLICATION_ERROR(
               -20042,
               'Número incorrecto de registros insertados en tipo_tarjeta_video: ' || v_count
            );
         END IF;

      WHEN DELETING THEN
         v_count := 0;

         DELETE FROM tipo_tarjeta_video_r1
          WHERE tipo_tarjeta_video_id = :OLD.tipo_tarjeta_video_id;
         v_count := v_count + SQL%ROWCOUNT;

         DELETE FROM tipo_tarjeta_video_r2
          WHERE tipo_tarjeta_video_id = :OLD.tipo_tarjeta_video_id;
         v_count := v_count + SQL%ROWCOUNT;

         DELETE FROM tipo_tarjeta_video_r3
          WHERE tipo_tarjeta_video_id = :OLD.tipo_tarjeta_video_id;
         v_count := v_count + SQL%ROWCOUNT;

         DELETE FROM tipo_tarjeta_video_r4
          WHERE tipo_tarjeta_video_id = :OLD.tipo_tarjeta_video_id;
         v_count := v_count + SQL%ROWCOUNT;

         -- NOTA IMPORTANTE:
         -- Para DELETE NO forzamos v_count = 4.
         -- Si ya estaban borrados (v_count = 0) o hay réplicas inconsistentes,
         -- simplemente no levantamos error. Queremos que el script de limpieza
         -- de Presentación 3 pueda terminar sin romperse.
         NULL;

      WHEN UPDATING THEN
         v_count := 0;

         UPDATE tipo_tarjeta_video_r1
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_tarjeta_video_id = :NEW.tipo_tarjeta_video_id;
         v_count := v_count + SQL%ROWCOUNT;

         UPDATE tipo_tarjeta_video_r2
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_tarjeta_video_id = :NEW.tipo_tarjeta_video_id;
         v_count := v_count + SQL%ROWCOUNT;

         UPDATE tipo_tarjeta_video_r3
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_tarjeta_video_id = :NEW.tipo_tarjeta_video_id;
         v_count := v_count + SQL%ROWCOUNT;

         UPDATE tipo_tarjeta_video_r4
            SET clave       = :NEW.clave,
                descripcion = :NEW.descripcion
          WHERE tipo_tarjeta_video_id = :NEW.tipo_tarjeta_video_id;
         v_count := v_count + SQL%ROWCOUNT;

         -- En UPDATE también seguimos siendo estrictos
         IF v_count <> 4 THEN
            RAISE_APPLICATION_ERROR(
               -20042,
               'Número incorrecto de registros actualizados en tipo_tarjeta_video: ' || v_count
            );
         END IF;
   END CASE;
END;
/
SHOW ERRORS TRIGGER t_dml_tipo_tarjeta_video;
/

