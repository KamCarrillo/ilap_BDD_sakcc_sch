-- @Descripción: Función remota para leer FOTO desde Sur (sakccbdd_s2)

create or replace function get_remote_foto_f1_by_id(
  p_laptop_id in number
) return blob
is
  v_foto blob;
begin
  select foto into v_foto
  from laptop_foto_f1@sakccbdd_s2.fi.unam
  where laptop_id = p_laptop_id;

  return v_foto;
exception
  when no_data_found then
    return null;
end;
/
show errors
