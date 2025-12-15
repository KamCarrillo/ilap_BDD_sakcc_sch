clear screen
whenever sqlerror exit rollback;

PROMPT ============================================
PROMPT Nodo Norte (schbdd_s1 - sch_s1)
PROMPT ============================================
connect ilap_bdd/ilap_bdd@schbdd_s1
@s-03-ilap-sch-s2-ddl.sql

PROMPT ============================================
PROMPT Nodo Este (schbdd_s2 - sch_s2)
PROMPT ============================================
connect ilap_bdd/ilap_bdd@schbdd_s2
@s-03-ilap-sch-s2-ddl.sql

PROMPT ============================================
PROMPT Nodo OESTE (sakccbdd_s1 - sakcc_s2)
PROMPT ============================================
connect ilap_bdd/ilap_bdd@sakccbdd_s1
@s-03-ilap-sakcc-s1-ddl.sql

PROMPT ============================================
PROMPT Nodo SUR (sakccbdd_s2 - sakcc_s2)
PROMPT ============================================
connect ilap_bdd/ilap_bdd@sakccbdd_s2
@s-03-ilap-sakcc-s2-ddl.sql


Prompt Listo!

DISCONNECT
EXIT