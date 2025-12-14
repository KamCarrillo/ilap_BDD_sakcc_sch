--@Autor: SCH / SAKCC
--@Fecha creación: dd/mm/yyyy
--@Descripción: Script encargado de crear la BDD
clear screen
whenever sqlerror exit rollback;
Prompt Iniciando con la creación de la BDD.
@s-01-ilap-main-usuario.sql
@s-02-ilap-ligas.sql
@s-03-ilap-main-ddl.sql
@s-04-ilap-main-sinonimos.sql
@s-05-ilap-main-vistas.sql
@s-06-ilap-main-triggers.sql
@s-07-ilap-main-soporte-blobs.sql
Prompt Listo !