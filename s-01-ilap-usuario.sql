-- s-01-ilap-usuario.sql
-- Crea el usuario ILAP_BDD en la PDB actual.
-- Si ya existe, lo elimina primero (DROP USER ... CASCADE).

set serveroutput on

prompt =====================================
prompt Verificando y eliminando usuario ILAP_BDD (si existe)...
prompt =====================================

DECLARE
  v_count PLS_INTEGER;
BEGIN
  SELECT COUNT(*)
    INTO v_count
    FROM dba_users
   WHERE username = 'ILAP_BDD';

  IF v_count > 0 THEN
    dbms_output.put_line(' -> Usuario ILAP_BDD existe, se eliminará...');
    EXECUTE IMMEDIATE 'DROP USER ilap_bdd CASCADE';
    dbms_output.put_line(' -> Usuario ILAP_BDD eliminado.');
  ELSE
    dbms_output.put_line(' -> Usuario ILAP_BDD no existe, no se elimina nada.');
  END IF;
END;
/
prompt Listo: el usuario previo (si existía) ya fue eliminado.

prompt =====================================
prompt Creando usuario ILAP_BDD...
prompt =====================================

CREATE USER ilap_bdd
  IDENTIFIED BY ilap_bdd
  QUOTA UNLIMITED ON USERS;

GRANT CREATE SESSION   TO ilap_bdd;
GRANT CONNECT          TO ilap_bdd;
GRANT RESOURCE         TO ilap_bdd;

-- Privilegios típicos para el proyecto
GRANT CREATE TABLE       TO ilap_bdd;
GRANT CREATE SEQUENCE    TO ilap_bdd;
GRANT CREATE VIEW        TO ilap_bdd;
GRANT CREATE PROCEDURE   TO ilap_bdd;
GRANT CREATE SYNONYM     TO ilap_bdd;
GRANT CREATE DATABASE LINK TO ilap_bdd;

prompt Usuario ILAP_BDD creado y con privilegios asignados.

