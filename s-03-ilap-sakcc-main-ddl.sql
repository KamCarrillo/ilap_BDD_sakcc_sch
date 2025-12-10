clear screen
whenever sqlerror exit rollback;

prompt Creando Fragmentos para sakccbdd_s1
connect ilap_bdd/ilap_bdd@sakccbdd_s1
@s-03-ilap-sakcc-s1-ddl.sql

prompt Creando fragmentos para sakccbdd_s2
connect ilap_bdd/ilap_bdd@sakccbdd_s2
@s-03-ilap-sakcc-s2-ddl.sql


Prompt Listo!

