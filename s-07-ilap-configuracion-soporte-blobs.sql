--@Autor: Tu nombre
--@Fecha creación: dd/mm/yyyy
--@Descripción: Script empleado para configurar el
-- Soporte de datos BLOB (directorios + función fx_carga_blob).

Prompt Creando objetos para leer datos BLOB
Prompt creando directorios

-- IMPORTANTE:
-- El usuario ilap_bdd debe tener el privilegio CREATE DIRECTORY
-- (o CREATE ANY DIRECTORY si así lo manejan).

-- Directorio para facturas (PDF/PNG de servicio_laptop)
create or replace directory PROYECTO_FINAL_FACTURAS_DIR
as '/tmp/bdd/proyecto-final/imagenes/facturas';

-- Directorio para fotos de laptops
create or replace directory PROYECTO_FINAL_LAPTOPS_DIR
as '/tmp/bdd/proyecto-final/imagenes/laptops';

Prompt creando funcion para leer datos BLOB

create or replace function fx_carga_blob(
    v_directory_name in varchar2,
    v_src_file_name  in varchar2
) return blob
is
    v_src_blob       bfile := bfilename(v_directory_name, v_src_file_name);
    v_dest_blob      blob  := empty_blob();
    v_src_offset     number := 1;
    v_dest_offset    number := 1;
    v_src_blob_size  number;
begin
    -- Verifica que el archivo exista
    if dbms_lob.fileexists(v_src_blob) = 0 then
        raise_application_error(
            -20001,
            v_src_file_name || ' El archivo no existe '
        );
    end if;

    -- Abre el archivo si no está abierto
    if dbms_lob.isopen(v_src_blob) = 0 then
        dbms_lob.open(v_src_blob, dbms_lob.lob_readonly);
    end if;

    v_src_blob_size := dbms_lob.getlength(v_src_blob);

    -- Crea un LOB temporal en memoria
    dbms_lob.createtemporary(
        lob_loc => v_dest_blob,
        cache   => true,
        dur     => dbms_lob.call
    );

    -- Copia el contenido del archivo al BLOB destino
    dbms_lob.loadblobfromfile(
        dest_lob    => v_dest_blob,
        src_bfile   => v_src_blob,
        amount      => dbms_lob.getlength(v_src_blob),
        dest_offset => v_dest_offset,
        src_offset  => v_src_offset
    );

    -- Cierra el archivo origen
    dbms_lob.close(v_src_blob);

    -- Valida que el tamaño coincida
    if v_src_blob_size <> dbms_lob.getlength(v_dest_blob) then
        raise_application_error(
            -20104,
            'Invalid blob size. Expected: ' || v_src_blob_size ||
            ', actual: ' || dbms_lob.getlength(v_dest_blob)
        );
    end if;

    return v_dest_blob;
end;
/
show errors
