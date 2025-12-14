--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: Script de eliminación de datos
Prompt Seleccionar la PDB para realizar la eliminación de datos
connect netmax_bdd/ilap_bdd@&pdb
set serveroutput on
Prompt Eliminando datos ...
declare
v_formato varchar2(50) := 'yyy-mm-dd hh24:mi:ss';
begin
dbms_output.put_line(to_char(sysdate,v_formato)
|| ' Eliminando datos de playlist');
delete from historico_status_laptop;
--completar
commit;
exception
when others then
dbms_output.put_line('Errores detectados al realizar la eliminación');
dbms_output.put_line('Se hara rollback');
dbms_output.put_line(dbms_utility.format_error_backtrace);
rollback;
raise;
end;
/
Prompt Listo!
exit