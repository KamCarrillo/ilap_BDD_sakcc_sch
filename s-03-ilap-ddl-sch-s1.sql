whenever sqlerror exit rollback;
set serveroutput on;

PROMPT Borrando tablas del nodo Norte (sch_s1) si existen...

-- Vamos de HIJAS -> PADRES para no tener problemas con las FK

BEGIN
  -- Servicio
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE servicio_laptop_f1_sch_s1 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Histórico de estatus
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE historico_status_laptop_f1_sch_s1 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Inventario vertical
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE laptop_inventario_f1_sch_s1 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Laptop
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE laptop_f1_sch_s1 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Sucursal derivadas
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE sucursal_taller_f1_sch_s1 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE sucursal_venta_f1_sch_s1 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Sucursal base
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE sucursal_f1_sch_s1 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Catálogos replicados
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tipo_monitor_r_sch_s1 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tipo_almacenamiento_r_sch_s1 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tipo_tarjeta_video_r_sch_s1 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tipo_procesador_r_sch_s1 CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;

  -- Catálogo copiado (mismo nombre en todos los nodos)
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE status_laptop CASCADE CONSTRAINTS';
  EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF;
  END;
END;
/
PROMPT Tablas del nodo Norte eliminadas (si existían).
PROMPT Creando tablas del nodo Norte (sch_s1)...

-------------------------------------------------------------------------------
-- 1. STATUS_LAPTOP (copia)
-------------------------------------------------------------------------------
CREATE TABLE status_laptop (
  status_laptop_id  NUMBER(10)    NOT NULL,
  clave             VARCHAR2(40)  NOT NULL,
  descripcion       VARCHAR2(400) NOT NULL,
  CONSTRAINT pk_status_laptop PRIMARY KEY (status_laptop_id)
);

-------------------------------------------------------------------------------
-- 2. Catálogos replicados
-------------------------------------------------------------------------------
CREATE TABLE tipo_procesador_r_sch_s1 (
  tipo_procesador_id  NUMBER(10)    NOT NULL,
  clave               VARCHAR2(40)  NOT NULL,
  descripcion         VARCHAR2(400) NOT NULL,
  CONSTRAINT pk_tipo_procesador_r_sch_s1 PRIMARY KEY (tipo_procesador_id)
);

CREATE TABLE tipo_tarjeta_video_r_sch_s1 (
  tipo_tarjeta_video_id   NUMBER(10)    NOT NULL,
  clave             VARCHAR2(40)  NOT NULL,
  descripcion       VARCHAR2(400) NOT NULL,
  CONSTRAINT pk_tipo_tarjeta_video_r_sch_s1 PRIMARY KEY (tipo_tarjeta_video_id)
);

CREATE TABLE tipo_almacenamiento_r_sch_s1 (
  tipo_almacenamiento_id       NUMBER(10)    NOT NULL,
  clave             VARCHAR2(40)  NOT NULL,
  descripcion       VARCHAR2(400) NOT NULL,
  CONSTRAINT pk_tipo_almacenamiento_r_sch_s1 PRIMARY KEY (tipo_almacenamiento_id)
);

CREATE TABLE tipo_monitor_r_sch_s1 (
  tipo_monitor_id   NUMBER(10)    NOT NULL,
  clave             VARCHAR2(40)  NOT NULL,
  descripcion       VARCHAR2(400) NOT NULL,
  CONSTRAINT pk_tipo_monitor_r_sch_s1 PRIMARY KEY (tipo_monitor_id)
);

-------------------------------------------------------------------------------
-- 3. SUCURSAL_F1_SCH_S1 + derivadas
-------------------------------------------------------------------------------
CREATE TABLE sucursal_f1_sch_s1 (
  sucursal_id   NUMBER(10)    NOT NULL,
  clave         VARCHAR2(10)  NOT NULL,
  es_venta      NUMBER(1)     NOT NULL,
  es_taller     NUMBER(1)     NOT NULL,
  nombre        VARCHAR2(80)  NOT NULL,
  latitud       FLOAT         NOT NULL,
  longitud      FLOAT         NOT NULL,
  url           VARCHAR2(200),
  CONSTRAINT pk_sucursal_f1_sch_s1 PRIMARY KEY (sucursal_id),
  CONSTRAINT uq_sucursal_f1_sch_s1_clave UNIQUE (clave)
);

CREATE TABLE sucursal_venta_f1_sch_s1 (
  sucursal_id   NUMBER(10)  NOT NULL,
  hora_apertura DATE        NOT NULL,
  hora_cierre   DATE        NOT NULL,
  CONSTRAINT pk_sucursal_venta_f1_sch_s1 PRIMARY KEY (sucursal_id),
  CONSTRAINT fk_suc_venta_f1_suc_f1
    FOREIGN KEY (sucursal_id)
    REFERENCES sucursal_f1_sch_s1 (sucursal_id)
);

