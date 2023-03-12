CREATE TABLE RRHH.RH_DEPARTAMENTO
(
  PAIS                      NUMBER(3)           NOT NULL,
  DEPARTAMENTO              NUMBER(3)           NOT NULL,
  NOMBRE_DEPARTAMENTO       VARCHAR2(30 BYTE)   NOT NULL,
  ABREVIATURA_DEPARTAMENTO  VARCHAR2(5 BYTE)    NOT NULL,
  AREA                      VARCHAR2(1 BYTE)    DEFAULT 'P'                   NOT NULL,
  CODIGO_PRESUPUESTARIO     NUMBER(4)           NOT NULL,
  CUOTA_LABORAL_IGSS        NUMBER(8,4)         DEFAULT 0                     NOT NULL,
  CUOTA_PATRONAL_IGSS       NUMBER(8,4)         DEFAULT 0                     NOT NULL,
  CODIGO_BANCARIO           NUMBER(3),
  AREA_GEOGRAFICA           CHAR(1 BYTE)        DEFAULT 'C'                   NOT NULL,
  ID_CEDULA                 VARCHAR2(3 BYTE),
  UCIORDEN                  NUMBER(3)           DEFAULT 999
)
/

COMMENT ON TABLE RRHH.RH_DEPARTAMENTO IS 'Descripcion general de los Departamentos y/o Provincias del Pais';
/
COMMENT ON COLUMN RRHH.RH_DEPARTAMENTO.PAIS IS 'Codigo del pais';
/
COMMENT ON COLUMN RRHH.RH_DEPARTAMENTO.DEPARTAMENTO IS 'Codigo del departamento o provincia';
/
COMMENT ON COLUMN RRHH.RH_DEPARTAMENTO.NOMBRE_DEPARTAMENTO IS 'Nombre del departamento o provincia';
/
COMMENT ON COLUMN RRHH.RH_DEPARTAMENTO.ABREVIATURA_DEPARTAMENTO IS 'Abreviatura del departamento';
/
COMMENT ON COLUMN RRHH.RH_DEPARTAMENTO.AREA IS 'Area geografica donde se encuentra el departamento, CENTRAL, OCCIDENTE, ORIENTE, NORTE, SUR.';
/
COMMENT ON COLUMN RRHH.RH_DEPARTAMENTO.CODIGO_PRESUPUESTARIO IS 'Codigo presupestario definido para este departamento';
/
COMMENT ON COLUMN RRHH.RH_DEPARTAMENTO.CUOTA_LABORAL_IGSS IS 'Porcentaje de la cuota laboral del IGSS para el OJ, segun el departamento.';
/
COMMENT ON COLUMN RRHH.RH_DEPARTAMENTO.CUOTA_PATRONAL_IGSS IS 'Cuotra patronal de IGSS';
/

CREATE INDEX RRHH.XIF2DEPARTAMENTO ON RRHH.RH_DEPARTAMENTO
(PAIS)
LOGGING
TABLESPACE users
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          40K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX RRHH.XPKDEPARTAMENTO ON RRHH.RH_DEPARTAMENTO
(PAIS, DEPARTAMENTO)
LOGGING
TABLESPACE users
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          40K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


GRANT SELECT ON RRHH.RH_DEPARTAMENTO TO SIDEP;
/
GRANT SELECT ON RRHH.TS_TIPO_GESTION TO SIDEP;
/

CREATE TABLE RRHH.RH_MUNICIPIO
(
  PAIS                         NUMBER(3)        NOT NULL,
  DEPARTAMENTO                 NUMBER(3)        NOT NULL,
  MUNICIPIO                    NUMBER(3)        NOT NULL,
  NOMBRE_MUNICIPIO             VARCHAR2(30 BYTE) NOT NULL,
  ABREVIATURA_MUNICIPIO        VARCHAR2(5 BYTE) NOT NULL,
  FECHA_FERIA_LOCAL            DATE             DEFAULT sysdate               NOT NULL,
  FERIA_LOCAL_FIJO             CHAR(1 BYTE)     DEFAULT 'S'                   NOT NULL,
  USUARIO_DEFINIO_FERIA_LOCAL  VARCHAR2(40 BYTE) DEFAULT USER NOT NULL,
  FECHA_ULTIMA_MODIFICACION    DATE             DEFAULT SYSDATE               NOT NULL,
  OBSERVACIONES                VARCHAR2(128 BYTE)
)
/

