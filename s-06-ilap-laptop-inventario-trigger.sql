-- s-06-ilap-laptop-inventario-trigger.sql
-- INSTEAD OF DML sobre vista LAPTOP_INVENTARIO (derivada de LAPTOP)

create or replace trigger trg_laptop_inventario_io
instead of insert or delete on laptop_inventario
declare
  v_digit number;
  v_num_serie varchar2(18);
begin
  if inserting then
    -- ubicamos el fragmento del laptop por num_serie (vía vista laptop sin blob o tabla global)
    select num_serie into v_num_serie
    from laptop
    where laptop_id = :new.laptop_id;

    v_digit := to_number(substr(v_num_serie,1,1));

    if v_digit between 0 and 1 then
      insert into laptop_inventario_f1 (laptop_id, sucursal_id, existencia, fecha_alta)
      values (:new.laptop_id,:new.sucursal_id,:new.existencia,:new.fecha_alta);

    elsif v_digit between 2 and 3 then
      insert into laptop_inventario_f4 (laptop_id, sucursal_id, existencia, fecha_alta)
      values (:new.laptop_id,:new.sucursal_id,:new.existencia,:new.fecha_alta);

    elsif v_digit between 4 and 5 then
      insert into laptop_inventario_f3 (laptop_id, sucursal_id, existencia, fecha_alta)
      values (:new.laptop_id,:new.sucursal_id,:new.existencia,:new.fecha_alta);

    else
      insert into laptop_inventario_f2 (laptop_id, sucursal_id, existencia, fecha_alta)
      values (:new.laptop_id,:new.sucursal_id,:new.existencia,:new.fecha_alta);
    end if;

  elsif deleting then
    -- borramos en los 4 (debe existir solo en 1)
    delete from laptop_inventario_f1 where laptop_id=:old.laptop_id;
    delete from laptop_inventario_f2 where laptop_id=:old.laptop_id;
    delete from laptop_inventario_f3 where laptop_id=:old.laptop_id;
    delete from laptop_inventario_f4 where laptop_id=:old.laptop_id;
  end if;
end;
/
show errors
