--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: Archivo de carga inicial para catálogos replicados.
clear screen
whenever sqlerror exit rollback;
--Para visualizar export NLS_LANG=SPANISH_SPAIN.WE8ISO8859P1
Prompt ======================================
Prompt Cargando catálogos de forma manual en jrcbdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@jrcbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;
Prompt ======================================
Prompt Cargando catálogos de forma manual en jrcbdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@jrcbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;
Prompt ======================================
Prompt Cargando catálogos de forma manual en arcbdd_s1
Prompt ======================================
connect ilap_bdd/ilap_bdd@arcbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;
Prompt ======================================
Prompt Cargando catálogos de forma manual en arcbdd_s2
Prompt ======================================
connect ilap_bdd/ilap_bdd@arcbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;
Prompt Listo!
exit