COMMENT ON TABLE RRHH.RH_MUNICIPIO IS 'Descripcion general de los municipios departamentales.';
/
COMMENT ON COLUMN RRHH.RH_MUNICIPIO.PAIS IS 'Codigo del pais';
/
COMMENT ON COLUMN RRHH.RH_MUNICIPIO.DEPARTAMENTO IS 'Codigo del departamento o provincia';
/
COMMENT ON COLUMN RRHH.RH_MUNICIPIO.MUNICIPIO IS 'Codigo del municipio';
/

COMMENT ON COLUMN RRHH.RH_MUNICIPIO.NOMBRE_MUNICIPIO IS 'Nombre del municipio';
/
COMMENT ON COLUMN RRHH.RH_MUNICIPIO.ABREVIATURA_MUNICIPIO IS 'Abreviatura del municipio departamenta';
/



CREATE UNIQUE INDEX RRHH.XPKMUNICIPIO ON RRHH.RH_MUNICIPIO
(PAIS, DEPARTAMENTO, MUNICIPIO)
LOGGING
TABLESPACE users
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          40K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


ALTER TABLE RRHH.RH_MUNICIPIO ADD (
  CONSTRAINT CK_FERIA_LOCAL_FIJO
  CHECK (feria_local_fijo in ( 'S', 'N' ))
  ENABLE VALIDATE,
  CONSTRAINT XPKMUNICIPIO
  PRIMARY KEY
  (PAIS, DEPARTAMENTO, MUNICIPIO)
  USING INDEX RRHH.XPKMUNICIPIO
  ENABLE VALIDATE);
/
ALTER TABLE RRHH.RH_MUNICIPIO ADD (
  CONSTRAINT R_MUNICIPIO_DEPARTAMENTO 
  FOREIGN KEY (PAIS, DEPARTAMENTO) 
  REFERENCES RRHH.RH_DEPARTAMENTO (PAIS,DEPARTAMENTO)
  ENABLE VALIDATE);
/

GRANT SELECT ON RRHH.RH_MUNICIPIO TO SIDEP;
/


CREATE TABLE RRHH.RH_TIPO_AREA
(
  ID_AREA      NUMBER(2)                        NOT NULL,
  NOMBRE_AREA  VARCHAR2(50 BYTE)                NOT NULL
)
/

COMMENT ON TABLE RRHH.RH_TIPO_AREA IS 'CONTENDRA EL CATALOGO DE LAS CLASIFICACION DE LAS DEPENDENCIAS POR AREA 1=JURIS, 2=ADMITIVA, ETC.';

COMMENT ON COLUMN RRHH.RH_TIPO_AREA.ID_AREA IS 'IDENTIFICACION DEL CODIGO DE AREA';

COMMENT ON COLUMN RRHH.RH_TIPO_AREA.NOMBRE_AREA IS 'NOMBRE DESIGNADO AL REA';



CREATE INDEX RRHH.IDX_NOMREAREA ON RRHH.RH_TIPO_AREA
(NOMBRE_AREA)
LOGGING
TABLESPACE users
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX RRHH.PK_RH_TIPO_AREA ON RRHH.RH_TIPO_AREA
(ID_AREA)
LOGGING
TABLESPACE users
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


CREATE OR REPLACE PUBLIC SYNONYM RH_TIPO_AREA FOR RRHH.RH_TIPO_AREA;


ALTER TABLE RRHH.RH_TIPO_AREA ADD (
  CONSTRAINT PK_RH_TIPO_AREA
  PRIMARY KEY
  (ID_AREA)
  USING INDEX RRHH.PK_RH_TIPO_AREA
  ENABLE VALIDATE);


GRANT SELECT ON RRHH.RH_TIPO_AREA TO SIDEP;


