--Autor: Samuel Chong Hernández
--Fecha: 09 de diciembre, 2025
--Descripción: este código crea las tablas para el nodo este

whenever sqlerror exit rollback;
set serveroutput on;

PROMPT Borrando tablas del nodo Este (sch_s2) si existen...

BEGIN
  -- Servicio
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE servicio_laptop_f2_sch_s2 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Histórico
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE historico_status_laptop_f2_sch_s2 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Laptop
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE laptop_f2_sch_s2 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Sucursal derivadas
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE sucursal_taller_f2_sch_s2 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE sucursal_venta_f2_sch_s2 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Sucursal base
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE sucursal_f2_sch_s2 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Catálogos replicados
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tipo_monitor_r_sch_s2 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tipo_almacenamiento_r_sch_s2 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tipo_tarjeta_video_r_sch_s2 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tipo_procesador_r_sch_s2 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE status_laptop CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;
END;
/
PROMPT Tablas del nodo Este eliminadas (si existían).
PROMPT Creando tablas del nodo Este (sch_s2)...

CREATE TABLE status_laptop (
  status_laptop_id  NUMBER(10)    NOT NULL,
  clave             VARCHAR2(40)  NOT NULL,
  descripcion       VARCHAR2(400) NOT NULL,
  CONSTRAINT pk_status_laptop PRIMARY KEY (status_laptop_id)
);

-- 2. Catálogos replicados
CREATE TABLE tipo_procesador_r_sch_s2 (
  tipo_procesador_id  NUMBER(10)    NOT NULL,
  clave               VARCHAR2(40)  NOT NULL,
  descripcion         VARCHAR2(400) NOT NULL,
  CONSTRAINT pk_tipo_procesador_r_sch_s2 PRIMARY KEY (tipo_procesador_id)
);

CREATE TABLE tipo_tarjeta_video_r_sch_s2 (
  tipo_tarjeta_video_id   NUMBER(10)    NOT NULL,
  clave             VARCHAR2(40)  NOT NULL,
  descripcion       VARCHAR2(400) NOT NULL,
  CONSTRAINT pk_tipo_tarjeta_video_r_sch_s2 PRIMARY KEY (tipo_tarjeta_video_id)
);

CREATE TABLE tipo_almacenamiento_r_sch_s2 (
  tipo_almacenamiento_id       NUMBER(10)    NOT NULL,
  clave             VARCHAR2(40)  NOT NULL,
  descripcion       VARCHAR2(400) NOT NULL,
  CONSTRAINT pk_tipo_almacenamiento_r_sch_s2 PRIMARY KEY (tipo_almacenamiento_id)
);

CREATE TABLE tipo_monitor_r_sch_s2 (
  tipo_monitor_id   NUMBER(10)    NOT NULL,
  clave             VARCHAR2(40)  NOT NULL,
  descripcion       VARCHAR2(400) NOT NULL,
  CONSTRAINT pk_tipo_monitor_r_sch_s2 PRIMARY KEY (tipo_monitor_id)
);

-- 3. Fragmentos de SUCURSAL para el nodo Este
------------------------------------------------------------------------------

CREATE TABLE sucursal_f2_sch_s2 (
  sucursal_id   NUMBER(10)    NOT NULL,
  clave         VARCHAR2(10)  NOT NULL,
  es_venta      NUMBER(1)     NOT NULL,
  es_taller     NUMBER(1)     NOT NULL,
  nombre        VARCHAR2(80)  NOT NULL,
  latitud       FLOAT         NOT NULL,
  longitud      FLOAT         NOT NULL,
  url           VARCHAR2(200),
  CONSTRAINT pk_sucursal_f2_sch_s2 PRIMARY KEY (sucursal_id),
  CONSTRAINT uq_sucursal_f2_sch_s2_clave UNIQUE (clave)
);

CREATE TABLE sucursal_venta_f2_sch_s2 (
  sucursal_id   NUMBER(10)  NOT NULL,
  hora_apertura DATE        NOT NULL,
  hora_cierre   DATE        NOT NULL,
  CONSTRAINT pk_sucursal_venta_f2_sch_s2 PRIMARY KEY (sucursal_id),
  CONSTRAINT fk_suc_venta_f2_suc_f2
    FOREIGN KEY (sucursal_id)
    REFERENCES sucursal_f2_sch_s2 (sucursal_id)
);

