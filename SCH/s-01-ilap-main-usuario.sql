--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: Creación de usuarios en los 4 nodos
clear screen
whenever sqlerror exit rollback;
set serveroutput on
Prompt Iniciando creación/eliminación de usuarios.
accept syspass char prompt 'Proporcione el password de sys: ' hide

prompt =====================================
prompt Creando usuario en schbdd_s1
prompt =====================================
connect sys/&&syspass@schbdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en schbdd_s2
prompt =====================================
connect sys/&&syspass@schbdd_s2 as sysdba
@s-01-ilap-usuario.sql