CREATE TABLE sucursal_taller_f1_sch_s1 (
  sucursal_id        NUMBER(10)    NOT NULL,
  dia_descanso       NUMBER(1)     NOT NULL,
  telefono_atencion  VARCHAR2(40)  NOT NULL,
  CONSTRAINT pk_sucursal_taller_f1_sch_s1 PRIMARY KEY (sucursal_id),
  CONSTRAINT fk_suc_taller_f1_suc_f1
    FOREIGN KEY (sucursal_id)
    REFERENCES sucursal_f1_sch_s1 (sucursal_id)
);

-------------------------------------------------------------------------------
-- 4. LAPTOP_F1_SCH_S1
-------------------------------------------------------------------------------
CREATE TABLE laptop_f1_sch_s1 (
  laptop_id              NUMBER(10)    NOT NULL,
  num_serie              VARCHAR2(18)  NOT NULL,
  cantidad_ram           NUMBER(10)    NOT NULL,
  caracteristicas_extras VARCHAR2(4000),
  tipo_tarjeta_video_id  NUMBER(10)    NOT NULL,
  tipo_procesador_id     NUMBER(10)    NOT NULL,
  tipo_almacenamiento_id NUMBER(10)    NOT NULL,
  tipo_monitor_id        NUMBER(10)    NOT NULL,
  laptop_reemplazo_id    NUMBER(10),
  CONSTRAINT pk_laptop_f1_sch_s1 PRIMARY KEY (laptop_id),
  CONSTRAINT uq_laptop_f1_sch_s1_num_serie UNIQUE (num_serie),
  CONSTRAINT fk_lap_f1_tv_sch_s1
    FOREIGN KEY (tipo_tarjeta_video_id)
    REFERENCES tipo_tarjeta_video_r_sch_s1 (tipo_tarjeta_video_id),
  CONSTRAINT fk_lap_f1_proc_sch_s1
    FOREIGN KEY (tipo_procesador_id)
    REFERENCES tipo_procesador_r_sch_s1 (tipo_procesador_id),
  CONSTRAINT fk_lap_f1_alm_sch_s1
    FOREIGN KEY (tipo_almacenamiento_id)
    REFERENCES tipo_almacenamiento_r_sch_s1 (tipo_almacenamiento_id),
  CONSTRAINT fk_lap_f1_mon_sch_s1
    FOREIGN KEY (tipo_monitor_id)
    REFERENCES tipo_monitor_r_sch_s1 (tipo_monitor_id)
);

-------------------------------------------------------------------------------
-- 5. LAPTOP_INV_F1_SCH_S1
-------------------------------------------------------------------------------
CREATE TABLE laptop_inventario_f1_sch_s1 (
  laptop_id      NUMBER(10)    NOT NULL,
  status_laptop_id  NUMBER(10)    NOT NULL,
  fecha_status   DATE          NOT NULL,
  sucursal_id    NUMBER(10)    NOT NULL,
  CONSTRAINT pk_laptop_inventario_f1_sch_s1 PRIMARY KEY (laptop_id),
  CONSTRAINT fk_lap_inventario_f1_status
    FOREIGN KEY (status_laptop_id)
    REFERENCES status_laptop (status_laptop_id)
);

-------------------------------------------------------------------------------
-- 6. HIST_STATUS_F1_SCH_S1
-------------------------------------------------------------------------------
CREATE TABLE historico_status_laptop_f1_sch_s1 (
  historico_status_laptop_id    NUMBER(10)    NOT NULL,
  laptop_id         NUMBER(10)    NOT NULL,
  status_laptop_id  NUMBER(10)    NOT NULL,
  fecha_status      DATE          NOT NULL,
  CONSTRAINT pk_historico_status_f1_sch_s1 PRIMARY KEY (historico_status_laptop_id),
  CONSTRAINT fk_historico_f1_status
    FOREIGN KEY (status_laptop_id)
    REFERENCES status_laptop (status_laptop_id)
);

-------------------------------------------------------------------------------
-- 7. SERVICIO_LAP_F1_SCH_S1
-------------------------------------------------------------------------------
CREATE TABLE servicio_laptop_f1_sch_s1 (
  num_servicio  NUMBER(10)      NOT NULL,
  laptop_id     NUMBER(10)      NOT NULL,
  importe       NUMBER(8,2)     NOT NULL,
  diagnostico   VARCHAR2(2000)  NOT NULL,
  factura       BLOB,
  sucursal_id   NUMBER(10)      NOT NULL,
  CONSTRAINT pk_servicio_laptop_f1_sch_s1
    PRIMARY KEY (num_servicio, laptop_id),
  CONSTRAINT fk_serv_laptop_f1_suc_taller_f1
    FOREIGN KEY (sucursal_id)
    REFERENCES sucursal_taller_f1_sch_s1 (sucursal_id)
);

PROMPT Nodo Norte (sch_s1) terminado.