/
--------------------------------------------------------
-- Archivo creado  - martes-noviembre-08-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table RH_DEPENDENCIA
--------------------------------------------------------

  CREATE TABLE "RRHH"."RH_DEPENDENCIA" 
   (	"DEPENDENCIA" NUMBER(8,0), 
	"ID_DIRECCION" NUMBER(5,0), 
	"NOMBRE_DEPENDENCIA" VARCHAR2(1024 BYTE), 
	"NOMBRE_GAFETE" VARCHAR2(1024 BYTE), 
	"NOMBRE_ABREVIADO" VARCHAR2(1024 BYTE), 
	"CLASIFICACION_DEPENDENCIA" NUMBER(4,0) DEFAULT 1, 
	"DEPENDENCIA_PADRE" NUMBER(8,0), 
	"MATERIA" NUMBER(3,0), 
	"DEPENDENCIA_VIGENTE" CHAR(1 BYTE) DEFAULT 'S', 
	"FECHA_CREACION_DEPENDENCIA" DATE, 
	"FECHA_ANULACION_DEPENDENCIA" DATE, 
	"TELEFONOS" VARCHAR2(60 BYTE), 
	"CONECTOR_DEPENDENCIA" VARCHAR2(20 BYTE) DEFAULT 'DE LA', 
	"NOMBRE_DEPENDENCIA_DOCUMENTO" VARCHAR2(1024 BYTE), 
	"UNIDAD_PRESUPUESTARIA" CHAR(1 BYTE) DEFAULT 'N', 
	"FUNCION_UNIDAD" CHAR(1 BYTE) DEFAULT 'N', 
	"CODIGO_PRESUPUESTARIO" NUMBER(5,0) DEFAULT 0, 
	"REFERENCIA" VARCHAR2(1024 BYTE), 
	"USUARIO_CREADOR" VARCHAR2(40 BYTE) DEFAULT user, 
	"FECHA_MODIFICACION" DATE DEFAULT SYSDATE, 
	"USUARIO_MODIFICO" VARCHAR2(20 BYTE), 
	"ID_CAMARA" NUMBER(2,0), 
	"ID_COMPETENCIA" NUMBER(2,0), 
	"ID_ESPECIALIDAD" NUMBER(3,0), 
	"ID_AREA" NUMBER(2,0), 
	"NOMBRE_DEPENDENCIA_UCI" VARCHAR2(250 BYTE), 
	"ID_IGSS" NUMBER(4,0) DEFAULT 0, 
	"ACUERDO_DIGITAL" VARCHAR2(512 BYTE), 
	"FECHA_ENTRA_VIGENCIA" DATE, 
	"FECHA_PUBLICACION" DATE, 
	"OBS_FECHA_VIGENCIA" VARCHAR2(512 BYTE)
   ) ;
   
   COMMENT ON COLUMN "RRHH"."RH_DEPENDENCIA"."DEPENDENCIA" IS 'Codigo de la dependencia';
 
   COMMENT ON COLUMN "RRHH"."RH_DEPENDENCIA"."ID_DIRECCION" IS 'Codigo de identificacion de la direccion';
 
   COMMENT ON COLUMN "RRHH"."RH_DEPENDENCIA"."NOMBRE_DEPENDENCIA" IS 'Nombre de la dependencia';
 
   COMMENT ON COLUMN "RRHH"."RH_DEPENDENCIA"."NOMBRE_GAFETE" IS 'Nombre de la dependencia para imprimir en gafete';
 
   COMMENT ON COLUMN "RRHH"."RH_DEPENDENCIA"."NOMBRE_ABREVIADO" IS 'Nombre abreviado de la dependencia';
 
   COMMENT ON COLUMN "RRHH"."RH_DEPENDENCIA"."UNIDAD_PRESUPUESTARIA" IS 'Indica si es presupuestaria o funcional';
 
   COMMENT ON COLUMN "RRHH"."RH_DEPENDENCIA"."FUNCION_UNIDAD" IS 'Funcion de la unidad Normal, Turno, Alto Impacto.';
 
   COMMENT ON TABLE "RRHH"."RH_DEPENDENCIA"  IS 'Dependencias del Organismo Judicial';
   
      
