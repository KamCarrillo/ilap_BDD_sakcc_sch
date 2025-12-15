--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: Eliminación y creación del usuario.


Prompt Creando al usuario ilap_bdd
drop user if exists ilap_bdd;

CREATE USER ilap_bdd IDENTIFIED BY ilap_bdd QUOTA UNLIMITED ON USERS;


GRANT CREATE SESSION TO ilap_bdd;

GRANT CREATE TABLE TO ilap_bdd;

GRANT CREATE SEQUENCE TO ilap_bdd;

GRANT CREATE PROCEDURE TO ilap_bdd;

GRANT CREATE VIEW TO ilap_bdd;

GRANT CREATE SYNONYM TO ilap_bdd;

GRANT CREATE DATABASE LINK TO ilap_bdd;

grant create session to ilap_bdd;
grant resource to ilap_bdd;

-- Ya tenías: create table, view, synonym, procedure, database link, etc.
-- Agrega también:
grant create directory to ilap_bdd;
-- o si sigues el ejemplo literal de la guía:
-- grant create any directory to ilap_bdd;


PROMPT Permisos asignados correctamente.
