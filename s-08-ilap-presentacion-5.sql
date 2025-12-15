-- s-08-ilap-presentacion-5.sql
-- @Autor        : SCH / SAKCC
-- @Fecha        : dd/mm/yyyy
-- @Descripción  : Script de eliminación de datos en tablas globales
--                 usando una transacción distribuida.

Prompt Seleccionar la PDB para realizar la eliminación de datos
connect ilap_bdd/ilap_bdd@&pdb

set serveroutput on

Prompt Eliminando datos ...

declare
  v_formato varchar2(50) := 'yyyy-mm-dd hh24:mi:ss';
begin
  -- Orden de borrado: hijos -> padres
  dbms_output.put_line(to_char(sysdate, v_formato) ||
                       ' Eliminando datos de historico_status_laptop');
  delete from historico_status_laptop;

  dbms_output.put_line(to_char(sysdate, v_formato) ||
                       ' Eliminando datos de servicio_laptop');
  delete from servicio_laptop;

  dbms_output.put_line(to_char(sysdate, v_formato) ||
                       ' Eliminando datos de laptop_inventario');
  delete from laptop_inventario;

  dbms_output.put_line(to_char(sysdate, v_formato) ||
                       ' Eliminando datos de laptop');
  delete from laptop;

  dbms_output.put_line(to_char(sysdate, v_formato) ||
                       ' Eliminando datos de sucursal_taller');
  delete from sucursal_taller;

  dbms_output.put_line(to_char(sysdate, v_formato) ||
                       ' Eliminando datos de sucursal_venta');
  delete from sucursal_venta;

  dbms_output.put_line(to_char(sysdate, v_formato) ||
                       ' Eliminando datos de sucursal');
  delete from sucursal;

  dbms_output.put_line(to_char(sysdate, v_formato) ||
                       ' Eliminando datos de catálogos replicados');
  delete from tipo_tarjeta_video;
  delete from tipo_procesador;
  delete from tipo_monitor;
  delete from tipo_almacenamiento;

  -- NO borramos STATUS_LAPTOP aquí; se recarga en presentacion-2
  dbms_output.put_line(to_char(sysdate, v_formato) ||
                       ' Eliminacion terminada, haciendo commit');
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

