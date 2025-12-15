------------------------------------------------------------
-- s-06-ilap-laptop-trigger.sql
-- Trigger INSTEAD OF sobre vista LAPTOP (con BLOB)
-- Fragmentación primaria por 1er dígito de NUM_SERIE
--   ('0','1') -> LAPTOP_F1
--   ('2','3') -> LAPTOP_F4
--   ('4','5') -> LAPTOP_F3
--   ('6','7','8','9') -> LAPTOP_F2
------------------------------------------------------------

CREATE OR REPLACE TRIGGER t_dml_laptop
INSTEAD OF INSERT OR UPDATE OR DELETE ON laptop
FOR EACH ROW
DECLARE
    v_digito   CHAR(1);
BEGIN
    ----------------------------------------------------------------
    -- UPDATE: no lo vamos a soportar (se puede simular con DELETE+INSERT)
    ----------------------------------------------------------------
    IF UPDATING THEN
        RAISE_APPLICATION_ERROR(
            -20030,
            'UPDATE no soportado sobre la vista LAPTOP; usa DELETE + INSERT'
        );
    END IF;

    ----------------------------------------------------------------
    -- INSERT
    ----------------------------------------------------------------
    IF INSERTING THEN
        IF :NEW.num_serie IS NULL OR LENGTH(:NEW.num_serie) = 0 THEN
            RAISE_APPLICATION_ERROR(
                -20010,
                'NUM_SERIE es obligatorio para determinar el fragmento de LAPTOP'
            );
        END IF;

        v_digito := SUBSTR(:NEW.num_serie, 1, 1);

        IF v_digito IN ('0','1') THEN
            INSERT INTO laptop_f1 (
                laptop_id,
                num_serie,
                cantidad_ram,
                caracteristicas_extras,
                tipo_tarjeta_video_id,
                tipo_procesador_id,
                tipo_almacenamiento_id,
                tipo_monitor_id,
                laptop_reemplazo_id
            ) VALUES (
                :NEW.laptop_id,
                :NEW.num_serie,
                :NEW.cantidad_ram,
                :NEW.caracteristicas_extras,
                :NEW.tipo_tarjeta_video_id,
                :NEW.tipo_procesador_id,
                :NEW.tipo_almacenamiento_id,
                :NEW.tipo_monitor_id,
                :NEW.laptop_reemplazo_id
            );

        ELSIF v_digito IN ('2','3') THEN
            INSERT INTO laptop_f4 (
                laptop_id,
                num_serie,
                cantidad_ram,
                caracteristicas_extras,
                tipo_tarjeta_video_id,
                tipo_procesador_id,
                tipo_almacenamiento_id,
                tipo_monitor_id,
                laptop_reemplazo_id
            ) VALUES (
                :NEW.laptop_id,
                :NEW.num_serie,
                :NEW.cantidad_ram,
                :NEW.caracteristicas_extras,
                :NEW.tipo_tarjeta_video_id,
                :NEW.tipo_procesador_id,
                :NEW.tipo_almacenamiento_id,
                :NEW.tipo_monitor_id,
                :NEW.laptop_reemplazo_id
            );

        ELSIF v_digito IN ('4','5') THEN
            INSERT INTO laptop_f3 (
                laptop_id,
                num_serie,
                cantidad_ram,
                caracteristicas_extras,
                tipo_tarjeta_video_id,
                tipo_procesador_id,
                tipo_almacenamiento_id,
                tipo_monitor_id,
                laptop_reemplazo_id
            ) VALUES (
                :NEW.laptop_id,
                :NEW.num_serie,
                :NEW.cantidad_ram,
                :NEW.caracteristicas_extras,
                :NEW.tipo_tarjeta_video_id,
                :NEW.tipo_procesador_id,
                :NEW.tipo_almacenamiento_id,
                :NEW.tipo_monitor_id,
                :NEW.laptop_reemplazo_id
            );

        ELSIF v_digito IN ('6','7','8','9') THEN
            INSERT INTO laptop_f2 (
                laptop_id,
                num_serie,
                cantidad_ram,
                caracteristicas_extras,
                tipo_tarjeta_video_id,
                tipo_procesador_id,
                tipo_almacenamiento_id,
                tipo_monitor_id,
                laptop_reemplazo_id
            ) VALUES (
                :NEW.laptop_id,
                :NEW.num_serie,
                :NEW.cantidad_ram,
                :NEW.caracteristicas_extras,
                :NEW.tipo_tarjeta_video_id,
                :NEW.tipo_procesador_id,
                :NEW.tipo_almacenamiento_id,
                :NEW.tipo_monitor_id,
                :NEW.laptop_reemplazo_id
            );

        ELSE
            RAISE_APPLICATION_ERROR(
                -20011,
                'NUM_SERIE de LAPTOP no entra en ningún fragmento: ' || :NEW.num_serie
            );
        END IF;

        -- Manejo del BLOB (foto) centralizado en LAPTOP_FOTO_F1 vía procedimiento
        IF :NEW.foto IS NOT NULL THEN
            sp_set_foto_f1(:NEW.laptop_id, :NEW.foto);
        END IF;

    ----------------------------------------------------------------
    -- DELETE
    ----------------------------------------------------------------
    ELSIF DELETING THEN
        IF :OLD.num_serie IS NULL OR LENGTH(:OLD.num_serie) = 0 THEN
            RAISE_APPLICATION_ERROR(
                -20010,
                'NUM_SERIE es obligatorio para determinar el fragmento de LAPTOP'
            );
        END IF;

        v_digito := SUBSTR(:OLD.num_serie, 1, 1);

        IF v_digito IN ('0','1') THEN
            DELETE FROM laptop_f1
             WHERE laptop_id = :OLD.laptop_id;

        ELSIF v_digito IN ('2','3') THEN
            DELETE FROM laptop_f4
             WHERE laptop_id = :OLD.laptop_id;

        ELSIF v_digito IN ('4','5') THEN
            DELETE FROM laptop_f3
             WHERE laptop_id = :OLD.laptop_id;

        ELSIF v_digito IN ('6','7','8','9') THEN
            DELETE FROM laptop_f2
             WHERE laptop_id = :OLD.laptop_id;

        ELSE
            RAISE_APPLICATION_ERROR(
                -20011,
                'NUM_SERIE de LAPTOP no entra en ningún fragmento: ' || :OLD.num_serie
            );
        END IF;

        -- Limpiar la foto asociada
        DELETE FROM laptop_foto_f1
         WHERE laptop_id = :OLD.laptop_id;
    END IF;
END;
/
SHOW ERRORS TRIGGER t_dml_laptop;
/
