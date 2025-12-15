-- s-08-ilap-presentacion-3.sql
-- @Autor        : SCH / SAKCC
-- @Fecha        : dd/mm/yyyy
-- @Descripción  : Carga inicial de datos usando transparencia
--                 de distribución e imágenes BLOB vacías/llenas.

clear screen
set serveroutput on

-- Para visualizar export NLS_LANG=SPANISH_SPAIN.WE8ISO8859P1

Prompt ======================================
Prompt Preparando carga de datos distribuidos
Prompt ======================================
Prompt => Seleccionar la PDB para insertar datos
Prompt => Asegurarse que las imágenes existen en ambos servidores
Prompt => Ejecutar s-08-ilap-presentacion-3.sh en ambos hosts antes de continuar

connect ilap_bdd/ilap_bdd@&pdb

Prompt Personalizando el formato de fechas
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';

Prompt => Al ocurrir un error se saldrá del programa y se hará rollback
whenever sqlerror exit rollback

Pause => Presionar Enter para Iniciar con la extracción de datos binarios,
Ctrl-C para cancelar

-- Invoca al shell script que copia los archivos
!sh s-08-ilap-presentacion-3.sh

Prompt ==================================================
Prompt ¿ Listo para Iniciar con la carga ?
Prompt ==================================================
Pause => Presionar Enter para Iniciar, Ctrl-C para cancelar

Prompt => Realizando limpieza inicial ....
set feedback off

-- ORDEN DE ELIMINACIÓN (hijos -> padres) USANDO VISTAS GLOBALES

Prompt Eliminando datos de historico_status_laptop
delete from historico_status_laptop;

Prompt Eliminando datos de servicio_laptop
delete from servicio_laptop;

Prompt Eliminando datos de laptop_inventario
delete from laptop_inventario;

Prompt Eliminando datos de laptop
delete from laptop;

Prompt Eliminando datos de sucursal_taller
delete from sucursal_taller;

Prompt Eliminando datos de sucursal_venta
delete from sucursal_venta;

Prompt Eliminando datos de sucursal
delete from sucursal;

Prompt Eliminando datos de catálogos replicados
delete from tipo_tarjeta_video;
delete from tipo_procesador;
delete from tipo_monitor;
delete from tipo_almacenamiento;

-- NO tocamos STATUS_LAPTOP aquí; se carga en Presentación 2

set feedback on

Prompt => Realizando carga de datos ....

-- =======================
-- Catálogos replicados
-- =======================
Prompt cargando tipo_tarjeta_video
@carga-inicial/tipo_tarjeta_video.sql

Prompt cargando tipo_procesador
@carga-inicial/tipo_procesador.sql

Prompt cargando tipo_monitor
@carga-inicial/tipo_monitor.sql

Prompt cargando tipo_almacenamiento
@carga-inicial/tipo_almacenamiento.sql

-- =======================
-- Sucursal y derivados
-- =======================
Prompt cargando sucursal
-- es_venta = 1, es_taller = 0
@carga-inicial/sucursal-1.sql
-- es_venta = 1, es_taller = 1
@carga-inicial/sucursal-2.sql
-- es_venta = 0, es_taller = 1
@carga-inicial/sucursal-3.sql

Prompt cargando sucursal_taller
-- id 1 al 1000
@carga-inicial/sucursal_taller-1.sql
-- id 2001 al 3000
@carga-inicial/sucursal_taller-2.sql

Prompt cargando sucursal_venta
-- id 1001 al 2000
@carga-inicial/sucursal_venta-1.sql
-- id 2001 al 3000
@carga-inicial/sucursal_venta-2.sql

-- =======================
-- LAPTOP (BLOB)
-- =======================
Prompt cargando laptop (con datos BLOB)

-- Primero se proporciona la versión con empty_blob.
-- Tú debes haber:
--   1) Quitado el prefijo "-empty-blob" del nombre,
--   2) Reemplazado empty_blob() por fx_carga_blob(...)

-- Laptops sin reemplazo
@carga-inicial/laptop-1-empty-blob.sql

-- Laptops con posible reemplazo
@carga-inicial/laptop-2-empty-blob.sql

-- =======================
-- Inventario e histórico
-- =======================
Prompt cargando laptop_inventario
@carga-inicial/laptop_inventario.sql

Prompt cargando historico_status_laptop
@carga-inicial/historico_status_laptop-1.sql
@carga-inicial/historico_status_laptop-2.sql

-- =======================
-- SERVICIO_LAPTOP (BLOB)
-- =======================
Prompt cargando servicio_laptop (con datos BLOB)

@carga-inicial/servicio_laptop-1-empty-blob.sql
@carga-inicial/servicio_laptop-2-empty-blob.sql

Prompt Carga de datos completa. Haciendo commit!
commit;

exit

