-- @Descripción: API BLOB para FOTO (dueño = Sur sakccbdd_s2)

create or replace procedure sp_set_laptop_foto_f1(
  p_laptop_id in number,
  p_foto      in blob
) as
begin
  merge into laptop_foto_f1 t
  using (select p_laptop_id laptop_id, p_foto foto from dual) s
  on (t.laptop_id = s.laptop_id)
  when matched then update set t.foto = s.foto
  when not matched then insert (laptop_id, foto) values (s.laptop_id, s.foto);
end;
/
show errors

create or replace function get_remote_foto_f1_by_id(
  p_laptop_id in number
) return blob
is
  v_foto blob;
begin
  select foto into v_foto
  from laptop_foto_f1
  where laptop_id = p_laptop_id;

  return v_foto;
exception
  when no_data_found then
    return null;
end;
/
show errors

create or replace procedure sp_del_laptop_foto_f1(
  p_laptop_id in number
) as
begin
  delete from laptop_foto_f1 where laptop_id = p_laptop_id;
end;
/
show errors
