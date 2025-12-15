-- s-02-ilap-ligas.sql
-- @Autor: Tu equipo
-- @Descripción: Creación de ligas (database links) en los 4 nodos.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

-------------------------------------------------------------------------------
-- Helper para borrar un DB link si existe
-------------------------------------------------------------------------------
DECLARE
  PROCEDURE drop_link_if_exists(p_name IN VARCHAR2) IS
  BEGIN
    EXECUTE IMMEDIATE 'DROP DATABASE LINK ' || p_name;
  EXCEPTION
    WHEN OTHERS THEN
      -- ORA-02024: database link not found
      IF SQLCODE != -2024 THEN
        RAISE;
      END IF;
  END;
BEGIN
  NULL;
END;
/
-------------------------------------------------------------------------------
-- 1) Ligas en SCHBDD_S1
-------------------------------------------------------------------------------
prompt =====================================
prompt Creando ligas en schbdd_s1
prompt =====================================

connect ilap_bdd/ilap_bdd@schbdd_s1

DECLARE
  PROCEDURE drop_link_if_exists(p_name IN VARCHAR2) IS
  BEGIN
    EXECUTE IMMEDIATE 'DROP DATABASE LINK ' || p_name;
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE != -2024 THEN
        RAISE;
      END IF;
  END;
BEGIN
  drop_link_if_exists('SCHBDD_S2.FI.UNAM');
  drop_link_if_exists('SAKCCBDD_S1.FI.UNAM');
  drop_link_if_exists('SAKCCBDD_S2.FI.UNAM');
END;
/
-- PDB local
CREATE DATABASE LINK schbdd_s2.fi.unam USING 'SCHBDD_S2';
-- PDB remotas
CREATE DATABASE LINK sakccbdd_s1.fi.unam USING 'SAKCCBDD_S1';
CREATE DATABASE LINK sakccbdd_s2.fi.unam USING 'SAKCCBDD_S2';

-------------------------------------------------------------------------------
-- 2) Ligas en SCHBDD_S2
-------------------------------------------------------------------------------
prompt =====================================
prompt Creando ligas en schbdd_s2
prompt =====================================

connect ilap_bdd/ilap_bdd@schbdd_s2

DECLARE
  PROCEDURE drop_link_if_exists(p_name IN VARCHAR2) IS
  BEGIN
    EXECUTE IMMEDIATE 'DROP DATABASE LINK ' || p_name;
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE != -2024 THEN
        RAISE;
      END IF;
  END;
BEGIN
  drop_link_if_exists('SCHBDD_S1.FI.UNAM');
  drop_link_if_exists('SAKCCBDD_S1.FI.UNAM');
  drop_link_if_exists('SAKCCBDD_S2.FI.UNAM');
END;
/
-- PDB local
CREATE DATABASE LINK schbdd_s1.fi.unam USING 'SCHBDD_S1';
-- PDB remotas
CREATE DATABASE LINK sakccbdd_s1.fi.unam USING 'SAKCCBDD_S1';
CREATE DATABASE LINK sakccbdd_s2.fi.unam USING 'SAKCCBDD_S2';

-------------------------------------------------------------------------------
-- 3) Ligas en SAKCCBDD_S1
-------------------------------------------------------------------------------
prompt =====================================
prompt Creando ligas en sakccbdd_s1
prompt =====================================

connect ilap_bdd/ilap_bdd@sakccbdd_s1

DECLARE
  PROCEDURE drop_link_if_exists(p_name IN VARCHAR2) IS
  BEGIN
    EXECUTE IMMEDIATE 'DROP DATABASE LINK ' || p_name;
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE != -2024 THEN
        RAISE;
      END IF;
  END;
BEGIN
  drop_link_if_exists('SAKCCBDD_S2.FI.UNAM');
  drop_link_if_exists('SCHBDD_S1.FI.UNAM');
  drop_link_if_exists('SCHBDD_S2.FI.UNAM');
END;
/
-- PDB local
CREATE DATABASE LINK sakccbdd_s2.fi.unam USING 'SAKCCBDD_S2';
-- PDB remotas
CREATE DATABASE LINK schbdd_s1.fi.unam USING 'SCHBDD_S1';
CREATE DATABASE LINK schbdd_s2.fi.unam USING 'SCHBDD_S2';

-------------------------------------------------------------------------------
-- 4) Ligas en SAKCCBDD_S2
-------------------------------------------------------------------------------
prompt =====================================
prompt Creando ligas en sakccbdd_s2
prompt =====================================

connect ilap_bdd/ilap_bdd@sakccbdd_s2

DECLARE
  PROCEDURE drop_link_if_exists(p_name IN VARCHAR2) IS
  BEGIN
    EXECUTE IMMEDIATE 'DROP DATABASE LINK ' || p_name;
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE != -2024 THEN
        RAISE;
      END IF;
  END;
BEGIN
  drop_link_if_exists('SAKCCBDD_S1.FI.UNAM');
  drop_link_if_exists('SCHBDD_S1.FI.UNAM');
  drop_link_if_exists('SCHBDD_S2.FI.UNAM');
END;
/
-- PDB local
CREATE DATABASE LINK sakccbdd_s1.fi.unam USING 'SAKCCBDD_S1';
-- PDB remotas
CREATE DATABASE LINK schbdd_s1.fi.unam USING 'SCHBDD_S1';
CREATE DATABASE LINK schbdd_s2.fi.unam USING 'SCHBDD_S2';

prompt =====================================
prompt Ligas creadas correctamente en los 4 nodos
prompt =====================================

disconnect
exit

