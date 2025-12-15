-- s-08-ilap-presentacion-2.sql
-- @Autor        : SCH / SAKCC
-- @Fecha        : dd/mm/yyyy
-- @Descripción  : Carga inicial por copia manual de STATUS_LAPTOP
--                 en las 4 PDBs.

clear screen
whenever sqlerror exit rollback;

-- Para visualizar caracteres con acentos:
-- export NLS_LANG=SPANISH_SPAIN.WE8ISO8859P1

Prompt ======================================
Prompt Cargando STATUS_LAPTOP en schbdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@schbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ======================================
Prompt Cargando STATUS_LAPTOP en schbdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@schbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ======================================
Prompt Cargando STATUS_LAPTOP en sakccbdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@sakccbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt ======================================
Prompt Cargando STATUS_LAPTOP en sakccbdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@sakccbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

Prompt Listo! STATUS_LAPTOP cargado manualmente en los 4 nodos.
exit

