-- @Autor       : Samuel Chong (SCH)
-- @Fecha       : 09/12/2025
-- @Descripción : Script principal para crear los fragmentos de iLap
--                en los nodos de SCH (Norte y Este).

CLEAR SCREEN
WHENEVER SQLERROR EXIT ROLLBACK;
SET SERVEROUTPUT ON

PROMPT ============================================
PROMPT Creación de fragmentos iLap - Lado SCH
PROMPT ============================================

ACCEPT ilappass CHAR PROMPT 'Proporcione el password de ilap_bdd: ' HIDE

PROMPT
PROMPT ============================================
PROMPT Nodo Norte (schbdd_s1 - sch_s1)
PROMPT ============================================

CONNECT ilap_bdd/&&ilappass@SCHBDD_S1
@s-03-ilap-ddl-sch-s1.sql

PROMPT
PROMPT ============================================
PROMPT Nodo Este (schbdd_s2 - sch_s2)
PROMPT ============================================

CONNECT ilap_bdd/&&ilappass@SCHBDD_S2
@s-03-ilap-ddl-sch-s2.sql

PROMPT
PROMPT ============================================
PROMPT Fragmentos creados correctamente (lado SCH)
PROMPT ============================================

DISCONNECT
EXIT

