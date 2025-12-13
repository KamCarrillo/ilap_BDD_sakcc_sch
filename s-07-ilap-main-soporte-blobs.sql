--@Autor: Tu nombre
--@Fecha creación: dd/mm/yyyy
--@Descripción: Script principal empleado para configurar el soporte
-- de datos BLOB en los 4 nodos (sakcc y sch).

clear screen
whenever sqlerror exit rollback;

Prompt configurando directorios y función fx_carga_blob en todos los nodos

-- sakccbdd_s1
Prompt ==========================================
Prompt Configurando soporte BLOB para sakccbdd_s1
Prompt ==========================================
connect ilap_bdd/ilap_bdd@sakccbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

-- sakccbdd_s2
Prompt ==========================================
Prompt Configurando soporte BLOB para sakccbdd_s2
Prompt ==========================================
connect ilap_bdd/ilap_bdd@sakccbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

-- schbdd_s1
Prompt ==========================================
Prompt Configurando soporte BLOB para schbdd_s1
Prompt ==========================================
connect ilap_bdd/ilap_bdd@schbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

-- schbdd_s2
Prompt ==========================================
Prompt Configurando soporte BLOB para schbdd_s2
Prompt ==========================================
connect ilap_bdd/ilap_bdd@schbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt Listo !
disconnect

