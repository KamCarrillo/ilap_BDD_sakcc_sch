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

PROMPT Permisos asignados correctamente.