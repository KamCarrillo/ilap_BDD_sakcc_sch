-- s-08-ilap-presentacion-1.sql
-- @Autor        : SCH / SAKCC
-- @Fecha        : dd/mm/yyyy
-- @Descripción  : Script encargado de crear la BDD completa.

clear screen
whenever sqlerror exit rollback;

Prompt ==========================================
Prompt Iniciando con la creación de la BDD
Prompt ==========================================

@s-01-ilap-main-usuario.sql
@s-02-ilap-ligas.sql
@s-03-ilap-main-ddl-sch.sql      -- tu main de tablas (SCH + SAKCC)
@s-04-ilap-main-sinonimos-sch.sql
@s-05-ilap-main-vistas.sql
@s-06-ilap-main-triggers.sql
@s-07-ilap-main-soporte-blobs.sql

Prompt ==========================================
Prompt BDD creada correctamente
Prompt ==========================================

exit

