-- s-05-ilap-main-vistas.sql
-- @Autor        : SCH / SAKCC
-- @Fecha        : dd/mm/yyyy
-- @Descripción  : Script maestro para crear vistas (sin y con BLOB),
--                 tablas temporales y funciones BLOB en todos los nodos.

whenever sqlerror exit rollback
set serveroutput on

Prompt ============================================
Prompt Creando vistas sin BLOB, tablas temporales
Prompt y funciones BLOB en schbdd_s1
Prompt ============================================

connect ilap_bdd/ilap_bdd@schbdd_s1

@s-05-ilap-vistas.sql
@s-05-ilap-tablas-temporales.sql
@s-05-ilap-funciones-blob.sql
@s-05-ilap-sch-s1-vistas-blob.sql

Prompt ============================================
Prompt Creando vistas en schbdd_s2
Prompt ============================================

connect ilap_bdd/ilap_bdd@schbdd_s2

@s-05-ilap-vistas.sql
@s-05-ilap-tablas-temporales.sql
@s-05-ilap-funciones-blob.sql
@s-05-ilap-sch-s2-vistas-blob.sql

Prompt ============================================
Prompt Creando vistas en sakccbdd_s1
Prompt ============================================

connect ilap_bdd/ilap_bdd@sakccbdd_s1

@s-05-ilap-vistas.sql
@s-05-ilap-tablas-temporales.sql
@s-05-ilap-funciones-blob.sql
@s-05-ilap-sakcc-s1-vistas-blob.sql

Prompt ============================================
Prompt Creando vistas en sakccbdd_s2
Prompt ============================================

connect ilap_bdd/ilap_bdd@sakccbdd_s2

@s-05-ilap-vistas.sql
@s-05-ilap-tablas-temporales.sql
@s-05-ilap-funciones-blob.sql
@s-05-ilap-sakcc-s2-vistas-blob.sql

Prompt ============================================
Prompt Listo! Vistas y funciones de BLOB creadas
Prompt ============================================

exit

