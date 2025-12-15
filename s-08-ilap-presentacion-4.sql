-- s-08-ilap-presentacion-4.sql
-- @Autor      : SCH / SAKCC
-- @Descripción: Ejecuta el paquete de validación de INSERT/replicados
--               en las 4 PDBs.

clear screen
set serveroutput on

Prompt ======================================
Prompt Validación de INSERT y datos replicados
Prompt ======================================

Prompt Ejecutando en SCHBDD_S1
connect ilap_bdd/ilap_bdd@SCHBDD_S1
@s-08-ilap-presentacion-4.plb

Prompt Ejecutando en SCHBDD_S2
connect ilap_bdd/ilap_bdd@SCHBDD_S2
@s-08-ilap-presentacion-4.plb

Prompt Ejecutando en SAKCCBDD_S1
connect ilap_bdd/ilap_bdd@SAKCCBDD_S1
@s-08-ilap-presentacion-4.plb

Prompt Ejecutando en SAKCCBDD_S2
connect ilap_bdd/ilap_bdd@SAKCCBDD_S2
@s-08-ilap-presentacion-4.plb

Prompt ======================================
Prompt Presentación 4 terminada
Prompt ======================================
exit

