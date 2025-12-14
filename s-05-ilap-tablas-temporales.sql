-- s-05-ilap-tablas-temporales.sql
-- @Autor        : SCH / SAKCC
-- @Fecha        : dd/mm/yyyy
-- @Descripción  : Creación de tablas temporales para manejo de BLOBs.

set serveroutput on

Prompt Eliminando tablas temporales en caso de existir ...

declare
  cursor cur_tablas is
    select table_name
    from user_tables
    where table_name in ('TI_LAPTOP_F1','TS_LAPTOP_F1')
       or table_name like 'TI_SERVICIO_LAPTOP_F%'
       or table_name like 'TS_SERVICIO_LAPTOP_F%';
begin
  for r in cur_tablas loop
    execute immediate 'drop table ' || r.table_name;
  end loop;
end;
/
Prompt Tablas temporales eliminadas.

/***************************************************************************
 * TABLAS TEMPORALES PARA LAPTOP (foto)
 *  - ts_laptop_f1 : SELECT (lectura de BLOB)
 *  - ti_laptop_f1 : INSERT (carga de BLOB)
 ***************************************************************************/
Prompt Creando tablas temporales para LAPTOP ...

create global temporary table ti_laptop_f1(
  laptop_id number(10,0) constraint ti_laptop_f1_pk primary key,
  foto      blob not null
) on commit preserve rows;

create global temporary table ts_laptop_f1(
  laptop_id number(10,0) constraint ts_laptop_f1_pk primary key,
  foto      blob not null
) on commit preserve rows;

/***************************************************************************
 * TABLAS TEMPORALES PARA SERVICIO_LAPTOP (factura)
 *  - ti_servicio_laptop_fN : INSERT
 *  - ts_servicio_laptop_fN : SELECT
 ***************************************************************************/
Prompt Creando tablas temporales para SERVICIO_LAPTOP ...

-- Fragmento 1
create global temporary table ti_servicio_laptop_f1(
  num_servicio number(10,0) not null,
  laptop_id    number(10,0) not null,
  importe      number(8,2)   not null,
  diagnostico  varchar2(2000) not null,
  factura      blob,
  sucursal_id  number(10,0) not null,
  constraint ti_servicio_laptop_f1_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;

create global temporary table ts_servicio_laptop_f1(
  num_servicio number(10,0) not null,
  laptop_id    number(10,0) not null,
  importe      number(8,2)   not null,
  diagnostico  varchar2(2000) not null,
  factura      blob,
  sucursal_id  number(10,0) not null,
  constraint ts_servicio_laptop_f1_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;

-- Fragmento 2
create global temporary table ti_servicio_laptop_f2(
  num_servicio number(10,0) not null,
  laptop_id    number(10,0) not null,
  importe      number(8,2)   not null,
  diagnostico  varchar2(2000) not null,
  factura      blob,
  sucursal_id  number(10,0) not null,
  constraint ti_servicio_laptop_f2_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;

create global temporary table ts_servicio_laptop_f2(
  num_servicio number(10,0) not null,
  laptop_id    number(10,0) not null,
  importe      number(8,2)   not null,
  diagnostico  varchar2(2000) not null,
  factura      blob,
  sucursal_id  number(10,0) not null,
  constraint ts_servicio_laptop_f2_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;

-- Fragmento 3
create global temporary table ti_servicio_laptop_f3(
  num_servicio number(10,0) not null,
  laptop_id    number(10,0) not null,
  importe      number(8,2)   not null,
  diagnostico  varchar2(2000) not null,
  factura      blob,
  sucursal_id  number(10,0) not null,
  constraint ti_servicio_laptop_f3_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;

create global temporary table ts_servicio_laptop_f3(
  num_servicio number(10,0) not null,
  laptop_id    number(10,0) not null,
  importe      number(8,2)   not null,
  diagnostico  varchar2(2000) not null,
  factura      blob,
  sucursal_id  number(10,0) not null,
  constraint ts_servicio_laptop_f3_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;

-- Fragmento 4
create global temporary table ti_servicio_laptop_f4(
  num_servicio number(10,0) not null,
  laptop_id    number(10,0) not null,
  importe      number(8,2)   not null,
  diagnostico  varchar2(2000) not null,
  factura      blob,
  sucursal_id  number(10,0) not null,
  constraint ti_servicio_laptop_f4_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;

create global temporary table ts_servicio_laptop_f4(
  num_servicio number(10,0) not null,
  laptop_id    number(10,0) not null,
  importe      number(8,2)   not null,
  diagnostico  varchar2(2000) not null,
  factura      blob,
  sucursal_id  number(10,0) not null,
  constraint ts_servicio_laptop_f4_pk primary key (num_servicio, laptop_id)
) on commit preserve rows;

Prompt Tablas temporales para BLOB creadas.