CREATE TABLE sucursal_taller_f2_sch_s2 (
  sucursal_id        NUMBER(10)    NOT NULL,
  dia_descanso       NUMBER(1)     NOT NULL,
  telefono_atencion  VARCHAR2(40)  NOT NULL,
  CONSTRAINT pk_sucursal_taller_f2_sch_s2 PRIMARY KEY (sucursal_id),
  CONSTRAINT fk_suc_taller_f2_suc_f2
    FOREIGN KEY (sucursal_id)
    REFERENCES sucursal_f2_sch_s2 (sucursal_id)
);

------------------------------------------------------------------------------
-- 4. Fragmento LAPTOP_F2_SCH_S2 (datos generales sin foto) 
------------------------------------------------------------------------------

CREATE TABLE laptop_f2_sch_s2 (
  laptop_id              NUMBER(10)    NOT NULL,
  num_serie              VARCHAR2(18)  NOT NULL,
  cantidad_ram           NUMBER(10)    NOT NULL,
  caracteristicas_extras VARCHAR2(4000),
  tipo_tarjeta_video_id  NUMBER(10)    NOT NULL,
  tipo_procesador_id     NUMBER(10)    NOT NULL,
  tipo_almacenamiento_id NUMBER(10)    NOT NULL,
  tipo_monitor_id        NUMBER(10)    NOT NULL,
  laptop_reemplazo_id    NUMBER(10),
  CONSTRAINT pk_laptop_f2_sch_s2 PRIMARY KEY (laptop_id),
  CONSTRAINT uq_laptop_f2_sch_s2_num_serie UNIQUE (num_serie),
  CONSTRAINT fk_lap_f2_tv_sch_s2
    FOREIGN KEY (tipo_tarjeta_video_id)
    REFERENCES tipo_tarjeta_video_r_sch_s2 (tipo_tarjeta_video_id),
  CONSTRAINT fk_lap_f2_proc_sch_s2
    FOREIGN KEY (tipo_procesador_id)
    REFERENCES tipo_procesador_r_sch_s2 (tipo_procesador_id),
  CONSTRAINT fk_lap_f2_alm_sch_s2
    FOREIGN KEY (tipo_almacenamiento_id)
    REFERENCES tipo_almacenamiento_r_sch_s2 (tipo_almacenamiento_id),
  CONSTRAINT fk_lap_f2_mon_sch_s2
    FOREIGN KEY (tipo_monitor_id)
    REFERENCES tipo_monitor_r_sch_s2 (tipo_monitor_id)
);

------------------------------------------------------------------------------
-- 5. Fragmento HIST_STATUS_F2_SCH_S2 (histórico reciente) 
------------------------------------------------------------------------------

CREATE TABLE historico_status_laptop_f2_sch_s2 (
  historico_status_id    NUMBER(10)    NOT NULL,
  laptop_id         NUMBER(10)    NOT NULL,
  status_laptop_id  NUMBER(10)    NOT NULL,
  fecha_status      DATE          NOT NULL,
  CONSTRAINT pk_historico_status_f2_sch_s2 PRIMARY KEY (historico_status_id),
  CONSTRAINT fk_historico_f2_status
    FOREIGN KEY (status_laptop_id)
    REFERENCES status_laptop (status_laptop_id)
);

------------------------------------------------------------------------------
-- 6. Fragmento derivado SERVICIO_LAP_F2_SCH_S2 
------------------------------------------------------------------------------

CREATE TABLE servicio_laptop_f2_sch_s2 (
  num_servicio  NUMBER(10)      NOT NULL,
  laptop_id     NUMBER(10)      NOT NULL,
  importe       NUMBER(8,2)     NOT NULL,
  diagnostico   VARCHAR2(2000)  NOT NULL,
  factura       BLOB,
  sucursal_id   NUMBER(10)      NOT NULL,
  CONSTRAINT pk_servicio_laptop_f2_sch_s2
    PRIMARY KEY (num_servicio, laptop_id),
  CONSTRAINT fk_serv_laptop_f2_suc_taller_f2
    FOREIGN KEY (sucursal_id)
    REFERENCES sucursal_taller_f2_sch_s2 (sucursal_id)
);

