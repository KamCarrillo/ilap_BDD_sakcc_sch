------------------------------------------------------------
-- s-06-ilap-servicio-laptop-trigger.sql
-- Trigger INSTEAD OF sobre vista SERVICIO_LAPTOP (con BLOB)
-- Fragmentación derivada de SUCURSAL_TALLER (F1..F4)
------------------------------------------------------------

CREATE OR REPLACE TRIGGER t_dml_servicio_laptop
INSTEAD OF INSERT OR UPDATE OR DELETE ON servicio_laptop
FOR EACH ROW
DECLARE
    v_fragmento   NUMBER := 0;
    v_sucursal_id sucursal_taller_f1.sucursal_id%TYPE;
BEGIN
    ----------------------------------------------------------------
    -- Determinar fragmento a partir de SUCURSAL_ID (fragmentación derivada)
    ----------------------------------------------------------------
    IF INSERTING OR UPDATING THEN
        v_sucursal_id := COALESCE(:NEW.sucursal_id, :OLD.sucursal_id);

        IF v_sucursal_id IS NULL THEN
            RAISE_APPLICATION_ERROR(
                -20021,
                'sucursal_id obligatorio para SERVICIO_LAPTOP'
            );
        END IF;

        BEGIN
            SELECT fr
            INTO   v_fragmento
            FROM (
                SELECT 1 AS fr
                  FROM sucursal_taller_f1 st
                 WHERE st.sucursal_id = v_sucursal_id
                UNION ALL
                SELECT 2 AS fr
                  FROM sucursal_taller_f2 st
                 WHERE st.sucursal_id = v_sucursal_id
                UNION ALL
                SELECT 3 AS fr
                  FROM sucursal_taller_f3 st
                 WHERE st.sucursal_id = v_sucursal_id
                UNION ALL
                SELECT 4 AS fr
                  FROM sucursal_taller_f4 st
                 WHERE st.sucursal_id = v_sucursal_id
            )
            WHERE ROWNUM = 1;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(
                    -20020,
                    'sucursal_id no pertenece a ningún fragmento de SUCURSAL_TALLER'
                );
        END;
    END IF;

    ----------------------------------------------------------------
    -- INSERT
    ----------------------------------------------------------------
    IF INSERTING THEN

        IF v_fragmento = 1 THEN
            INSERT INTO servicio_laptop_f1 (
                num_servicio,
                laptop_id,
                importe,
                diagnostico,
                sucursal_id
            ) VALUES (
                :NEW.num_servicio,
                :NEW.laptop_id,
                :NEW.importe,
                :NEW.diagnostico,
                v_sucursal_id
            );

            IF :NEW.factura IS NOT NULL THEN
                sp_set_factura_f1(
                    p_num_servicio => :NEW.num_servicio,
                    p_laptop_id    => :NEW.laptop_id,
                    p_factura      => :NEW.factura
                );
            END IF;

        ELSIF v_fragmento = 2 THEN
            INSERT INTO servicio_laptop_f2 (
                num_servicio,
                laptop_id,
                importe,
                diagnostico,
                sucursal_id
            ) VALUES (
                :NEW.num_servicio,
                :NEW.laptop_id,
                :NEW.importe,
                :NEW.diagnostico,
                v_sucursal_id
            );

            IF :NEW.factura IS NOT NULL THEN
                sp_set_factura_f2(
                    p_num_servicio => :NEW.num_servicio,
                    p_laptop_id    => :NEW.laptop_id,
                    p_factura      => :NEW.factura
                );
            END IF;

        ELSIF v_fragmento = 3 THEN
            INSERT INTO servicio_laptop_f3 (
                num_servicio,
                laptop_id,
                importe,
                diagnostico,
                sucursal_id
            ) VALUES (
                :NEW.num_servicio,
                :NEW.laptop_id,
                :NEW.importe,
                :NEW.diagnostico,
                v_sucursal_id
            );

            IF :NEW.factura IS NOT NULL THEN
                sp_set_factura_f3(
                    p_num_servicio => :NEW.num_servicio,
                    p_laptop_id    => :NEW.laptop_id,
                    p_factura      => :NEW.factura
                );
            END IF;

        ELSE  -- v_fragmento = 4
            INSERT INTO servicio_laptop_f4 (
                num_servicio,
                laptop_id,
                importe,
                diagnostico,
                sucursal_id
            ) VALUES (
                :NEW.num_servicio,
                :NEW.laptop_id,
                :NEW.importe,
                :NEW.diagnostico,
                v_sucursal_id
            );

            IF :NEW.factura IS NOT NULL THEN
                sp_set_factura_f4(
                    p_num_servicio => :NEW.num_servicio,
                    p_laptop_id    => :NEW.laptop_id,
                    p_factura      => :NEW.factura
                );
            END IF;
        END IF;

    ----------------------------------------------------------------
    -- DELETE
    ----------------------------------------------------------------
    ELSIF DELETING THEN
        -- Borramos el registro de todos los fragmentos (solo uno coincidirá)
        DELETE FROM servicio_laptop_f1
         WHERE num_servicio = :OLD.num_servicio
           AND laptop_id    = :OLD.laptop_id;

        DELETE FROM servicio_laptop_f2
         WHERE num_servicio = :OLD.num_servicio
           AND laptop_id    = :OLD.laptop_id;

        DELETE FROM servicio_laptop_f3
         WHERE num_servicio = :OLD.num_servicio
           AND laptop_id    = :OLD.laptop_id;

        DELETE FROM servicio_laptop_f4
         WHERE num_servicio = :OLD.num_servicio
           AND laptop_id    = :OLD.laptop_id;

        -- Limpieza de BLOB (factura)
        sp_set_factura_f1(:OLD.num_servicio, :OLD.laptop_id, NULL);
        sp_set_factura_f2(:OLD.num_servicio, :OLD.laptop_id, NULL);
        sp_set_factura_f3(:OLD.num_servicio, :OLD.laptop_id, NULL);
        sp_set_factura_f4(:OLD.num_servicio, :OLD.laptop_id, NULL);

    ----------------------------------------------------------------
    -- UPDATE
    ----------------------------------------------------------------
    ELSIF UPDATING THEN

        -- Si cambia la sucursal, movemos el registro de fragmento
        IF :NEW.sucursal_id IS NOT NULL
           AND :NEW.sucursal_id <> :OLD.sucursal_id THEN

            -- Borramos de todos los fragmentos posibles
            DELETE FROM servicio_laptop_f1
             WHERE num_servicio = :OLD.num_servicio
               AND laptop_id    = :OLD.laptop_id;

            DELETE FROM servicio_laptop_f2
             WHERE num_servicio = :OLD.num_servicio
               AND laptop_id    = :OLD.laptop_id;

            DELETE FROM servicio_laptop_f3
             WHERE num_servicio = :OLD.num_servicio
               AND laptop_id    = :OLD.laptop_id;

            DELETE FROM servicio_laptop_f4
             WHERE num_servicio = :OLD.num_servicio
               AND laptop_id    = :OLD.laptop_id;

            -- Reinsertamos en el nuevo fragmento
            IF v_fragmento = 1 THEN
                INSERT INTO servicio_laptop_f1 (
                    num_servicio, laptop_id, importe, diagnostico, sucursal_id
                ) VALUES (
                    :NEW.num_servicio,
                    :NEW.laptop_id,
                    :NEW.importe,
                    :NEW.diagnostico,
                    v_sucursal_id
                );

                IF :NEW.factura IS NOT NULL THEN
                    sp_set_factura_f1(:NEW.num_servicio, :NEW.laptop_id, :NEW.factura);
                END IF;

            ELSIF v_fragmento = 2 THEN
                INSERT INTO servicio_laptop_f2 (
                    num_servicio, laptop_id, importe, diagnostico, sucursal_id
                ) VALUES (
                    :NEW.num_servicio,
                    :NEW.laptop_id,
                    :NEW.importe,
                    :NEW.diagnostico,
                    v_sucursal_id
                );

                IF :NEW.factura IS NOT NULL THEN
                    sp_set_factura_f2(:NEW.num_servicio, :NEW.laptop_id, :NEW.factura);
                END IF;

            ELSIF v_fragmento = 3 THEN
                INSERT INTO servicio_laptop_f3 (
                    num_servicio, laptop_id, importe, diagnostico, sucursal_id
                ) VALUES (
                    :NEW.num_servicio,
                    :NEW.laptop_id,
                    :NEW.importe,
                    :NEW.diagnostico,
                    v_sucursal_id
                );

                IF :NEW.factura IS NOT NULL THEN
                    sp_set_factura_f3(:NEW.num_servicio, :NEW.laptop_id, :NEW.factura);
                END IF;

            ELSE  -- v_fragmento = 4
                INSERT INTO servicio_laptop_f4 (
                    num_servicio, laptop_id, importe, diagnostico, sucursal_id
                ) VALUES (
                    :NEW.num_servicio,
                    :NEW.laptop_id,
                    :NEW.importe,
                    :NEW.diagnostico,
                    v_sucursal_id
                );

                IF :NEW.factura IS NOT NULL THEN
                    sp_set_factura_f4(:NEW.num_servicio, :NEW.laptop_id, :NEW.factura);
                END IF;
            END IF;

        ELSE
            -- Misma sucursal: actualizamos en todos los fragmentos (solo uno tendrá fila)
            UPDATE servicio_laptop_f1
               SET importe     = :NEW.importe,
                   diagnostico = :NEW.diagnostico
             WHERE num_servicio = :OLD.num_servicio
               AND laptop_id    = :OLD.laptop_id;

            UPDATE servicio_laptop_f2
               SET importe     = :NEW.importe,
                   diagnostico = :NEW.diagnostico
             WHERE num_servicio = :OLD.num_servicio
               AND laptop_id    = :OLD.laptop_id;

            UPDATE servicio_laptop_f3
               SET importe     = :NEW.importe,
                   diagnostico = :NEW.diagnostico
             WHERE num_servicio = :OLD.num_servicio
               AND laptop_id    = :OLD.laptop_id;

            UPDATE servicio_laptop_f4
               SET importe     = :NEW.importe,
                   diagnostico = :NEW.diagnostico
             WHERE num_servicio = :OLD.num_servicio
               AND laptop_id    = :OLD.laptop_id;

            -- Actualizar BLOB solo si llega una nueva factura
            IF :NEW.factura IS NOT NULL THEN
                sp_set_factura_f1(:NEW.num_servicio, :NEW.laptop_id, :NEW.factura);
                sp_set_factura_f2(:NEW.num_servicio, :NEW.laptop_id, :NEW.factura);
                sp_set_factura_f3(:NEW.num_servicio, :NEW.laptop_id, :NEW.factura);
                sp_set_factura_f4(:NEW.num_servicio, :NEW.laptop_id, :NEW.factura);
            END IF;
        END IF;
    END IF;
END;
/
SHOW ERRORS TRIGGER t_dml_servicio_laptop;
/