--------------------------------------------------------
--  DDL for Index XPKDEPENDENCIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "RRHH"."XPKDEPENDENCIA" ON "RRHH"."RH_DEPENDENCIA" ("DEPENDENCIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 40960 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
  
  
 


--------------------------------------------------------
--  DDL for Index XIF126RH_DEPENDENCIA
--------------------------------------------------------

  CREATE INDEX "RRHH"."XIF126RH_DEPENDENCIA" ON "RRHH"."RH_DEPENDENCIA" ("ID_DIRECCION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 40960 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
--------------------------------------------------------
--  DDL for Index FK_RH_DEPENDENCIA_M
--------------------------------------------------------

  CREATE INDEX "RRHH"."FK_RH_DEPENDENCIA_M" ON "RRHH"."RH_DEPENDENCIA" ("MATERIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
--------------------------------------------------------
--  DDL for Index FK_RH_DEPENDENCIA_CD
--------------------------------------------------------

  CREATE INDEX "RRHH"."FK_RH_DEPENDENCIA_CD" ON "RRHH"."RH_DEPENDENCIA" ("CLASIFICACION_DEPENDENCIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
--------------------------------------------------------
--  DDL for Index FK_RH_DEPENDENCIA_DP
--------------------------------------------------------

  CREATE INDEX "RRHH"."FK_RH_DEPENDENCIA_DP" ON "RRHH"."RH_DEPENDENCIA" ("DEPENDENCIA_PADRE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
  
  
--------------------------------------------------------
--  DDL for Trigger RH_DEPENDENCIA_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "RRHH"."RH_DEPENDENCIA_BI" 
BEFORE INSERT ON RRHH.RH_DEPENDENCIA
FOR EACH ROW
BEGIN
    :new.NOMBRE_DEPENDENCIA_UCI:=:new.NOMBRE_DEPENDENCIA;
   EXCEPTION
     WHEN OTHERS THEN
       RAISE;
END RH_DEPENDENCIA_BI;



/
ALTER TRIGGER "RRHH"."RH_DEPENDENCIA_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RH_DEPENDENCIA_BU
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "RRHH"."RH_DEPENDENCIA_BU" 
BEFORE UPDATE
ON RRHH.RH_DEPENDENCIA 
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
    :new.fecha_modificacion:=sysdate;
    :new.usuario_modifico:=user;
   EXCEPTION
     WHEN OTHERS THEN
       RAISE;
END rh_dependencia_bu;

/
ALTER TRIGGER "RRHH"."RH_DEPENDENCIA_BU" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TGR_RH_DEPENDENCIA_BI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "RRHH"."TGR_RH_DEPENDENCIA_BI" 
BEFORE INSERT
ON RRHH.RH_DEPENDENCIA
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DECLARE
tmpVar NUMBER;
/******************************************************************************
   NAME:       TGR_RH_DEPENDENCIA_BI
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        21/04/2014      LElias       1. Created this trigger.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     TGR_RH_DEPENDENCIA_BI
      Sysdate:         21/04/2014
      Date and Time:   21/04/2014, 01:29:51 p.m., and 21/04/2014 01:29:51 p.m.
      Username:        LElias (set in TOAD Options, Proc Templates)
      Table Name:       (set in the "New PL/SQL Object" dialog)
      Trigger Options:  (set in the "New PL/SQL Object" dialog)
******************************************************************************/
ULTIMO  NUMBER;
BEGIN
   tmpVar := 0;
    SELECT NVL(MAX(ID_IGSS),0)+1 
        INTO ULTIMO 
            FROM RH_DEPENDENCIA
                WHERE DEPENDENCIA_VIGENTE='S';       
        :NEW.ID_IGSS:=ULTIMO;
   EXCEPTION
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END TGR_RH_DEPENDENCIA_BI;


/

ALTER TRIGGER "RRHH"."TGR_RH_DEPENDENCIA_BI" ENABLE;

--------------------------------------------------------
--  Constraints for Table RH_DEPENDENCIA
--------------------------------------------------------

  ALTER TABLE "RRHH"."RH_DEPENDENCIA" ADD CONSTRAINT "CK_DEPENDENCIAVIGENTE" CHECK (DEPENDENCIA_VIGENTE IN ( 'S', 'N' )) ENABLE;
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" ADD CONSTRAINT "CK_FUNCIONUNIDAD" CHECK (FUNCION_UNIDAD IN ('N', 'T', 'A' )) ENABLE;
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" ADD CONSTRAINT "CK_UNIDADPRESUPUESTARIA" CHECK (UNIDAD_PRESUPUESTARIA IN ('S','N')) ENABLE;
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("DEPENDENCIA" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("ID_DIRECCION" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("NOMBRE_DEPENDENCIA" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("NOMBRE_GAFETE" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("NOMBRE_ABREVIADO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("CLASIFICACION_DEPENDENCIA" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("MATERIA" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("DEPENDENCIA_VIGENTE" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("FECHA_CREACION_DEPENDENCIA" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("CONECTOR_DEPENDENCIA" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("NOMBRE_DEPENDENCIA_DOCUMENTO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("UNIDAD_PRESUPUESTARIA" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("FUNCION_UNIDAD" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("CODIGO_PRESUPUESTARIO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("REFERENCIA" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."RH_DEPENDENCIA" MODIFY ("USUARIO_CREADOR" NOT NULL ENABLE);
 

  ALTER TABLE "RRHH"."RH_DEPENDENCIA" ADD CONSTRAINT "XPKDEPENDENCIA" PRIMARY KEY ("DEPENDENCIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 40960 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users  ENABLE;
  
  --------------------------------------------------------
-- Archivo creado  - martes-noviembre-08-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TS_TIPO_GESTION
--------------------------------------------------------

  CREATE TABLE "RRHH"."TS_TIPO_GESTION" 
   (	"ID_TIPO_GESTION" NUMBER, 
	"TIPO_GESTION" VARCHAR2(50 BYTE), 
	"ID_SOURCE" NUMBER, 
	"ID_ESTADO" NUMBER, 
	"FECHA_CREACION" DATE, 
	"OBSERVACIONES" VARCHAR2(200 BYTE), 
	"ID_USUARIO_REGISTRO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
--------------------------------------------------------
--  DDL for Index TS_TIPO_GESTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RRHH"."TS_TIPO_GESTION_PK" ON "RRHH"."TS_TIPO_GESTION" ("ID_TIPO_GESTION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
--------------------------------------------------------
--  Constraints for Table TS_TIPO_GESTION
--------------------------------------------------------

  ALTER TABLE "RRHH"."TS_TIPO_GESTION" MODIFY ("TIPO_GESTION" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TS_TIPO_GESTION" ADD CONSTRAINT "TS_TIPO_GESTION_PK" PRIMARY KEY ("ID_TIPO_GESTION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ENABLE;
  
  --------------------------------------------------------
-- Archivo creado  - martes-noviembre-08-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TT_DEPENDENCIA_CORREO
--------------------------------------------------------

  CREATE TABLE "RRHH"."TT_DEPENDENCIA_CORREO" 
   (	"ID_DEPENDENCIA_CORREO" NUMBER, 
	"DEPENDENCIA" NUMBER, 
	"CORREO_ELECTRONICO" VARCHAR2(50 BYTE), 
	"ID_ESTADO" NUMBER, 
	"ID_SOURCE" NUMBER, 
	"ID_USUARIO_REGISTRO" NUMBER, 
	"FECHA_REGISTRO" DATE, 
	"OBSERVACIONES" VARCHAR2(200 BYTE), 
	"ID_TRAZABILIDAD" NUMBER, 
	"IP" VARCHAR2(23 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
  
--------------------------------------------------------
--  DDL for Index TT_DEPENDENCIA_CORREO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RRHH"."TT_DEPENDENCIA_CORREO_PK" ON "RRHH"."TT_DEPENDENCIA_CORREO" ("ID_DEPENDENCIA_CORREO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
  
  --------------------------------------------------------
--  Constraints for Table TT_DEPENDENCIA_CORREO
--------------------------------------------------------

  ALTER TABLE "RRHH"."TT_DEPENDENCIA_CORREO" MODIFY ("ID_DEPENDENCIA_CORREO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_CORREO" MODIFY ("DEPENDENCIA" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_CORREO" MODIFY ("CORREO_ELECTRONICO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_CORREO" MODIFY ("ID_ESTADO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_CORREO" MODIFY ("ID_SOURCE" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_CORREO" MODIFY ("ID_USUARIO_REGISTRO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_CORREO" MODIFY ("FECHA_REGISTRO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_CORREO" ADD CONSTRAINT "TT_DEPENDENCIA_CORREO_PK" PRIMARY KEY ("ID_DEPENDENCIA_CORREO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users  ENABLE;
  
  --------------------------------------------------------
-- Archivo creado  - martes-noviembre-08-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TT_DEPENDENCIA_RH_CIDEJ
--------------------------------------------------------

  CREATE TABLE "RRHH"."TT_DEPENDENCIA_RH_CIDEJ" 
   (	"ID_DEP_RH_CIDEJ" NUMBER, 
	"DEPENDENCIA" NUMBER, 
	"ID_DESPACHO" NUMBER, 
	"ID_ESTADO" NUMBER, 
	"ID_SOURCE" NUMBER, 
	"ID_USUARIO_REGISTRO" NUMBER, 
	"FECHA_REGISTRO" DATE, 
	"OBSERVACIONES" VARCHAR2(200 BYTE), 
	"ID_TRAZABILIDAD" NUMBER, 
	"IP" VARCHAR2(23 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
--------------------------------------------------------
--  DDL for Index TT_DEPENDENCIA_RH_CIDEJ_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RRHH"."TT_DEPENDENCIA_RH_CIDEJ_PK" ON "RRHH"."TT_DEPENDENCIA_RH_CIDEJ" ("ID_DEP_RH_CIDEJ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
  
--------------------------------------------------------
--  Constraints for Table TT_DEPENDENCIA_RH_CIDEJ
--------------------------------------------------------

  ALTER TABLE "RRHH"."TT_DEPENDENCIA_RH_CIDEJ" MODIFY ("ID_DEP_RH_CIDEJ" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_RH_CIDEJ" MODIFY ("DEPENDENCIA" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_RH_CIDEJ" MODIFY ("ID_DESPACHO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_RH_CIDEJ" MODIFY ("ID_ESTADO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_RH_CIDEJ" MODIFY ("ID_SOURCE" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_RH_CIDEJ" MODIFY ("ID_USUARIO_REGISTRO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_RH_CIDEJ" MODIFY ("FECHA_REGISTRO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_DEPENDENCIA_RH_CIDEJ" ADD CONSTRAINT "TT_DEPENDENCIA_RH_CIDEJ_PK" PRIMARY KEY ("ID_DEP_RH_CIDEJ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users  ENABLE;



--------------------------------------------------------
-- Archivo creado  - martes-noviembre-08-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TT_GEST_DEPENDENCIA
--------------------------------------------------------

  CREATE TABLE "RRHH"."TT_GEST_DEPENDENCIA" 
   (	"ID_GESTION_DEPENDENCIA" NUMBER, 
	"CODIGO_DEPENDENCIA" NUMBER, 
	"CODIGO_PRESUPUESTARIO" NUMBER, 
	"NOMBRE_DEPENDENCIA" VARCHAR2(1024 BYTE), 
	"NOMBRE_GAFETE" VARCHAR2(1024 BYTE), 
	"NOMBRE_ABREVIADO" VARCHAR2(1024 BYTE), 
	"NOMBRE_DOCUMENTO" VARCHAR2(1024 BYTE), 
	"CONECTOR" VARCHAR2(10 BYTE), 
	"FECHA_DEL_ACUERDO" DATE, 
	"FECHA_ENTRA_VIGENCIA" DATE, 
	"FECHA_ANULACION" DATE, 
	"REFERENCIA" VARCHAR2(2048 BYTE), 
	"FUNCION_UNIDAD" VARCHAR2(5 BYTE), 
	"DEPARTAMENTO" NUMBER, 
	"MUNICIPIO" NUMBER, 
	"TIPO_AREA" NUMBER, 
	"ACUERDO_DIGITAL" VARCHAR2(512 BYTE), 
	"ID_TIPO_GESTION" NUMBER, 
	"ID_ESTADO" NUMBER, 
	"ID_SOURCE" NUMBER, 
	"IP" VARCHAR2(50 BYTE), 
	"ID_ESTADO_PROCESO" NUMBER, 
	"ID_TRAZABILIDAD" NUMBER, 
	"OBSERVACIONES" VARCHAR2(2048 BYTE), 
	"ID_USUARIO_REGISTRO" NUMBER, 
	"FECHA_REGISTRO" DATE, 
	"FECHA_PUBLICACION" DATE, 
	"OBS_FECHA_VIGENCIA" VARCHAR2(512 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
--------------------------------------------------------
--  DDL for Index PK_TT_GEST_DEPENDENCIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "RRHH"."PK_TT_GEST_DEPENDENCIA" ON "RRHH"."TT_GEST_DEPENDENCIA" ("ID_GESTION_DEPENDENCIA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users ;
  
  
--------------------------------------------------------
--  Constraints for Table TT_GEST_DEPENDENCIA
--------------------------------------------------------

  ALTER TABLE "RRHH"."TT_GEST_DEPENDENCIA" ADD CONSTRAINT "PK_TT_GEST_DEPENDENCIA" PRIMARY KEY ("ID_GESTION_DEPENDENCIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE users  ENABLE;
 
  ALTER TABLE "RRHH"."TT_GEST_DEPENDENCIA" MODIFY ("ID_ESTADO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_GEST_DEPENDENCIA" MODIFY ("ID_SOURCE" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_GEST_DEPENDENCIA" MODIFY ("ID_ESTADO_PROCESO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_GEST_DEPENDENCIA" MODIFY ("ID_USUARIO_REGISTRO" NOT NULL ENABLE);
 
  ALTER TABLE "RRHH"."TT_GEST_DEPENDENCIA" MODIFY ("FECHA_REGISTRO" NOT NULL ENABLE);
   