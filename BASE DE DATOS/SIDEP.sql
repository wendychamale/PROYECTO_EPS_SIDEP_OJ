connect /as sysdba
alter session set "_oracle_script" = true;
create user CIT_BASE identified by admin;
GRANT ALL PRIVILEGES TO CIT_BASE;

--
-- RH_EDIFICIO  (Table) 
--
CREATE TABLE SIDEP.RH_EDIFICIO
(
  EDIFICIO  VARCHAR2(60 BYTE)
)
/
COMMENT ON TABLE SIDEP.RH_EDIFICIO IS 'Descripcion de los Edificios de Organismo Judicial, el cual pueden ser referenciados para las direcciones de cada una de las dependencias.';
COMMENT ON COLUMN SIDEP.RH_EDIFICIO.EDIFICIO IS 'Nombre del Edificio';
/
--
-- RH_PAIS  (Table) 
--
CREATE TABLE SIDEP.RH_PAIS
(
  PAIS                   NUMBER(3)              NOT NULL,
  NOMBRE_PAIS            VARCHAR2(30 BYTE)      NOT NULL,
  ABREVIATURA_PAIS       VARCHAR2(5 BYTE)       NOT NULL,
  NACIONALIDAD           VARCHAR2(15 BYTE)      NOT NULL,
  NACIONALIDAD_FEMENINO  VARCHAR2(15 BYTE)
)
/
COMMENT ON TABLE SIDEP.RH_PAIS IS 'Descripcion general de los paises';
COMMENT ON COLUMN SIDEP.RH_PAIS.PAIS IS 'Codigo numero de identificacion de pais';
COMMENT ON COLUMN SIDEP.RH_PAIS.NOMBRE_PAIS IS 'Nombre del pais';
COMMENT ON COLUMN SIDEP.RH_PAIS.ABREVIATURA_PAIS IS 'Abreviatura del nombre de pais (ej. GT, GUA,  GUAT )';
COMMENT ON COLUMN SIDEP.RH_PAIS.NACIONALIDAD IS 'Nacionalidad o gentilicio de los habitantes del pais';
/


--
-- RH_PUESTO  (Table) 
--
CREATE TABLE SIDEP.RH_PUESTO
(
  PUESTO                         NUMBER(5)      NOT NULL,
  CARGO                          NUMBER(3),
  TIPO_NIVEL_SALARIAL            NUMBER(8)      NOT NULL,
  NOMBRE_PUESTO                  VARCHAR2(90 BYTE) NOT NULL,
  FECHA_CREACION                 DATE           NOT NULL,
  FECHA_SUPRESION                DATE,
  STATUS_PUESTO_VIGENTE          VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL,
  JORNADA                        NUMBER(5)      DEFAULT 1                     NOT NULL,
  NOMBRE_CORTO_PUESTO            VARCHAR2(60 BYTE),
  REFERENCIA                     VARCHAR2(126 BYTE),
  PUESTO_REFERENCIA              NUMBER(5),
  CODIGO_VISUAL_PUESTO           NUMBER(5),
  AREA                           CHAR(1 BYTE)   DEFAULT 'A',
  AREA_JUDICIAL                  CHAR(1 BYTE)   DEFAULT 'N',
  APLICA_IGSS                    CHAR(1 BYTE)   DEFAULT 'S'                   NOT NULL,
  NOMBRE_PUESTO_GENERO_FEMENINO  VARCHAR2(90 BYTE) NOT NULL,
  ID_GRUPOPUESTO                 NUMBER(3),
  ORDEN_UCI                      NUMBER(5)      DEFAULT 99999
)
/
COMMENT ON TABLE SIDEP.RH_PUESTO IS 'Descripcion de los diferentes puestos creados en el OJ';
COMMENT ON COLUMN SIDEP.RH_PUESTO.PUESTO IS 'Codigo del puesto de trabajo';
COMMENT ON COLUMN SIDEP.RH_PUESTO.CARGO IS 'Cargo del puesto';
COMMENT ON COLUMN SIDEP.RH_PUESTO.TIPO_NIVEL_SALARIAL IS 'Codigo del Nivel Salarial';
COMMENT ON COLUMN SIDEP.RH_PUESTO.NOMBRE_PUESTO IS 'Nombre descriptivo del puesto';
COMMENT ON COLUMN SIDEP.RH_PUESTO.FECHA_CREACION IS 'Fecha de creacion del puesto';
COMMENT ON COLUMN SIDEP.RH_PUESTO.FECHA_SUPRESION IS 'Fecha de supresion del puesto';
COMMENT ON COLUMN SIDEP.RH_PUESTO.STATUS_PUESTO_VIGENTE IS 'Status del puesto';
COMMENT ON COLUMN SIDEP.RH_PUESTO.JORNADA IS 'Jornada default que aplica el puesto';
COMMENT ON COLUMN SIDEP.RH_PUESTO.NOMBRE_CORTO_PUESTO IS 'Nombre corto del puesto';
COMMENT ON COLUMN SIDEP.RH_PUESTO.REFERENCIA IS 'Referencia sobre la autorizacion de creacion del puesto';
COMMENT ON COLUMN SIDEP.RH_PUESTO.PUESTO_REFERENCIA IS 'Puesto de referencia que reemplazo (Reclasificacion de puestos)';
COMMENT ON COLUMN SIDEP.RH_PUESTO.CODIGO_VISUAL_PUESTO IS 'Codigo visual con que los usuarios identificaran el puesto en el sistema.';
COMMENT ON COLUMN SIDEP.RH_PUESTO.NOMBRE_PUESTO_GENERO_FEMENINO IS 'Nombre del puesto con identificacion de genero ';
/

--
-- RH_TIPO_AREA  (Table) 
--
CREATE TABLE SIDEP.RH_TIPO_AREA
(
  ID_AREA      NUMBER(2)                        NOT NULL,
  NOMBRE_AREA  VARCHAR2(50 BYTE)                NOT NULL
)
/
COMMENT ON TABLE SIDEP.RH_TIPO_AREA IS 'CONTENDRA EL CATALOGO DE LAS CLASIFICACION DE LAS DEPENDENCIAS POR AREA 1=JURIS, 2=ADMITIVA, ETC.';
COMMENT ON COLUMN SIDEP.RH_TIPO_AREA.ID_AREA IS 'IDENTIFICACION DEL CODIGO DE AREA';
COMMENT ON COLUMN SIDEP.RH_TIPO_AREA.NOMBRE_AREA IS 'NOMBRE DESIGNADO AL REA';
/


--
-- TH_DEPENDENCIA_CORREO  (Table) 
--
CREATE TABLE SIDEP.TH_DEPENDENCIA_CORREO
(
  ID_DEPENDENCIA_CORREO  NUMBER,
  CORREO_ELECTRONICO     VARCHAR2(50 BYTE),
  ID_ESTADO              NUMBER,
  ID_SOURCE              NUMBER                 NOT NULL,
  ID_USUARIO_REGISTRO    NUMBER                 NOT NULL,
  FECHA_REGISTRO         DATE                   NOT NULL,
  OBSERVACIONES          VARCHAR2(200 BYTE),
  ID_TRAZABILIDAD        NUMBER,
  IP                     VARCHAR2(23 BYTE)
)
/


--
-- TH_DEPENDENCIA_RH_CIDEJ  (Table) 
--
CREATE TABLE SIDEP.TH_DEPENDENCIA_RH_CIDEJ
(
  ID_DEP_RH_CIDEJ      NUMBER                   NOT NULL,
  DEPENDENCIA          NUMBER                   NOT NULL,
  ID_DESPACHO          NUMBER                   NOT NULL,
  ID_ESTADO            NUMBER                   NOT NULL,
  ID_SOURCE            NUMBER                   NOT NULL,
  ID_USUARIO_REGISTRO  NUMBER                   NOT NULL,
  FECHA_REGISTRO       DATE                     NOT NULL,
  OBSERVACIONES        VARCHAR2(200 BYTE),
  ID_TRAZABILIDAD      NUMBER,
  IP                   VARCHAR2(23 BYTE)
)
/
--
-- TH_GEST_DEPENDENCIA  (Table) 
--
CREATE TABLE SIDEP.TH_GEST_DEPENDENCIA
(
  ID_GESTION_DEPENDENCIA  NUMBER,
  CODIGO_DEPENDENCIA      NUMBER,
  CODIGO_PRESUPUESTARIO   NUMBER,
  NOMBRE_DEPENDENCIA      VARCHAR2(1024 BYTE),
  NOMBRE_GAFETE           VARCHAR2(1024 BYTE),
  NOMBRE_ABREVIADO        VARCHAR2(1024 BYTE),
  NOMBRE_DOCUMENTO        VARCHAR2(1024 BYTE),
  CONECTOR                VARCHAR2(10 BYTE),
  FECHA_DEL_ACUERDO       DATE,
  FECHA_ENTRA_VIGENCIA    DATE,
  FECHA_ANULACION         DATE,
  REFERENCIA              VARCHAR2(2048 BYTE),
  FUNCION_UNIDAD          VARCHAR2(5 BYTE),
  DEPARTAMENTO            NUMBER,
  MUNICIPIO               NUMBER,
  TIPO_AREA               NUMBER,
  ACUERDO_DIGITAL         VARCHAR2(512 BYTE),
  ID_TIPO_GESTION         NUMBER,
  ID_ESTADO               NUMBER                NOT NULL,
  ID_SOURCE               NUMBER                NOT NULL,
  IP                      VARCHAR2(50 BYTE),
  ID_ESTADO_PROCESO       NUMBER                NOT NULL,
  ID_TRAZABILIDAD         NUMBER,
  OBSERVACIONES           VARCHAR2(2048 BYTE),
  ID_USUARIO_REGISTRO     NUMBER                NOT NULL,
  FECHA_REGISTRO          DATE                  NOT NULL,
  FECHA_PUBLICACION       DATE,
  OBS_FECHA_VIGENCIA      VARCHAR2(512 BYTE)
)
/
--
-- TS_SOURCE  (Table) 
--
CREATE TABLE SIDEP.TS_SOURCE
(
  ID_SOURCE      NUMBER                         NOT NULL,
  SOURCE         VARCHAR2(100 BYTE)             NOT NULL,
  OBSERVACIONES  VARCHAR2(100 BYTE)
)
/

--
-- SQ_TRAZABILIDAD  (Sequence) 
--
CREATE SEQUENCE SIDEP.SQ_TRAZABILIDAD
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
/

--
-- SQ_TT_DEPENDENCIA_CORREO  (Sequence) 
--
CREATE SEQUENCE SIDEP.SQ_TT_DEPENDENCIA_CORREO
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 0
  NOCYCLE
  NOCACHE
  NOORDER;
/

--
-- SQ_TT_DEPENDENCIA_RH_CIDEJ  (Sequence) 
--
CREATE SEQUENCE SIDEP.SQ_TT_DEPENDENCIA_RH_CIDEJ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 0
  NOCYCLE
  NOCACHE
  NOORDER;
/

--
-- SQ_TT_GEST_DEPENDENCIA  (Sequence) 
--
CREATE SEQUENCE SIDEP.SQ_TT_GEST_DEPENDENCIA
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 0
  NOCYCLE
  NOCACHE
  NOORDER;

/

--
-- FK_RH_PUESTO_J  (Index) 
--
CREATE INDEX SIDEP.FK_RH_PUESTO_J ON SIDEP.RH_PUESTO
(JORNADA)
TABLESPACE USERS
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
           );

/
--
-- FK_RH_PUESTO_PR  (Index) 
--
CREATE INDEX SIDEP.FK_RH_PUESTO_PR ON SIDEP.RH_PUESTO
(PUESTO_REFERENCIA)
TABLESPACE USERS
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
           );

/
--
-- IDX_NOMREAREA  (Index) 
--
CREATE INDEX SIDEP.IDX_NOMREAREA ON SIDEP.RH_TIPO_AREA
(NOMBRE_AREA)
TABLESPACE USERS
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
           );

/
--
-- PK_EDIFICIO  (Index) 
--
CREATE UNIQUE INDEX SIDEP.PK_EDIFICIO ON SIDEP.RH_EDIFICIO
(EDIFICIO)
TABLESPACE USERS
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
           );

/
--
-- PK_TS_SOURCE  (Index) 
--
CREATE UNIQUE INDEX SIDEP.PK_TS_SOURCE ON SIDEP.TS_SOURCE
(ID_SOURCE)
TABLESPACE USERS
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
           );

/
--
-- XIF118RH_PUESTO  (Index) 
--
CREATE INDEX SIDEP.XIF118RH_PUESTO ON SIDEP.RH_PUESTO
(TIPO_NIVEL_SALARIAL)
TABLESPACE USERS
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
           );

/

--
-- XIF16PUESTO  (Index) 
--
CREATE INDEX SIDEP.XIF16PUESTO ON SIDEP.RH_PUESTO
(CARGO)
TABLESPACE USERS
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
           );

/

--
-- XPKPUESTO  (Index) 
--
CREATE UNIQUE INDEX SIDEP.XPKPUESTO ON SIDEP.RH_PUESTO
(PUESTO)
TABLESPACE USERS
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
           );

/


--
-- PKG_APOYO_INSERTS  (Package) 
--
CREATE OR REPLACE PACKAGE SIDEP."PKG_APOYO_INSERTS" AS 

      PROCEDURE PROC_ESCRIBE_SALIDA(p_msj_salida varchar2);   
      FUNCTION  FUNC_DEVUELVE_CAMPOS(p_esquema varchar2, p_nombre_tabla varchar2, p_parametros_insert in out varchar2, p_parametros_proc in out varchar2) RETURN VARCHAR2;
      FUNCTION  FUNC_CUERPO_INSERT(p_esquema varchar2, p_nombre_tabla varchar2, p_parametros_proc in out varchar2) RETURN VARCHAR2;      
      PROCEDURE PROC_CUERPO_PROC_INSERT(p_esquema varchar2, p_nombre_tabla varchar2);     
      PROCEDURE proc_cuerpo_proc_insert_new (p_esquema VARCHAR2, p_nombre_tabla VARCHAR2, p_tipo INTEGER DEFAULT 1);
      PROCEDURE proc_body_proc_insert( p_esquema VARCHAR2, p_nombre_tabla VARCHAR2, p_tipo INTEGER DEFAULT 1);
      PROCEDURE PROC_GENERA_PAQUETE_INSERT(p_esquema IN VARCHAR2, ptipo in number default 1);
      PROCEDURE PROC_GENERA_SECUENCIAS ( p_esquema VARCHAR2, p_tipo INTEGER DEFAULT 1);
      
      /* SCRIPTS DE SIMULACION DE EXPORTS  */
      FUNCTION FUNC_INSERTS_EXPORT(p_esquema varchar2, pp_tabla varchar2) return varchar2;
      PROCEDURE PROC_SIMULA_EXPORT;
      PROCEDURE PROC_GENERA_TYPO_OBJETO(p_nombre_tipo varchar2, p_columnas number, p_tamanio_varchar number) ;
      PROCEDURE PROC_MAPEA_TABLA_PARAM(p_nombre_tabla_param varchar2, p_tabla varchar2) ;   

END PKG_APOYO_INSERTS;
/



--
-- PKG_CONSTANTES  (Package) 
--
CREATE OR REPLACE PACKAGE SIDEP.PKG_CONSTANTES AS
    FUNCTION NOMBRE_ESQUEMA RETURN VARCHAR2;
    FUNCTION ES_DESARROLLO RETURN NUMBER;
    FUNCTION VERSION_SISTEMA RETURN FLOAT;
    FUNCTION TIPO_PAIS RETURN NUMBER;
    FUNCTION SOURCE_BDD RETURN NUMBER;
    FUNCTION SOURCE_APP RETURN NUMBER;
    FUNCTION ESTADO_ACTIVO RETURN NUMBER; 
    FUNCTION ESTADO_INACTIVO RETURN NUMBER; 
    FUNCTION CREACION_DEPENDENCIA RETURN NUMBER;
    FUNCTION ACTUALIZA_DEPENDENCIA RETURN NUMBER;
    FUNCTION REGULARIZA_DEPENDENCIA RETURN NUMBER;
    FUNCTION BAJA_DEPENDENCIA RETURN NUMBER;
    FUNCTION SOLICITUD RETURN NUMBER;
    FUNCTION ATENDIDA RETURN NUMBER;
    FUNCTION RECHAZADA RETURN NUMBER;
    FUNCTION SNP RETURN NUMBER;
    FUNCTION UCPAS RETURN NUMBER;
    FUNCTION CIT RETURN NUMBER;
    FUNCTION CIDEJ RETURN NUMBER;
    FUNCTION ADMIN_UCPAS RETURN NUMBER;
    FUNCTION TIPO_DATO_NUMERO RETURN NUMBER;
    FUNCTION TIPO_DATO_LISTA RETURN NUMBER;
    FUNCTION UDOT_UNUM RETURN NUMBER;
    FUNCTION UDI_UNUM RETURN NUMBER;
END PKG_CONSTANTES;
/

--
-- PKG_APOYO_INSERTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY SIDEP."PKG_APOYO_INSERTS" AS
      PROCEDURE PROC_ESCRIBE_SALIDA(p_msj_salida varchar2) IS
      BEGIN
         DBMS_OUTPUT.put_line(p_msj_salida); 
      END;       

      FUNCTION FUNC_DEVUELVE_CAMPOS(p_esquema varchar2, p_nombre_tabla varchar2, p_parametros_insert in out varchar2, p_parametros_proc in out varchar2) RETURN VARCHAR2 IS
           CURSOR cur_campo_tabla is
                 select column_name columna, data_type
                       from ALL_TAB_COLUMNS ---omorex_tab_columns  --sys.dba_tab_columns 
                  where owner = TRIM(p_esquema)
                  and   table_name = TRIM(p_nombre_tabla)
                  order by column_id;
           v_parametro varchar2(30);       
           v_regresa varchar2(4000);       
      begin
           p_parametros_insert:= null;
           for x in cur_campo_tabla loop
                if v_regresa is not null then
                   v_regresa:= v_regresa||', '||x.columna;
                   v_parametro:= lower(substr('p_'||x.columna,1,30));                   
                   p_parametros_insert:= p_parametros_insert||', '||v_parametro;
                   p_parametros_proc:= p_parametros_proc||', '||v_parametro||' '||p_nombre_tabla||'.'||x.columna||'%TYPE';
                   --p_parametros_proc:= p_parametros_proc||', '||v_parametro||' '||x.data_type;
                else
                    v_regresa:= x.columna;
                    v_parametro:= lower(substr('p_'||x.columna,1,30));                   
                    p_parametros_insert:= v_parametro;
                    p_parametros_proc  := v_parametro||' '||p_nombre_tabla||'.'||x.columna||'%TYPE';
                    --p_parametros_proc  := v_parametro||' '||x.data_type;
                end if;        
           end loop;  --fin de if v_regresa is not null then
           return v_regresa;
      end FUNC_DEVUELVE_CAMPOS;  --end  FUN_DEVUELVE_CAMPOS
      
      FUNCTION FUNC_CUERPO_INSERT(p_esquema varchar2, p_nombre_tabla varchar2, p_parametros_proc in out varchar2) RETURN VARCHAR2 IS
           v_regresa varchar2(4000);
           v_campos_tabla varchar2(4000);
           v_campos_parametros varchar2(4000);
      BEGIN
           v_campos_tabla:= FUNC_DEVUELVE_CAMPOS(p_esquema, p_nombre_tabla, v_campos_parametros, p_parametros_proc);
      
           v_regresa:= 'insert into '||p_nombre_tabla||'('||v_campos_tabla||') values ('||v_campos_parametros||');';
      
           return v_regresa;
      END FUNC_CUERPO_INSERT;  -- FIN DE       FUNCTION FUN_CUERPO_INSERT(p_esquema varchar2, p_nombre_tabla varchar2) RETURN VARCHAR2;
      
      PROCEDURE PROC_CUERPO_PROC_INSERT(p_esquema varchar2, p_nombre_tabla varchar2) IS
           v_nombre_proc varchar2(30);
           v_parametros_proc varchar2(4000);
           v_insert_char varchar2(4000);
           v_auxiliar varchar2(8000);
      BEGIN
           v_nombre_proc:= substr('PROC_INS_'||p_nombre_tabla,1,30);

           v_insert_char:= FUNC_CUERPO_INSERT(p_esquema, p_nombre_tabla, v_parametros_proc);                  
           
           v_auxiliar:= 'PROCEDURE '||upper(v_nombre_proc)||'('||v_parametros_proc||') IS';
           --v_auxiliar:= 'CREATE OR REPLACE PROCEDURE '||v_nombre_proc||'('||v_parametros_proc||') IS';
           
              PROC_ESCRIBE_SALIDA(v_auxiliar);
           
           v_auxiliar:= '   /*  PROCESO CREADO PARA INSERT EN LA TABLA= '||p_esquema||'.'||p_nombre_tabla;
--           v_auxiliar:= v_auxiliar||chr(13);
              PROC_ESCRIBE_SALIDA(v_auxiliar); 

           v_auxiliar:= '       CREADO POR EL USUARIO= '||user;
--           v_auxiliar:= v_auxiliar||chr(13);
              PROC_ESCRIBE_SALIDA(v_auxiliar); 

           v_auxiliar:= '       FECHA DE CREACION= '||to_char(sysdate,'DD/MM/YYYY hh24:mi:ss');
--           v_auxiliar:= v_auxiliar||chr(13);
              PROC_ESCRIBE_SALIDA(v_auxiliar); 

           v_auxiliar:= '       FECHA ULTIMA MODIFICACION= ';
--           v_auxiliar:= v_auxiliar||chr(13);
              PROC_ESCRIBE_SALIDA(v_auxiliar); 

           v_auxiliar:= '  */';
              PROC_ESCRIBE_SALIDA(v_auxiliar); 
           
           v_auxiliar:= 'BEGIN';
              PROC_ESCRIBE_SALIDA(v_auxiliar); 
           
           v_auxiliar:= '   '||v_insert_char;          
              PROC_ESCRIBE_SALIDA(v_auxiliar); 
              
           v_auxiliar:= 'END '||upper(v_nombre_proc)||';   --fin de procedure '||v_nombre_proc;
              PROC_ESCRIBE_SALIDA(v_auxiliar); 
              
           
      END PROC_CUERPO_PROC_INSERT;  --fin de       FUNCTION FUN_CUERPO_PROC_INSERT(p_esquema varchar2, p_nombre_tabla varchar2) RETURN VARCHAR2;      
 

      /* SCRIPTS DE SIMULACION DE EXPORTS  */
/*
      FUNCTION FUNC_INSERTS_EXPORT(p_esquema varchar2, pp_tabla varchar2) return varchar2 IS
           CURSOR cur_campo_tabla is
                 select column_name columna, data_type
                       from  omorex_tab_columns  --sys.dba_tab_columns 
                  where owner = p_esquema
                  and    table_name = pp_tabla
                  order by column_id;
           v_parametro varchar2(4000);       
           v_regresa varchar2(8000);
           
           v_campos_tabla varchar2(4000);
           v_campos_parametros varchar2(8000);
           
           v_regresa_full varchar2(8000);
                  
      begin
           --v_campos_tabla:= FUNC_DEVUELVE_CAMPOS(p_esquema, p_nombre_tabla, v_campos_parametros, p_parametros_proc);
      
           --v_regresa:= 'insert into '||p_nombre_tabla||'('||v_campos_tabla||') values ('||v_campos_parametros||');';
              v_campos_tabla:= null;
              v_campos_parametros:= null; 
              
               for x in cur_campo_tabla loop
                    if v_regresa is not null then
                       v_regresa:= v_regresa||', '||x.columna;

                       if x.data_type = 'NUMBER' then
                          v_parametro:= 'decode('||x.columna||',NULL,?ULL?'||x.columna||')';
                       elsif x.data_type = 'VARCHAR2' then
                          v_parametro:= '??#'||x.columna||'#??';
                       elsif x.data_type = 'DATE' then
                          v_parametro:= 'to_char('||x.columna||',?D/MM/YYYY HH24:MI:SS?';
                          v_parametro:= '?O_DATE(??'||v_parametro||'#???DD/MM/YYYY HH24:MI:SS?)?;
                          --v_parametro:= 'decode('||v_parametro||',NULL,?ULL?'||v_parametro||')';
                       else
                          v_parametro:= 'decode('||x.columna||',NULL,?ULL?'||x.columna||')';
                       end if;  -- fin de if x.data_type = 'NUMBER' then

                       v_campos_parametros:=  v_campos_parametros||'#??'||v_parametro; 
                       
                    else
                        v_regresa:= x.columna;
                        
                       if x.data_type = 'NUMBER' then
                          v_parametro:= 'decode('||x.columna||',NULL,?ULL?'||x.columna||')';
                       elsif x.data_type = 'VARCHAR2' then
                          v_parametro:= '??#'||x.columna||'#??';
                          --v_parametro:= '''''''''#'||x.columna||'#''''''';
                       elsif x.data_type = 'DATE' then
                          v_parametro:= 'to_char('||x.columna||',?D/MM/YYYY HH24:MI:SS?';
                          v_parametro:= '?O_DATE(??'||v_parametro||'#???DD/MM/YYYY HH24:MI:SS?)?;
                       else
                          v_parametro:= 'decode('||x.columna||',NULL,?ULL?'||x.columna||')';
                       end if;  -- fin de if x.data_type = 'NUMBER' then
                       v_campos_parametros:=  '#'||v_parametro;
                        
                    end if;        
               end loop;  --fin de if v_regresa is not null then
               
               if substr(v_campos_parametros,length(v_campos_parametros)-1) = '?' then
                  v_campos_parametros:= substr(v_campos_parametros,1,length(v_campos_parametros)-2);
               elsif substr(v_campos_parametros,length(v_campos_parametros)) = ')' then    
                  v_campos_parametros:= v_campos_parametros||'#';              
               end if;
              
           v_regresa_full:= 'select ?NSERT INTO '||pp_tabla||'('||v_regresa||') values (?||v_campos_parametros||'?;?FROM '||pp_tabla;
              
           return v_regresa_full;
      end FUNC_INSERTS_EXPORT;  --end  FUNC_CAMPOS_EXPORT
*/

    PROCEDURE proc_cuerpo_proc_insert_new (
        p_esquema VARCHAR2,
        p_nombre_tabla VARCHAR2,
        p_tipo INTEGER DEFAULT 1
    ) IS

            CURSOR cur_tabla IS 
              select a.* from
              (  
                select 
                    table_name, 
                    CASE WHEN SUBSTR(table_name,1,3)='TT_' THEN 1
                         WHEN SUBSTR(table_name,1,3)='TC_' THEN 2  
                         ELSE 3
                    END TIPO         
                from 
                    all_tables 
                where 
                    owner =upper(trim(p_esquema))
               )a
               where a.TIPO <=p_tipo                      
               order by a.table_name;
        
        v_nombre_proc       VARCHAR2(30);
        v_parametros_proc   VARCHAR2(4000);
        v_insert_char       VARCHAR2(4000);
        v_auxiliar          VARCHAR2(8000);
    BEGIN
      FOR x IN cur_tabla LOOP   
            v_nombre_proc := substr('PROC_INS_'
            || x.table_name,1,30);

            v_insert_char := func_cuerpo_insert(p_esquema,x.table_name,v_parametros_proc);
            
            v_auxiliar := 'PROCEDURE '
            || upper(v_nombre_proc)
            || '('
            || v_parametros_proc
            || ') IS';
        --v_auxiliar:= 'CREATE OR REPLACE PROCEDURE '||v_nombre_proc||'('||v_parametros_proc||') IS';


            proc_escribe_salida(v_auxiliar);
            v_auxiliar := '   /*  PROCESO CREADO PARA INSERT EN LA TABLA= '
            || p_esquema
            || '.'
            || x.table_name;
            
        --           v_auxiliar:= v_auxiliar||chr(13);
            proc_escribe_salida(v_auxiliar);
            v_auxiliar := '       CREADO POR EL USUARIO= '
            || user;
            
            
        --           v_auxiliar:= v_auxiliar||chr(13);
            proc_escribe_salida(v_auxiliar);
            v_auxiliar := '       FECHA DE CREACION= '
            || TO_CHAR(SYSDATE,'DD/MM/YYYY hh24:mi:ss');
        --           v_auxiliar:= v_auxiliar||chr(13);
            proc_escribe_salida(v_auxiliar);
            v_auxiliar := '       FECHA ULTIMA MODIFICACION= ';
        --           v_auxiliar:= v_auxiliar||chr(13);
            proc_escribe_salida(v_auxiliar);
            v_auxiliar := '  */';
            proc_escribe_salida(v_auxiliar);
            v_auxiliar := 'BEGIN';
            proc_escribe_salida(v_auxiliar);
            v_auxiliar := '   '
            || v_insert_char;
            proc_escribe_salida(v_auxiliar);
            v_auxiliar := 'END '
            || upper(v_nombre_proc)
            || ';   --fin de procedure '
            || v_nombre_proc|| chr(10)||chr(10);
            proc_escribe_salida(v_auxiliar);
      END LOOP;        
    END proc_cuerpo_proc_insert_new; 

    PROCEDURE proc_body_proc_insert (
        p_esquema VARCHAR2,
        p_nombre_tabla VARCHAR2,
        p_tipo INTEGER DEFAULT 1
    ) IS
            CURSOR cur_tabla IS 
              select a.* from
              (  
                select 
                    table_name, 
                    CASE WHEN SUBSTR(table_name,1,3)='TT_' THEN 1
                         WHEN SUBSTR(table_name,1,3)='TC_' THEN 2  
--                         WHEN SUBSTR(table_name,1,3)='TH_' THEN 5
                         ELSE 3
                    END TIPO         
                from 
                    all_tables 
                where 
                    owner =upper(trim(p_esquema))
               )a
               where a.TIPO <= p_tipo                      
               order by a.table_name;
            
        v_nombre_proc       VARCHAR2(30);
        v_parametros_proc   VARCHAR2(4000);
        v_insert_char       VARCHAR2(4000);
        v_auxiliar          VARCHAR2(8000);
    BEGIN
      FOR x IN cur_tabla LOOP    
        v_nombre_proc := substr('PROC_INS_'
        || x.table_name,1,30);

        v_insert_char := func_cuerpo_insert(p_esquema,x.table_name,v_parametros_proc);
        
        v_auxiliar := 'PROCEDURE '
        || upper(v_nombre_proc)
        || '('
        || v_parametros_proc
        || ');'|| chr(10);
    --v_auxiliar:= 'CREATE OR REPLACE PROCEDURE '||v_nombre_proc||'('||v_parametros_proc||') IS';
        proc_escribe_salida(v_auxiliar);
      END LOOP;        
    END proc_body_proc_insert;
    
    PROCEDURE PROC_GENERA_PAQUETE_INSERT(p_esquema IN VARCHAR2, ptipo in number default 1)IS
    BEGIN
        DBMS_OUTPUT.Put_Line('CREATE OR REPLACE PACKAGE '||p_esquema||'.PKG_INSERTS AS'||CHR(10));
        SIDEP.PKG_APOYO_INSERTS.proc_body_proc_insert ( p_esquema, 'TODAS',ptipo ); DBMS_OUTPUT.Put_Line('');
        DBMS_OUTPUT.Put_Line(CHR(10)||'END PKG_INSERTS; '||CHR(10));

        DBMS_OUTPUT.Put_Line('CREATE OR REPLACE PACKAGE BODY '||p_esquema||'.PKG_INSERTS AS'||CHR(10));
        SIDEP.PKG_APOYO_INSERTS.proc_cuerpo_proc_insert_new ( p_esquema, 'TODAS',ptipo ); DBMS_OUTPUT.Put_Line('');
        DBMS_OUTPUT.Put_Line(CHR(10)||'END PKG_INSERTS; ');
        DBMS_OUTPUT.Put_Line(CHR(10)||'--INICIA CREACI? DE SECUENCIAS');        
        SIDEP.PKG_APOYO_INSERTS.PROC_GENERA_SECUENCIAS(UPPER(p_esquema), ptipo);
    END;    

    PROCEDURE PROC_GENERA_SECUENCIAS ( p_esquema VARCHAR2, p_tipo INTEGER DEFAULT 1) IS
            CURSOR cur_secuencia IS 
                  select 
                    'CREATE SEQUENCE '||owner|| '.SQ_' ||A.table_name
                    || '   START WITH 1;' SECUENCIAS 
                  from
                  (  
                    select 
                        table_name, 
                        CASE WHEN SUBSTR(table_name,1,3)='TT_' THEN 1
                             WHEN SUBSTR(table_name,1,3)='TC_' THEN 2  
                             ELSE 3
                        END TIPO         
                        , OWNER
                    from 
                        all_tables 
                    where 
                        owner =upper(trim(p_esquema))
                   )a
                   where a.TIPO <= p_tipo                      
                   order by a.table_name;

    BEGIN
      FOR x IN cur_secuencia LOOP    
            DBMS_OUTPUT.Put_Line(x.SECUENCIAS);
      END LOOP;        
    END PROC_GENERA_SECUENCIAS;

      FUNCTION FUNC_INSERTS_EXPORT(p_esquema varchar2, pp_tabla varchar2) return varchar2 IS
           CURSOR cur_campo_tabla is
                 select column_name columna, data_type
                       from  all_tab_columns 
                  where owner = p_esquema
                  and    table_name = pp_tabla
                  order by column_id;
           v_parametro varchar2(4000);       
           v_regresa varchar2(8000);
           
           v_campos_tabla varchar2(4000);
           v_campos_parametros varchar2(8000);
           
           v_regresa_full varchar2(8000);
                  
      begin
           --v_campos_tabla:= FUNC_DEVUELVE_CAMPOS(p_esquema, p_nombre_tabla, v_campos_parametros, p_parametros_proc);
      
           --v_regresa:= 'insert into '||p_nombre_tabla||'('||v_campos_tabla||') values ('||v_campos_parametros||');';
              v_campos_tabla:= null;
              v_campos_parametros:= null; 
              
               for x in cur_campo_tabla loop
                    if v_regresa is not null then
                       v_regresa:= v_regresa||', '||x.columna;

                       if x.data_type = 'NUMBER' then
                          v_parametro:= 'decode('||x.columna||q'[,NULL,'NULL',]'||x.columna||')';
                       elsif x.data_type = 'VARCHAR2' then
                          v_parametro:= 'q'||q'[']'||q'[[']'||']'||q'['||]'||x.columna||q'[||q'[']'||']'||q'[']';
                          --v_parametro:= q'[''''||]'||x.columna||q'[||'''']';
                       elsif x.data_type = 'DATE' then
                          v_parametro:= 'to_char('||x.columna||q'[,'DD/MM/YYYY HH24:MI:SS')]';
                          v_parametro:= q'['TO_DATE('||]'||v_parametro||q'[||','DD/MM/YYYY HH24:MI:SS')']';
                          --v_parametro:= 'decode('||v_parametro||',NULL,?ULL?'||v_parametro||')';
                       else
                          v_parametro:= 'decode('||x.columna||q'[,NULL,'NULL',]'||x.columna||')';
                       end if;  -- fin de if x.data_type = 'NUMBER' then

                       v_campos_parametros:=  v_campos_parametros||q'[||','||]'||v_parametro; 
                       
                    else
                       v_regresa:= x.columna;
                        
                       if x.data_type = 'NUMBER' then
                          v_parametro:= 'decode('||x.columna||q'[,NULL,'NULL',]'||x.columna||')';
                       elsif x.data_type = 'VARCHAR2' then
                          v_parametro:= 'q'||q'[']'||q'[[']'||']'||q'['||]'||x.columna||q'[||q'[']'||']'||q'[']';                       
                       elsif x.data_type = 'DATE' then
                          v_parametro:= 'to_char('||x.columna||q'[,'DD/MM/YYYY HH24:MI:SS')]';
                          v_parametro:= q'['TO_DATE('||]'||v_parametro||q'[||','DD/MM/YYYY HH24:MI:SS')']';
                       else
                          v_parametro:= 'decode('||x.columna||q'[,NULL,'NULL',]'||x.columna||')';
                       end if;  -- fin de if x.data_type = 'NUMBER' then
                       v_campos_parametros:=  q'[||]'||v_parametro;
                        
                    end if;        
               end loop;  --fin de if v_regresa is not null then
               
/*               if substr(v_campos_parametros,length(v_campos_parametros)-1) = '?' then
                  v_campos_parametros:= substr(v_campos_parametros,1,length(v_campos_parametros)-2);
               elsif substr(v_campos_parametros,length(v_campos_parametros)) = ')' then    
                  v_campos_parametros:= v_campos_parametros||'#';              
               end if;
*/               
              
           v_regresa_full:= q'[select 'INSERT INTO ]'||pp_tabla||'('||v_regresa||q'[) values (']'||v_campos_parametros||q'[||');' FROM ]'||pp_tabla;
              
           return v_regresa_full;
      end FUNC_INSERTS_EXPORT;  --end  FUNC_CAMPOS_EXPORT
 
      PROCEDURE PROC_SIMULA_EXPORT is
      begin
         null;
      end PROC_SIMULA_EXPORT;      


      PROCEDURE PROC_GENERA_TYPO_OBJETO(p_nombre_tipo varchar2, p_columnas number, p_tamanio_varchar number) IS
          v_nombre_type varchar2(50);
          v_auxiliar varchar2(1000);      
      BEGIN 
         v_nombre_type:= 'OBJ_'||p_nombre_tipo;
         v_auxiliar:= 'CREATE OR REPLACE TYPE '||v_nombre_type||' AS OBJECT (';
         PROC_ESCRIBE_SALIDA(v_auxiliar); 
            for i in 1.. p_columnas loop
                if i < p_columnas then
                   v_auxiliar:= 'COLUMNA'||i||' VARCHAR2('||p_tamanio_varchar||'),';                    
                else
                   v_auxiliar:= 'COLUMNA'||i||' VARCHAR2('||p_tamanio_varchar||')';                  
                end if; ---fin de if i < p_columnas then
                
                PROC_ESCRIBE_SALIDA(v_auxiliar); 
            end loop;
         
         v_auxiliar:= ');';
         PROC_ESCRIBE_SALIDA(v_auxiliar); 

         v_auxiliar:= 'CREATE OR REPLACE TYPE TYPE_'||p_nombre_tipo||' AS TABLE OF '||v_nombre_type||';';
         PROC_ESCRIBE_SALIDA(v_auxiliar); 
         
      END PROC_GENERA_TYPO_OBJETO;  --FIN DE PROC_GENERA_TYPO_OBJETO

      PROCEDURE PROC_MAPEA_TABLA_PARAM(p_nombre_tabla_param varchar2, p_tabla varchar2) IS
           CURSOR cur_campo_tabla is
                 select column_name columna, data_type
                       from ALL_TAB_COLUMNS -- omorex_tab_columns  --sys.dba_tab_columns 
                  where owner = 'SGTPENAL'
                  and    table_name = p_tabla
                  order by column_id;
           v_parametro varchar2(30);       
           v_regresa varchar2(4000);       
           v_contador number(10);
      BEGIN
           /*
           v_auxiliar:= 'CREATE OR REPLACE TYPE TYPE_'||p_nombre_tipo||' AS TABLE OF '||v_nombre_type||';';
           PROC_ESCRIBE_SALIDA(v_auxiliar);
          */             
           v_contador:= 0;
           PROC_ESCRIBE_SALIDA('/* ++++ Mapeo de campos del PARAMETRO_TABLA "'||p_nombre_tabla_param||'" para la tabla "'||p_tabla||'"');

           
           for x in cur_campo_tabla loop
                v_contador:= v_contador + 1; 

                v_regresa:= p_nombre_tabla_param||'(n).COLUMNA'||v_contador||' -> '||x.columna||';';
                PROC_ESCRIBE_SALIDA(v_regresa);
                
           end loop;  --fin de if v_regresa is not null then

           PROC_ESCRIBE_SALIDA('  ++++ Fin de Mapeo de campos del PARAMETRO_TABLA "'||p_nombre_tabla_param||'" para la tabla "'||p_tabla||'" */');

           PROC_ESCRIBE_SALIDA(' ');
           
           v_contador:= 0;
           for x in cur_campo_tabla loop
                v_contador:= v_contador + 1; 

                --v_regresa:= p_nombre_tabla_param||'(i).COLUMNA'||v_contador||':= '||x.columna||';';
                v_regresa:= x.columna||':= '||p_nombre_tabla_param||'(i).COLUMNA'||v_contador||';';
                
                PROC_ESCRIBE_SALIDA(v_regresa);
                
           end loop;  --fin de if v_regresa is not null then
      END PROC_MAPEA_TABLA_PARAM;  -- fin de PROC_MAPEA_TABLA_PARAM
END PKG_APOYO_INSERTS;
/



--
-- PKG_CONSTANTES  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY SIDEP.PKG_CONSTANTES AS
    
    FUNCTION NOMBRE_ESQUEMA RETURN VARCHAR2 AS BEGIN RETURN 'RRHH'; END NOMBRE_ESQUEMA; 
    FUNCTION ES_DESARROLLO RETURN NUMBER AS BEGIN RETURN 1; END ES_DESARROLLO;
    FUNCTION VERSION_SISTEMA RETURN FLOAT AS BEGIN RETURN 0.25; END VERSION_SISTEMA;
    FUNCTION TIPO_PAIS RETURN NUMBER AS BEGIN RETURN 1; END TIPO_PAIS;
    --SOURCE
    FUNCTION source_bdd RETURN NUMBER AS BEGIN RETURN 1; END source_bdd;
    FUNCTION source_app RETURN NUMBER AS BEGIN RETURN 2; END source_app;
    --ESTADO DEL REGISTRO
    FUNCTION estado_activo RETURN NUMBER AS BEGIN RETURN 1; END estado_activo;
    FUNCTION estado_inactivo RETURN NUMBER AS BEGIN RETURN 2; END estado_inactivo;   
    --TIPO DE GESTION
    FUNCTION CREACION_DEPENDENCIA RETURN NUMBER AS BEGIN RETURN 1; END CREACION_DEPENDENCIA;
    FUNCTION ACTUALIZA_DEPENDENCIA RETURN NUMBER AS BEGIN RETURN 2; END ACTUALIZA_DEPENDENCIA;
    FUNCTION REGULARIZA_DEPENDENCIA RETURN NUMBER AS BEGIN RETURN 3; END REGULARIZA_DEPENDENCIA;
    FUNCTION BAJA_DEPENDENCIA RETURN NUMBER AS BEGIN RETURN 4; END BAJA_DEPENDENCIA;
    --TIPO DE PROCESO
    FUNCTION SOLICITUD RETURN NUMBER AS BEGIN RETURN 1; END SOLICITUD;
    FUNCTION ATENDIDA RETURN NUMBER AS BEGIN RETURN 2; END ATENDIDA;
    FUNCTION RECHAZADA RETURN NUMBER AS BEGIN RETURN 3; END RECHAZADA;
    --PERFILES
    FUNCTION SNP RETURN NUMBER AS BEGIN RETURN 84; END SNP;
    FUNCTION UCPAS RETURN NUMBER AS BEGIN RETURN 85; END UCPAS;
    FUNCTION CIT RETURN NUMBER AS BEGIN RETURN 86; END CIT;
    FUNCTION CIDEJ RETURN NUMBER AS BEGIN RETURN 87; END CIDEJ;
    FUNCTION ADMIN_UCPAS RETURN NUMBER AS BEGIN RETURN 88; END ADMIN_UCPAS;
    --REPORTES
    FUNCTION TIPO_DATO_NUMERO RETURN NUMBER AS BEGIN RETURN 3; END TIPO_DATO_NUMERO;
    FUNCTION TIPO_DATO_LISTA RETURN NUMBER AS BEGIN RETURN 1; END TIPO_DATO_LISTA;
    --SIGEVA UNUM UDOT/UDI
    FUNCTION UDOT_UNUM RETURN NUMBER AS BEGIN RETURN 6901; END UDOT_UNUM;
    FUNCTION UDI_UNUM RETURN NUMBER AS BEGIN RETURN 7464; END UDI_UNUM;
END PKG_CONSTANTES;
/
--
-- RH_DEPARTAMENTO  (Table) 
--
CREATE TABLE SIDEP.RH_DEPARTAMENTO
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
COMMENT ON TABLE SIDEP.RH_DEPARTAMENTO IS 'Descripcion general de los Departamentos y/o Provincias del Pais';
COMMENT ON COLUMN SIDEP.RH_DEPARTAMENTO.PAIS IS 'Codigo del pais';
COMMENT ON COLUMN SIDEP.RH_DEPARTAMENTO.DEPARTAMENTO IS 'Codigo del departamento o provincia';
COMMENT ON COLUMN SIDEP.RH_DEPARTAMENTO.NOMBRE_DEPARTAMENTO IS 'Nombre del departamento o provincia';
COMMENT ON COLUMN SIDEP.RH_DEPARTAMENTO.ABREVIATURA_DEPARTAMENTO IS 'Abreviatura del departamento';
COMMENT ON COLUMN SIDEP.RH_DEPARTAMENTO.AREA IS 'Area geografica donde se encuentra el departamento, CENTRAL, OCCIDENTE, ORIENTE, NORTE, SUR.';
COMMENT ON COLUMN SIDEP.RH_DEPARTAMENTO.CODIGO_PRESUPUESTARIO IS 'Codigo presupestario definido para este departamento';
COMMENT ON COLUMN SIDEP.RH_DEPARTAMENTO.CUOTA_LABORAL_IGSS IS 'Porcentaje de la cuota laboral del IGSS para el OJ, segun el departamento.';
COMMENT ON COLUMN SIDEP.RH_DEPARTAMENTO.CUOTA_PATRONAL_IGSS IS 'Cuotra patronal de IGSS';
/


--
-- RH_MUNICIPIO  (Table) 
--
CREATE TABLE SIDEP.RH_MUNICIPIO
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

COMMENT ON TABLE SIDEP.RH_MUNICIPIO IS 'Descripcion general de los municipios departamentales.';
COMMENT ON COLUMN SIDEP.RH_MUNICIPIO.PAIS IS 'Codigo del pais';
COMMENT ON COLUMN SIDEP.RH_MUNICIPIO.DEPARTAMENTO IS 'Codigo del departamento o provincia';
COMMENT ON COLUMN SIDEP.RH_MUNICIPIO.MUNICIPIO IS 'Codigo del municipio';
COMMENT ON COLUMN SIDEP.RH_MUNICIPIO.NOMBRE_MUNICIPIO IS 'Nombre del municipio';
COMMENT ON COLUMN SIDEP.RH_MUNICIPIO.ABREVIATURA_MUNICIPIO IS 'Abreviatura del municipio departamenta';
/

--
-- TS_ESTADO  (Table) 
--
CREATE TABLE SIDEP.TS_ESTADO
(
  ID_ESTADO       NUMBER                        NOT NULL,
  ESTADO          VARCHAR2(100 BYTE)            NOT NULL,
  FECHA_CREACION  DATE                          NOT NULL,
  OBSERVACIONES   VARCHAR2(200 BYTE),
  ID_SOURCE       NUMBER                        NOT NULL,
  ACTIVO          NUMBER
)
/

--
-- TS_OBJETO_TRAZABLE  (Table) 
--
CREATE TABLE SIDEP.TS_OBJETO_TRAZABLE
(
  ID_OBJETO_TRAZABLE  NUMBER                    NOT NULL,
  OBJETO_TRAZABLE     VARCHAR2(100 BYTE)        NOT NULL,
  DESCRIPCION         VARCHAR2(200 BYTE)        NOT NULL,
  ID_ESTADO           NUMBER                    NOT NULL
)
/


--
-- TT_TRAZABILIDAD  (Table) 
--
CREATE TABLE SIDEP.TT_TRAZABILIDAD
(
  ID_TRAZABILIDAD     NUMBER                    NOT NULL,
  FECHA_ALTA          DATE                      NOT NULL,
  FECHA_BAJA          DATE,
  ID_OBJETO_TRAZABLE  NUMBER                    NOT NULL
)
/

--
-- PK_TS_ESTADO  (Index) 
--
CREATE UNIQUE INDEX SIDEP.PK_TS_ESTADO ON SIDEP.TS_ESTADO
(ID_ESTADO)
TABLESPACE USERS
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
           );
/

--
-- PK_TS_OBJETO_TRAZABLE  (Index) 
--
CREATE UNIQUE INDEX SIDEP.PK_TS_OBJETO_TRAZABLE ON SIDEP.TS_OBJETO_TRAZABLE
(ID_OBJETO_TRAZABLE)
TABLESPACE USERS
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
           );
/

--
-- PK_TT_TRAZABILIDAD  (Index) 
--
CREATE UNIQUE INDEX SIDEP.PK_TT_TRAZABILIDAD ON SIDEP.TT_TRAZABILIDAD
(ID_TRAZABILIDAD)
TABLESPACE USERS
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
           );

/
--
-- PKG_CREA_TRIGGERS_TRAZABILIDAD  (Package) 
--
CREATE OR REPLACE PACKAGE SIDEP."PKG_CREA_TRIGGERS_TRAZABILIDAD" AS
/******************************************************************************
   NAME:       PKG_CREA_TRIGGERS_TRAZABILIDAD
   PURPOSE:    Al ejecutar este paquete se crearan o reemplazaran los triggers de las tablas 
               que esten configuradas en TC_OBJETO_TRAZABLE para llevar trazabilidad.

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        10/04/2014      MFong       1. Created this package.
******************************************************************************/

  PROCEDURE PROC_BUSCA_OBJETO_TRAZABLE;

  PROCEDURE CREA_TRIGGER_TRAZABILIDAD (p_nombre_tabla VARCHAR2, p_esquema VARCHAR2);

END PKG_CREA_TRIGGERS_TRAZABILIDAD;
/

--
-- RH_PKG  (Package) 
--
CREATE OR REPLACE PACKAGE SIDEP.RH_PKG AS
      
      FUNCTION Departamento ( PRMPais in number, PRMDepartamento in number ) return varchar2;        
      
      FUNCTION Municipio( PRMPais in number, PRMDepartamento in number, PRMMunicipio in number ) return varchar2;      
END;
/

--
-- PKG_CREA_TRIGGERS_TRAZABILIDAD  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY SIDEP."PKG_CREA_TRIGGERS_TRAZABILIDAD" AS
/******************************************************************************
   NAME:       PKG_CREA_TRIGGERS_TRAZABILIDAD
   PURPOSE:    Al ejecutar este paquete se crearan o reemplazaran los triggers de las tablas 
               que esten configuradas en TC_OBJETO_TRAZABLE para llevar trazabilidad.

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        10/04/2014      MFong       1. Created this package.
******************************************************************************/


PROCEDURE PROC_BUSCA_OBJETO_TRAZABLE IS

/******************************************************************************
   NAME:       PROC_BUSCA_OBJETO_TRAZABLE
   PURPOSE:    Este procedimiento recorre la tabla TC_OBJETO_TRAZABLE y por cada registro que encuentra, llama al procedure:CREA_TRIGGER_TRAZABILIDAD 
               enviando como parametro el nombre del objeto. 

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        10/04/2014   MFong       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PROC_BUSCA_OBJETO_TRAZABLE
      Sysdate:         10/04/2014
      Date and Time:   10/04/2014, 12:58:21 p.m., and 10/04/2014 12:58:21 p.m.
      Username:        MFong (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/

v_cur_dataset SYS_REFCURSOR;
v_nombre_objeto VARCHAR2(30);
c_esquema CONSTANT VARCHAR2(30) :='SGTPENAL';

BEGIN

    OPEN v_cur_dataset FOR
        SELECT OBJETO_TRAZABLE FROM TS_OBJETO_TRAZABLE;

    Loop
        exit when v_cur_dataset%notfound;
        Fetch v_cur_dataset into v_nombre_objeto;
        CREA_TRIGGER_TRAZABILIDAD (v_nombre_objeto, c_esquema); 

    End loop;


   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END;  --PROC_BUSCA_OBJETO_TRAZABLE;



 PROCEDURE CREA_TRIGGER_TRAZABILIDAD (p_nombre_tabla VARCHAR2, p_esquema VARCHAR2) IS
/******************************************************************************
   NAME:       CREA_TRIGGER_TRAZABILIDAD
   PURPOSE:  Procedimiento que genera el trigger para crear la trazabilidad de un registro de la tabla que se recibe como parametro   

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        07/04/2014   MFong       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     CREA_TRIGGER_TRAZABILIDAD
      Sysdate:         07/04/2014
      Date and Time:   07/04/2014, 11:55:38 a.m., and 07/04/2014 11:55:38 a.m.
      Username:        MFong (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

     Parametros recibidos: 
     p_nombre_tabla: Nombre de la tabla, para la que se desea crear el trigger 
    p_esquema:       Nombre del esquema al que pertenece la tabla 


******************************************************************************/

    v_columnas VARCHAR2(4000);
    v_columnas_historico VARCHAR2(4000);
    v_hay_cambios VARCHAR2(200);
    v_contador NUMBER := 0;
    v_query_crea_trigger VARCHAR2(32000);
    v_query_comparativo VARCHAR2(32000);
    i NUMBER := 0;
    v_id_objeto_trazable NUMBER := 0;
    v_query VARCHAR2(500);  
    v_numero_cambios NUMBER :=0;
    v_nombre_trigger VARCHAR2(30);    
    v_nombre_tabla VARCHAR2(30);      



BEGIN

  SELECT COUNT(ID_OBJETO_TRAZABLE) INTO v_id_objeto_trazable FROM TS_OBJETO_TRAZABLE WHERE TRIM(OBJETO_TRAZABLE) = p_nombre_tabla;
   IF v_id_objeto_trazable > 0 THEN
     BEGIN



     -- Se recrorren los campos de la tabla para buscar cambios, de no haberlos no se hace la trazabilidad del registro
     FOR A IN (select OWNER, COLUMN_NAME, TABLE_NAME FROM ALL_TAB_COLUMNS WHERE TRIM(TABLE_NAME) = p_nombre_tabla AND OWNER = p_esquema)
     LOOP
       BEGIN

         IF TRIM(UPPER(A.column_name)) <> 'ID_TRAZABILIDAD' THEN
            i := i + 1;
            v_query_comparativo:= v_query_comparativo || '      SELECT DECODE(:NEW.'||A.column_name||',:OLD.'||A.column_name||',0,1) INTO v_numero_cambios (' || i || ') FROM DUAL;' || CHR(13);
         END IF;

         IF v_contador > 0 THEN
           v_columnas:= v_columnas || ', :OLD.' || A.COLUMN_NAME;
           v_columnas_historico := v_columnas_historico || ', ' || A.COLUMN_NAME;
         ELSE
           v_columnas:= ':OLD.' || A.COLUMN_NAME;
           v_columnas_historico := A.COLUMN_NAME;
         END IF;
         v_contador := v_contador + 1;
       END;
     END LOOP;

     --Se toman los primeros 24 caracteres del nombre de la tabla para formar el nombre del trigger
     SELECT SUBSTR(p_nombre_tabla,1,24) into v_nombre_trigger FROM DUAL;

     --Se toma el nombre de la tabla a partir de la cuarta posicion para formar el nombre del campo llave cuando es secuencia, se quita 'TT_'
     SELECT SUBSTR(p_nombre_tabla,4) into v_nombre_tabla FROM DUAL;

     v_query_crea_trigger := 
     'CREATE OR REPLACE TRIGGER ' || p_esquema || '.TR_'|| v_nombre_trigger || '_TR' || CHR(13) ||
    -- 'BEFORE INSERT OR UPDATE OR DELETE ON ' || p_nombre_tabla || CHR(13) ||  
     'BEFORE INSERT OR UPDATE OR DELETE ON ' || p_esquema || '.' || p_nombre_tabla || CHR(13) ||  
     'FOR EACH ROW ' || CHR(13) ||
     'DECLARE ' || CHR(13) || 
     '-- ' || CHR(13) || 
     '-- Purpose: Este trigger realiza todo el proceso de trazabilidad del registro ' || CHR(13) ||
     '-- Este trigger fue generado por medio del procedimiento almacenado: CREA_TRIGGER_TRAZABILIDAD ' || CHR(13) ||
     '-- ' || CHR(13) ||
     '-- MODIFICATION HISTORY ' || CHR(13) || 
     '-- Procedimiento           Date    ' || CHR(13) || 
     '-- ---------          ------  ' || CHR(13) ||
     '-- CREA_TRIGGER_TRAZABILIDAD ' || SYSDATE || CHR(13) ||
     '-- ' || CHR(13) || CHR(13) ||
     'v_id_registro NUMBER; ' || CHR(13) ||
     'v_cambio NUMBER := 0; ' || CHR(13) ||
     'v_ip_usuario VARCHAR2(15) := ''10.101.3.65'';' || CHR(13) ||
     'v_llave_secuencia NUMBER := 0; ' || CHR(13) ||
     'v_nuevo CONSTANT NUMBER := 1; ' || CHR(13) ||
     'v_baja CONSTANT NUMBER := 2; ' || CHR(13) ||
     'v_actualizado CONSTANT NUMBER := 3; ' || CHR(13) || CHR(13) ||
     'v_id_trazabilidad NUMBER; ' || CHR(13) || CHR(13) ||
     'TYPE t_cambio IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;' || CHR(13) ||
     'v_numero_cambios t_cambio; ' || CHR(13) || CHR(13) ||
     'BEGIN ' || CHR(13) ||
     '   IF INSERTING THEN ' || CHR(13) ||
     '      :NEW.ID_TRAZABILIDAD := FUNC_TRAZABILIDAD(0, ''' || p_nombre_tabla || ''', v_nuevo, v_ip_usuario);' || CHR(13) || CHR(13) || 
     '   ELSIF UPDATING THEN ' || CHR(13) || 
     '     -- Querys para comparar los campos actuales y nuevos para verificar que existan cambios' || CHR(13) ||  
           v_query_comparativo || CHR(13) || 
     '     FOR i IN 1 .. v_numero_cambios.count ' || CHR(13) ||
     '          LOOP ' || CHR(13) ||
     '              IF v_numero_cambios(i) > 0 THEN ' || CHR(13) ||
     '                  v_cambio := 1; ' || CHR(13) ||
     '              END IF; ' || CHR(13) ||
     '          END LOOP; ' || CHR(13) || CHR(13) || 

     '          IF v_cambio > 0 THEN ' || CHR(13) ||
     '              INSERT INTO TH_'|| v_nombre_tabla || ' (' || v_columnas_historico || ') VALUES (' || v_columnas || ');' || CHR(13) ||
     '              :NEW.ID_TRAZABILIDAD := FUNC_TRAZABILIDAD(:OLD.ID_TRAZABILIDAD, ''' || p_nombre_tabla || ''', v_actualizado, v_ip_usuario);' || CHR(13) ||
     '          END IF; ' || CHR(13) || CHR(13) ||
     '   ELSIF DELETING THEN ' || CHR(13) ||
     '       INSERT INTO TH_'|| v_nombre_tabla || ' (' || v_columnas_historico || ') VALUES (' || v_columnas || ');' || CHR(13) ||
     '       v_id_trazabilidad := FUNC_TRAZABILIDAD(:OLD.ID_TRAZABILIDAD, ''' || p_nombre_tabla || ''', v_baja, v_ip_usuario);' || CHR(13) ||
     '   END IF; ' || CHR(13) || CHR(13) ||
     'END '||'TR_'|| v_nombre_trigger || '_TR;' || CHR(13);

     dbms_output.put_line(v_query_crea_trigger);

    --    EXECUTE IMMEDIATE v_query_crea_trigger;

    --  v_query_crea_trigger := 'ALTER TRIGGER ' || p_esquema || '.TR_'|| v_nombre_trigger || '_TR; COMPILE;';

   --  dbms_output.put_line(v_query_crea_trigger);

   --     EXECUTE IMMEDIATE v_query_crea_trigger;

   END;
   ELSE
      dbms_output.put_line('No es posible crear el TRIGGER de la tabla: ' || p_nombre_tabla || ' - No existe el objeto en el catalogo de tipos de objetos  ');
   END IF;

  EXCEPTION WHEN OTHERS THEN
          dbms_output.put_line('Fallo la creacion del trigger para la tabla: ' || p_nombre_tabla || ' - ' || SQLERRM);

END; --CREA_TRIGGER_TRAZABILIDAD;



END PKG_CREA_TRIGGERS_TRAZABILIDAD;
/

--
-- RH_PKG  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY SIDEP.RH_PKG AS

      -- PARAMETROS GENERALES
      
      -- ----------------------------------------------------------------------------------------------------------
      -- Procedimiento general de RRHH
      --  ---------------------------------------------------------------------------------------------------------


      FUNCTION vDepartamento ( PRMPais in number, PRMDepartamento in number, VNombreDepartamento out rh_departamento.nombre_departamento%type ) return boolean is
      begin
            select nombre_departamento into VNombreDepartamento
            from rh_departamento
            where pais = PRMPais
            and   departamento = PRMDepartamento;
            return true;  
      exception when no_data_found then
            return false; 
      end; 
            
      FUNCTION Departamento ( PRMPais in number, PRMDepartamento in number ) return varchar2 is
        VNombreDepartamento rh_departamento.nombre_departamento%type; 
      begin      
            if vDepartamento( PRMPais, PRMDepartamento, VNombreDepartamento ) then
                return VNombreDepartamento; 
            else
                return 'Codigo no valido'; 
            end if;
      end;  

      FUNCTION vMunicipio( PRMPais in number, PRMDepartamento in number, PRMMunicipio in number, VNombreMunicipio out rh_municipio.nombre_municipio%type ) return boolean is
      begin
            select nombre_municipio into VNombreMunicipio
            from rh_municipio
            where pais = PRMPais
            and   departamento = PRMDepartamento
            and   municipio = PRMMunicipio;            
            return true;  
      exception when no_data_found then
            return false; 
      end;  
            
      FUNCTION Municipio( PRMPais in number, PRMDepartamento in number, PRMMunicipio in number ) return varchar2 is
        VNombreMunicipio rh_municipio.nombre_municipio%type;       
      begin      
            if vMunicipio( PRMPais, PRMDepartamento, PRMMunicipio, VNombreMunicipio ) then
                return VNombreMunicipio; 
            else
                return 'Codigo no valido'; 
            end if;
      end;  

END;
/
--
-- RH_DIRECCION_DEPENDENCIA  (Table) 
--
CREATE TABLE SIDEP.RH_DIRECCION_DEPENDENCIA
(
  ID_DIRECCION            NUMBER(5)             NOT NULL,
  PAIS                    NUMBER(3),
  DEPARTAMENTO            NUMBER(3),
  MUNICIPIO               NUMBER(3),
  AVENIDA_CALLE           VARCHAR2(30 BYTE),
  APARTAMENTO_CASA        VARCHAR2(30 BYTE),
  ZONA                    NUMBER(2),
  BARRIO_COLONIA_CASERIO  VARCHAR2(60 BYTE),
  EDIFICIO                VARCHAR2(60 BYTE),
  DIRECCION_SIMPLE        VARCHAR2(512 BYTE)
)
/

COMMENT ON TABLE SIDEP.RH_DIRECCION_DEPENDENCIA IS 'Maestro de solo direcciones para asigarlo solo a las dependencias.';
COMMENT ON COLUMN SIDEP.RH_DIRECCION_DEPENDENCIA.ID_DIRECCION IS 'Codigo de identificacion de la direccion';
COMMENT ON COLUMN SIDEP.RH_DIRECCION_DEPENDENCIA.PAIS IS 'Codigo del pais';
COMMENT ON COLUMN SIDEP.RH_DIRECCION_DEPENDENCIA.DEPARTAMENTO IS 'Codigo del departamento o provincia';
COMMENT ON COLUMN SIDEP.RH_DIRECCION_DEPENDENCIA.MUNICIPIO IS 'Codigo del municipio';
COMMENT ON COLUMN SIDEP.RH_DIRECCION_DEPENDENCIA.AVENIDA_CALLE IS 'Numero de calle o avenida de la ubicacion de la dependencia';
COMMENT ON COLUMN SIDEP.RH_DIRECCION_DEPENDENCIA.APARTAMENTO_CASA IS 'Numero de apartamento o case, lote o mansana donde esta ubicada la dependencia';
COMMENT ON COLUMN SIDEP.RH_DIRECCION_DEPENDENCIA.ZONA IS 'Zona de la dependencia';
COMMENT ON COLUMN SIDEP.RH_DIRECCION_DEPENDENCIA.BARRIO_COLONIA_CASERIO IS 'Barrio, Colonia, o Caserio donde esta ubicada la dependencia';
COMMENT ON COLUMN SIDEP.RH_DIRECCION_DEPENDENCIA.EDIFICIO IS 'Nombre del Edificio donde esta ubicado la dependencia';
/


--
-- TC_USUARIO  (Table) 
--
CREATE TABLE SIDEP.TC_USUARIO
(
  ID_USUARIO      NUMBER                        NOT NULL,
  USUARIO         VARCHAR2(100 BYTE)            NOT NULL,
  NOMBRE          VARCHAR2(200 BYTE)            NOT NULL,
  CORREO          NVARCHAR2(100)                NOT NULL,
  ID_SOURCE       NUMBER                        NOT NULL,
  OBSERVACIONES   VARCHAR2(200 BYTE),
  FECHA_CREACION  DATE                          NOT NULL,
  ID_ESTADO       NUMBER                        NOT NULL,
  IP              VARCHAR2(23 BYTE)
)
/


--
-- TS_ESTADO_PROCESO  (Table) 
--
CREATE TABLE SIDEP.TS_ESTADO_PROCESO
(
  ID_ESTADO_PROCESO    NUMBER,
  ESTADO_PROCESO       VARCHAR2(50 BYTE),
  ID_SOURCE            NUMBER,
  ID_ESTADO            NUMBER,
  FECHA_CREACION       DATE,
  OBSERVACIONES        VARCHAR2(200 BYTE),
  ID_USUARIO_REGISTRO  NUMBER
)
/


--
-- TS_TIPO_GESTION  (Table) 
--
CREATE TABLE SIDEP.TS_TIPO_GESTION
(
  ID_TIPO_GESTION      NUMBER,
  TIPO_GESTION         VARCHAR2(50 BYTE)        NOT NULL,
  ID_SOURCE            NUMBER,
  ID_ESTADO            NUMBER,
  FECHA_CREACION       DATE,
  OBSERVACIONES        VARCHAR2(200 BYTE),
  ID_USUARIO_REGISTRO  NUMBER
)
/


--
-- TT_DEPENDENCIA_CORREO  (Table) 
--
CREATE TABLE SIDEP.TT_DEPENDENCIA_CORREO
(
  ID_DEPENDENCIA_CORREO  NUMBER                 NOT NULL,
  DEPENDENCIA            NUMBER                 NOT NULL,
  CORREO_ELECTRONICO     VARCHAR2(50 BYTE)      NOT NULL,
  ID_ESTADO              NUMBER                 NOT NULL,
  ID_SOURCE              NUMBER                 NOT NULL,
  ID_USUARIO_REGISTRO    NUMBER                 NOT NULL,
  FECHA_REGISTRO         DATE                   NOT NULL,
  OBSERVACIONES          VARCHAR2(200 BYTE),
  ID_TRAZABILIDAD        NUMBER,
  IP                     VARCHAR2(23 BYTE)
)
/


--
-- TT_DEPENDENCIA_RH_CIDEJ  (Table) 
--
CREATE TABLE SIDEP.TT_DEPENDENCIA_RH_CIDEJ
(
  ID_DEP_RH_CIDEJ      NUMBER                   NOT NULL,
  DEPENDENCIA          NUMBER                   NOT NULL,
  ID_DESPACHO          NUMBER                   NOT NULL,
  ID_ESTADO            NUMBER                   NOT NULL,
  ID_SOURCE            NUMBER                   NOT NULL,
  ID_USUARIO_REGISTRO  NUMBER                   NOT NULL,
  FECHA_REGISTRO       DATE                     NOT NULL,
  OBSERVACIONES        VARCHAR2(200 BYTE),
  ID_TRAZABILIDAD      NUMBER,
  IP                   VARCHAR2(23 BYTE)
)
/
--
-- TT_GEST_DEPENDENCIA  (Table) 
--
CREATE TABLE SIDEP.TT_GEST_DEPENDENCIA
(
  ID_GESTION_DEPENDENCIA  NUMBER,
  CODIGO_DEPENDENCIA      NUMBER,
  CODIGO_PRESUPUESTARIO   NUMBER,
  NOMBRE_DEPENDENCIA      VARCHAR2(1024 BYTE),
  NOMBRE_GAFETE           VARCHAR2(1024 BYTE),
  NOMBRE_ABREVIADO        VARCHAR2(1024 BYTE),
  NOMBRE_DOCUMENTO        VARCHAR2(1024 BYTE),
  CONECTOR                VARCHAR2(10 BYTE),
  FECHA_DEL_ACUERDO       DATE,
  FECHA_ENTRA_VIGENCIA    DATE,
  FECHA_ANULACION         DATE,
  REFERENCIA              VARCHAR2(2048 BYTE),
  FUNCION_UNIDAD          VARCHAR2(5 BYTE),
  DEPARTAMENTO            NUMBER,
  MUNICIPIO               NUMBER,
  TIPO_AREA               NUMBER,
  ACUERDO_DIGITAL         VARCHAR2(512 BYTE),
  ID_TIPO_GESTION         NUMBER,
  ID_ESTADO               NUMBER                NOT NULL,
  ID_SOURCE               NUMBER                NOT NULL,
  IP                      VARCHAR2(50 BYTE),
  ID_ESTADO_PROCESO       NUMBER                NOT NULL,
  ID_TRAZABILIDAD         NUMBER,
  OBSERVACIONES           VARCHAR2(2048 BYTE),
  ID_USUARIO_REGISTRO     NUMBER                NOT NULL,
  FECHA_REGISTRO          DATE                  NOT NULL,
  FECHA_PUBLICACION       DATE,
  OBS_FECHA_VIGENCIA      VARCHAR2(512 BYTE)
)
/

--
-- PK_TC_USUARIO  (Index) 
--
CREATE UNIQUE INDEX SIDEP.PK_TC_USUARIO ON SIDEP.TC_USUARIO
(ID_USUARIO)
TABLESPACE USERS
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
           );

/

--
-- PK_TT_GEST_DEPENDENCIA  (Index) 
--
CREATE UNIQUE INDEX SIDEP.PK_TT_GEST_DEPENDENCIA ON SIDEP.TT_GEST_DEPENDENCIA
(ID_GESTION_DEPENDENCIA)
TABLESPACE USERS
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
           );
/

--
-- TS_TIPO_GESTION_PK  (Index) 
--
CREATE UNIQUE INDEX SIDEP.TS_TIPO_GESTION_PK ON SIDEP.TS_TIPO_GESTION
(ID_TIPO_GESTION)
TABLESPACE USERS
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
           );
/


--
-- TT_DEPENDENCIA_CORREO_PK  (Index) 
--
CREATE UNIQUE INDEX SIDEP.TT_DEPENDENCIA_CORREO_PK ON SIDEP.TT_DEPENDENCIA_CORREO
(ID_DEPENDENCIA_CORREO)
TABLESPACE USERS
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
           );
/

--
-- TT_DEPENDENCIA_RH_CIDEJ_PK  (Index) 
--
CREATE UNIQUE INDEX SIDEP.TT_DEPENDENCIA_RH_CIDEJ_PK ON SIDEP.TT_DEPENDENCIA_RH_CIDEJ
(ID_DEP_RH_CIDEJ)
TABLESPACE USERS
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
           );

/

--
-- RH_DEPENDENCIA  (Table) 
--
CREATE TABLE SIDEP.RH_DEPENDENCIA
(
  DEPENDENCIA                   NUMBER(8)       NOT NULL,
  ID_DIRECCION                  NUMBER(5)       NOT NULL,
  NOMBRE_DEPENDENCIA            VARCHAR2(1024 BYTE) NOT NULL,
  NOMBRE_GAFETE                 VARCHAR2(1024 BYTE) NOT NULL,
  NOMBRE_ABREVIADO              VARCHAR2(1024 BYTE) NOT NULL,
  CLASIFICACION_DEPENDENCIA     NUMBER(4)       DEFAULT 1                     NOT NULL,
  DEPENDENCIA_PADRE             NUMBER(8),
  MATERIA                       NUMBER(3)       NOT NULL,
  DEPENDENCIA_VIGENTE           CHAR(1 BYTE)    DEFAULT 'S'                   NOT NULL,
  FECHA_CREACION_DEPENDENCIA    DATE            NOT NULL,
  FECHA_ANULACION_DEPENDENCIA   DATE,
  TELEFONOS                     VARCHAR2(60 BYTE),
  CONECTOR_DEPENDENCIA          VARCHAR2(20 BYTE) DEFAULT 'DE LA' NOT NULL,
  NOMBRE_DEPENDENCIA_DOCUMENTO  VARCHAR2(1024 BYTE) NOT NULL,
  UNIDAD_PRESUPUESTARIA         CHAR(1 BYTE)    DEFAULT 'N'                   NOT NULL,
  FUNCION_UNIDAD                CHAR(1 BYTE)    DEFAULT 'N'                   NOT NULL,
  CODIGO_PRESUPUESTARIO         NUMBER(5)       DEFAULT 0                     NOT NULL,
  REFERENCIA                    VARCHAR2(1024 BYTE) NOT NULL,
  USUARIO_CREADOR               VARCHAR2(40 BYTE) DEFAULT user NOT NULL,
  FECHA_MODIFICACION            DATE            DEFAULT SYSDATE,
  USUARIO_MODIFICO              VARCHAR2(20 BYTE),
  ID_CAMARA                     NUMBER(2),
  ID_COMPETENCIA                NUMBER(2),
  ID_ESPECIALIDAD               NUMBER(3),
  ID_AREA                       NUMBER(2),
  NOMBRE_DEPENDENCIA_UCI        VARCHAR2(250 BYTE),
  ID_IGSS                       NUMBER(4)       DEFAULT 0,
  ACUERDO_DIGITAL               VARCHAR2(512 BYTE),
  FECHA_ENTRA_VIGENCIA          DATE,
  FECHA_PUBLICACION             DATE,
  OBS_FECHA_VIGENCIA            VARCHAR2(512 BYTE)
)
/

COMMENT ON TABLE SIDEP.RH_DEPENDENCIA IS 'Dependencias del Organismo Judicial';
COMMENT ON COLUMN SIDEP.RH_DEPENDENCIA.DEPENDENCIA IS 'Codigo de la dependencia';
COMMENT ON COLUMN SIDEP.RH_DEPENDENCIA.ID_DIRECCION IS 'Codigo de identificacion de la direccion';
COMMENT ON COLUMN SIDEP.RH_DEPENDENCIA.NOMBRE_DEPENDENCIA IS 'Nombre de la dependencia';
COMMENT ON COLUMN SIDEP.RH_DEPENDENCIA.NOMBRE_GAFETE IS 'Nombre de la dependencia para imprimir en gafete';
COMMENT ON COLUMN SIDEP.RH_DEPENDENCIA.NOMBRE_ABREVIADO IS 'Nombre abreviado de la dependencia';
COMMENT ON COLUMN SIDEP.RH_DEPENDENCIA.UNIDAD_PRESUPUESTARIA IS 'Indica si es presupuestaria o funcional';
COMMENT ON COLUMN SIDEP.RH_DEPENDENCIA.FUNCION_UNIDAD IS 'Funcion de la unidad Normal, Turno, Alto Impacto.';
/


--
-- RH_DEPENDENCIA_GPS  (Table) 
--
CREATE TABLE SIDEP.RH_DEPENDENCIA_GPS
(
  DEPENDENCIA        NUMBER(8),
  LONGITUD           VARCHAR2(50 BYTE),
  CREA_FECHA         DATE                       DEFAULT SYSDATE,
  CREA_EMPLEADO      INTEGER,
  BAJA_FECHA         DATE,
  BAJA_EMPLEADO      INTEGER,
  ESTADO             INTEGER                    DEFAULT 1,
  CODIGO_SGT         VARCHAR2(20 BYTE),
  DIRECCION_SIMPLE   VARCHAR2(200 BYTE),
  TELEFONO           VARCHAR2(100 BYTE),
  ICONO_ID           INTEGER,
  MATERIA_ID         INTEGER,
  CODIGO_INE         INTEGER,
  ISO3166_2          VARCHAR2(2 BYTE),
  ISO3166_3          VARCHAR2(3 BYTE),
  LATITUD            VARCHAR2(50 BYTE),
  TELEFONO_COMPLETO  VARCHAR2(200 BYTE)
)
/
--
-- RH_PLAZA  (Table) 
--
CREATE TABLE SIDEP.RH_PLAZA
(
  PLAZA                     NUMBER(5)           NOT NULL,
  DEPENDENCIA               NUMBER(8)           NOT NULL,
  PUESTO                    NUMBER(5)           NOT NULL,
  STATUS_PLAZA              VARCHAR2(1 BYTE)    DEFAULT 'D'                   NOT NULL,
  FECHA_PRESUPUESTADA       DATE                NOT NULL,
  FECHA_SUPRESION           DATE,
  NUMERO_INDIVIDUAL         NUMBER(4)           DEFAULT 0                     NOT NULL,
  PLAZAPERMANENTE           VARCHAR2(1 BYTE)    DEFAULT 'N'                   NOT NULL,
  PLANILLA_LISTADO          NUMBER(5)           DEFAULT 1                     NOT NULL,
  FIANZA                    CHAR(1 BYTE)        DEFAULT 'N'                   NOT NULL,
  FEC_INGRESO_REGISTRO      DATE                DEFAULT sysdate               NOT NULL,
  USR_INGRESO_REGISTRO      VARCHAR2(40 BYTE)   DEFAULT user                  NOT NULL,
  FECHA_REGISTRO_SUPRESION  DATE,
  PLAZA_FUNCIONAL           NUMBER(5),
  REFERENCIA                VARCHAR2(1024 BYTE),
  USUARIO_BAJA_PLAZA        VARCHAR2(30 BYTE),
  FECHA_CAMBIO_STATUS       DATE,
  USUARIO_CAMBIO_STATUS     VARCHAR2(40 BYTE)
)
/

COMMENT ON TABLE SIDEP.RH_PLAZA IS 'Definicion de las diferentes plazas creadas en el OJ';
COMMENT ON COLUMN SIDEP.RH_PLAZA.PLAZA IS 'Codigo de identificacion para Plaza';
COMMENT ON COLUMN SIDEP.RH_PLAZA.DEPENDENCIA IS 'Codigo de la dependencia en donde esta definida o pertenece esta plaza';
COMMENT ON COLUMN SIDEP.RH_PLAZA.PUESTO IS 'Codigo del puesto de trabajo de esta plaza';
COMMENT ON COLUMN SIDEP.RH_PLAZA.STATUS_PLAZA IS 'Status de la plaza (C)ancelado, (A)signado, (D)isponible';
COMMENT ON COLUMN SIDEP.RH_PLAZA.FECHA_PRESUPUESTADA IS 'Fecha en que fue presupuestada esta plaza.';
COMMENT ON COLUMN SIDEP.RH_PLAZA.FECHA_SUPRESION IS 'Fecha de la suprecion de la plaza';
COMMENT ON COLUMN SIDEP.RH_PLAZA.NUMERO_INDIVIDUAL IS 'Numero de Individual para impresion de nominas';
COMMENT ON COLUMN SIDEP.RH_PLAZA.PLAZAPERMANENTE IS 'Plaza definida de manera permanente';
COMMENT ON COLUMN SIDEP.RH_PLAZA.PLANILLA_LISTADO IS 'Indicador de cual es necesario que aparesca la plaza en caso de no tener ningun movimiento en el mes de la planilla/nomina';
COMMENT ON COLUMN SIDEP.RH_PLAZA.FIANZA IS 'Indicador de que la plaza debe pagar fianza';
COMMENT ON COLUMN SIDEP.RH_PLAZA.FEC_INGRESO_REGISTRO IS 'Fecha de registro de la plaza';
COMMENT ON COLUMN SIDEP.RH_PLAZA.USR_INGRESO_REGISTRO IS 'Usuario quien registro la plaza';
COMMENT ON COLUMN SIDEP.RH_PLAZA.FECHA_REGISTRO_SUPRESION IS 'Fecha de registro de la supresion';
COMMENT ON COLUMN SIDEP.RH_PLAZA.PLAZA_FUNCIONAL IS 'Plaza funcional';
COMMENT ON COLUMN SIDEP.RH_PLAZA.REFERENCIA IS 'Comentarios de creacion de la plaza';
/
--
-- TC_GENERICO  (Table) 
--
CREATE TABLE SIDEP.TC_GENERICO
(
  ID_GENERICO          NUMBER                   NOT NULL,
  GENERICO             VARCHAR2(100 BYTE)       NOT NULL,
  ID_ESTADO            NUMBER                   NOT NULL,
  ID_SOURCE            NUMBER                   NOT NULL,
  ID_USUARIO_REGISTRO  NUMBER                   NOT NULL,
  FECHA_CREACION       DATE                     NOT NULL,
  OBSERVACIONES        VARCHAR2(200 BYTE),
  ID_TRAZABILIDAD      NUMBER,
  IP                   VARCHAR2(23 BYTE)
)
/
--
-- FK_RH_PLAZA_PF  (Index) 
--
CREATE INDEX SIDEP.FK_RH_PLAZA_PF ON SIDEP.RH_PLAZA
(PLAZA_FUNCIONAL)
TABLESPACE USERS
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
           );

/
--
-- FK_RH_PLAZA_PL  (Index) 
--
CREATE INDEX SIDEP.FK_RH_PLAZA_PL ON SIDEP.RH_PLAZA
(PLANILLA_LISTADO)
TABLESPACE USERS
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
           );
/

--
-- IDX_NUMINDIVIDUAL  (Index) 
--
CREATE INDEX SIDEP.IDX_NUMINDIVIDUAL ON SIDEP.RH_PLAZA
(NUMERO_INDIVIDUAL)
TABLESPACE USERS
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
           );

/

--
-- PK_RH_DEPENDENCIA_GPS  (Index) 
--
CREATE UNIQUE INDEX SIDEP.PK_RH_DEPENDENCIA_GPS ON SIDEP.RH_DEPENDENCIA_GPS
(DEPENDENCIA)
TABLESPACE USERS
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
           );
/

--
-- PK_TC_GENERICO  (Index) 
--
CREATE UNIQUE INDEX SIDEP.PK_TC_GENERICO ON SIDEP.TC_GENERICO
(ID_GENERICO)
TABLESPACE USERS
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
           );

/

--
-- XIF117PLAZA  (Index) 
--
CREATE INDEX SIDEP.XIF117PLAZA ON SIDEP.RH_PLAZA
(PUESTO)
TABLESPACE USERS
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
           );
/


--
-- XIF200PLAZA  (Index) 
--
CREATE INDEX SIDEP.XIF200PLAZA ON SIDEP.RH_PLAZA
(PLAZA, DEPENDENCIA)
TABLESPACE USERS
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
           );

/

--
-- XIF20PLAZA  (Index) 
--
CREATE INDEX SIDEP.XIF20PLAZA ON SIDEP.RH_PLAZA
(DEPENDENCIA)
TABLESPACE USERS
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
           );
/



--
-- XPKPLAZA  (Index) 
--
CREATE UNIQUE INDEX SIDEP.XPKPLAZA ON SIDEP.RH_PLAZA
(DEPENDENCIA, PLAZA, FECHA_PRESUPUESTADA)
TABLESPACE USERS
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
           );
/
--
-- PKG_DEPENDENCIA_VALIDACIONES  (Package) 
--
CREATE OR REPLACE PACKAGE SIDEP."PKG_DEPENDENCIA_VALIDACIONES" AS
FUNCTION FUNC_VALIDA_COD_DEPENDENCIA(P_CODIGO_DEPENDENCIA NUMBER) RETURN NUMBER;
    FUNCTION FUNC_VALIDA_COD_PRESUPUESTARIO(P_CODIGO_DEPENDENCIA NUMBER) RETURN NUMBER;
    FUNCTION FUNC_VALIDA_SOLICITUD_CREACION(P_CODIGO_DEPENDENCIA NUMBER) RETURN NUMBER;
    FUNCTION FUNC_VALIDA_COD_DEP_SOLICITUD(P_CODIGO_DEPENDENCIA NUMBER) RETURN NUMBER;
END PKG_DEPENDENCIA_VALIDACIONES;
/

--
-- PKG_INSERTS  (Package) 
--
CREATE OR REPLACE PACKAGE SIDEP.PKG_INSERTS AS 
    
PROCEDURE proc_ins_tc_usuario (
        p_id_usuario       tc_usuario.id_usuario%TYPE,
        p_usuario          tc_usuario.usuario%TYPE,
        p_nombre           tc_usuario.nombre%TYPE,
        p_correo           tc_usuario.correo%TYPE,
        p_id_source        tc_usuario.id_source%TYPE,
        p_observaciones    tc_usuario.observaciones%TYPE,
        p_fecha_creacion   tc_usuario.fecha_creacion%TYPE,
        p_id_estado        tc_usuario.id_estado%TYPE,
        p_ip               tc_usuario.ip%TYPE
    );
/********************************SIDEP**********************************/
PROCEDURE PROC_INS_TT_TRAZABILIDAD(
    p_id_trazabilidad TT_TRAZABILIDAD.ID_TRAZABILIDAD%TYPE,
    p_id_objeto_trazable TT_TRAZABILIDAD.ID_OBJETO_TRAZABLE%TYPE,
    p_fecha_alta TT_TRAZABILIDAD.FECHA_ALTA%TYPE,
    p_fecha_baja TT_TRAZABILIDAD.FECHA_BAJA%TYPE);
    
PROCEDURE PROC_INS_TT_GEST_DEPENDENCIA (
   p_id_gestion_dependencia    TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
   p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
   p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
   p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
   p_nombre_gafete             TT_GEST_DEPENDENCIA.NOMBRE_GAFETE%TYPE,
   p_nombre_abreviado          TT_GEST_DEPENDENCIA.NOMBRE_ABREVIADO%TYPE,
   p_nombre_documento          TT_GEST_DEPENDENCIA.NOMBRE_DOCUMENTO%TYPE,
   p_conector                  TT_GEST_DEPENDENCIA.CONECTOR%TYPE,
   p_fecha_del_acuerdo         TT_GEST_DEPENDENCIA.FECHA_DEL_ACUERDO%TYPE,
   p_fecha_entra_vigencia      TT_GEST_DEPENDENCIA.FECHA_ENTRA_VIGENCIA%TYPE,
   p_fecha_anulacion           TT_GEST_DEPENDENCIA.FECHA_ANULACION%TYPE,
   p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
   p_funcion_unidad            TT_GEST_DEPENDENCIA.FUNCION_UNIDAD%TYPE,
   p_departamento              TT_GEST_DEPENDENCIA.DEPARTAMENTO%TYPE,
   p_municipio                 TT_GEST_DEPENDENCIA.MUNICIPIO%TYPE,
   p_tipo_area                 TT_GEST_DEPENDENCIA.TIPO_AREA%TYPE,
   p_acuerdo_digital           TT_GEST_DEPENDENCIA.ACUERDO_DIGITAL%TYPE,
   p_id_tipo_gestion           TT_GEST_DEPENDENCIA.ID_TIPO_GESTION%TYPE,
   p_id_estado                 TT_GEST_DEPENDENCIA.ID_ESTADO%TYPE,
   p_id_source                 TT_GEST_DEPENDENCIA.ID_SOURCE%TYPE,
   p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
   p_id_estado_proceso         TT_GEST_DEPENDENCIA.ID_ESTADO_PROCESO%TYPE,
   p_id_trazabilidad           TT_GEST_DEPENDENCIA.ID_TRAZABILIDAD%TYPE,
   p_observaciones             TT_GEST_DEPENDENCIA.OBSERVACIONES%TYPE,
   p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
   p_fecha_registro            TT_GEST_DEPENDENCIA.FECHA_REGISTRO%TYPE,
   p_fecha_publicacion         TT_GEST_DEPENDENCIA.FECHA_PUBLICACION%TYPE,
   P_obs_fecha_vigencia        TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE);
   
PROCEDURE proc_ins_rh_dependencia (
    p_dependencia                    rh_dependencia.dependencia%TYPE,
    p_id_direccion                   rh_dependencia.id_direccion%TYPE,
    p_nombre_dependencia             rh_dependencia.nombre_dependencia%TYPE,
    p_nombre_gafete                  rh_dependencia.nombre_gafete%TYPE,
    p_nombre_abreviado               rh_dependencia.nombre_abreviado%TYPE,
    p_clasificacion_dependencia      rh_dependencia.clasificacion_dependencia%TYPE,
    p_dependencia_padre              rh_dependencia.dependencia_padre%TYPE,
    p_materia                        rh_dependencia.materia%TYPE,
    p_dependencia_vigente            rh_dependencia.dependencia_vigente%TYPE,
    p_fecha_creacion_dependencia     rh_dependencia.fecha_creacion_dependencia%TYPE,
    p_fecha_anulacion_dependencia    rh_dependencia.fecha_anulacion_dependencia%TYPE,
    p_telefonos                      rh_dependencia.telefonos%TYPE,
    p_conector_dependencia           rh_dependencia.conector_dependencia%TYPE,
    p_nombre_dependencia_documento   rh_dependencia.nombre_dependencia_documento%TYPE,
    p_unidad_presupuestaria          rh_dependencia.unidad_presupuestaria%TYPE,
    p_funcion_unidad                 rh_dependencia.funcion_unidad%TYPE,
    p_codigo_presupuestario          rh_dependencia.codigo_presupuestario%TYPE,
    p_referencia                     rh_dependencia.referencia%TYPE,
    p_usuario_creador                rh_dependencia.usuario_creador%TYPE,
    p_fecha_modificacion             rh_dependencia.fecha_modificacion%TYPE,
    p_usuario_modifico               rh_dependencia.usuario_modifico%TYPE,
    p_id_camara                      rh_dependencia.id_camara%TYPE,
    p_id_competencia                 rh_dependencia.id_competencia%TYPE,
    p_id_especialidad                rh_dependencia.id_especialidad%TYPE,
    p_id_area                        rh_dependencia.id_area%TYPE,
    p_nombre_dependencia_uci         rh_dependencia.nombre_dependencia_uci%TYPE,
    p_id_igss                        rh_dependencia.id_igss%TYPE,
    p_acuerdo_digital                rh_dependencia.acuerdo_digital%TYPE,
    p_fecha_entra_vigencia           rh_dependencia.fecha_entra_vigencia%TYPE,
    p_fecha_publicacion              rh_dependencia.fecha_publicacion%type,
    p_obs_fecha_vigencia             rh_dependencia.obs_fecha_vigencia%type
);
   
PROCEDURE PROC_INS_RH_DIRECCION_DEPENDEN (
    p_id_direccion              RH_DIRECCION_DEPENDENCIA.ID_DIRECCION%TYPE,
    p_pais                      RH_DIRECCION_DEPENDENCIA.PAIS%TYPE,
    p_departamento              RH_DIRECCION_DEPENDENCIA.DEPARTAMENTO%TYPE,
    p_municipio                 RH_DIRECCION_DEPENDENCIA.MUNICIPIO%TYPE,
    p_avenida_calle             RH_DIRECCION_DEPENDENCIA.AVENIDA_CALLE%TYPE,
    p_apartamento_casa          RH_DIRECCION_DEPENDENCIA.APARTAMENTO_CASA%TYPE,
    p_zona                      RH_DIRECCION_DEPENDENCIA.ZONA%TYPE,
    p_barrio_colonia_caserio    RH_DIRECCION_DEPENDENCIA.BARRIO_COLONIA_CASERIO%TYPE,
    p_edificio                  RH_DIRECCION_DEPENDENCIA.EDIFICIO%TYPE,
    p_direccion_simple          RH_DIRECCION_DEPENDENCIA.DIRECCION_SIMPLE%TYPE);  

PROCEDURE proc_ins_tt_dependencia_correo (
    p_id_dependencia_correo   tt_dependencia_correo.id_dependencia_correo%TYPE,
    p_dependencia             tt_dependencia_correo.dependencia%TYPE,
    p_correo_electronico      tt_dependencia_correo.correo_electronico%TYPE,
    p_id_estado               tt_dependencia_correo.id_estado%TYPE,
    p_id_source               tt_dependencia_correo.id_source%TYPE,
    p_id_usuario_registro     tt_dependencia_correo.id_usuario_registro%TYPE,
    p_fecha_registro          tt_dependencia_correo.fecha_registro%TYPE,
    p_observaciones           tt_dependencia_correo.observaciones%TYPE,
    p_id_trazabilidad         tt_dependencia_correo.id_trazabilidad%TYPE,
    p_ip                      tt_dependencia_correo.ip%TYPE);   
PROCEDURE proc_ins_tt_dependencia_rh_cid (
        p_id_dep_rh_cidej       tt_dependencia_rh_cidej.id_dep_rh_cidej%TYPE,
        p_dependencia           tt_dependencia_rh_cidej.dependencia%TYPE,
        p_id_despacho           tt_dependencia_rh_cidej.id_despacho%TYPE,
        p_id_estado             tt_dependencia_rh_cidej.id_estado%TYPE,
        p_id_source             tt_dependencia_rh_cidej.id_source%TYPE,
        p_id_usuario_registro   tt_dependencia_rh_cidej.id_usuario_registro%TYPE,
        p_fecha_registro        tt_dependencia_rh_cidej.fecha_registro%TYPE,
        p_observaciones         tt_dependencia_rh_cidej.observaciones%TYPE,
        p_id_trazabilidad       tt_dependencia_rh_cidej.id_trazabilidad%TYPE,
        p_ip                    tt_dependencia_rh_cidej.ip%TYPE);   
PROCEDURE PROC_INS_RH_DEPENDENCIA_GPS (
   p_dependencia          RH_DEPENDENCIA_GPS.DEPENDENCIA%TYPE,
   p_longitud             RH_DEPENDENCIA_GPS.LONGITUD%TYPE,
   p_crea_fecha           RH_DEPENDENCIA_GPS.CREA_FECHA%TYPE,
   p_crea_empleado        RH_DEPENDENCIA_GPS.CREA_EMPLEADO%TYPE,
   p_baja_fecha           RH_DEPENDENCIA_GPS.BAJA_FECHA%TYPE,
   p_baja_empleado        RH_DEPENDENCIA_GPS.BAJA_EMPLEADO%TYPE,
   p_estado               RH_DEPENDENCIA_GPS.ESTADO%TYPE,
   p_codigo_sgt           RH_DEPENDENCIA_GPS.CODIGO_SGT%TYPE,
   p_direccion_simple     RH_DEPENDENCIA_GPS.DIRECCION_SIMPLE%TYPE,
   p_telefono             RH_DEPENDENCIA_GPS.TELEFONO%TYPE,
   p_icono_id             RH_DEPENDENCIA_GPS.ICONO_ID%TYPE,
   p_materia_id           RH_DEPENDENCIA_GPS.MATERIA_ID%TYPE,
   p_codigo_ine           RH_DEPENDENCIA_GPS.CODIGO_INE%TYPE,
   p_iso3166_2            RH_DEPENDENCIA_GPS.ISO3166_2%TYPE,
   p_iso3166_3            RH_DEPENDENCIA_GPS.ISO3166_3%TYPE,
   p_latitud              RH_DEPENDENCIA_GPS.LATITUD%TYPE,
   p_telefono_completo    RH_DEPENDENCIA_GPS.TELEFONO_COMPLETO%TYPE); 


END PKG_INSERTS;
/
--
-- PKG_UTILS  (Package) 
--
CREATE OR REPLACE PACKAGE SIDEP."PKG_UTILS" AS 
/******************************************************************************
   NAME:       PKG_UTILS
   PURPOSE:    Paquete de utilitarios

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        21/02/2018      Brevolorio       1. Created this package.
******************************************************************************/


/******************************************************************************
   NAME:       PROC_GET_CONSTANTES
   PURPOSE:    Retorna las constantes como cursor para ser usaro en el frontend

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        21/02/2018      Brevolorio       1. Created this package.
******************************************************************************/
PROCEDURE PROC_GET_CONSTANTES(p_cur_dataset OUT SYS_REFCURSOR);


/******************************************************************************
   NAME:        PROC_INS_USUARIO                             
   PURPOSE:   Inserta un usuario, si no existe en la tabla TC_USUARIO
   se llama cada vez que se hace login

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        21/02/2018      Brevolorio       1. Created this package.
******************************************************************************/
PROCEDURE PROC_INS_USUARIO(
                              p_id_usuario TC_USUARIO.ID_USUARIO%TYPE,
                              p_usuario TC_USUARIO.USUARIO%TYPE,
                              p_correo TC_USUARIO.CORREO%TYPE,
                              p_nombre TC_USUARIO.NOMBRE%TYPE,
                              p_ip TC_USUARIO.IP%TYPE,
                              p_id_salida OUT NUMBER,
                              p_msj OUT VARCHAR2);

END PKG_UTILS;
/

--
-- PKG_DEPENDENCIA_VALIDACIONES  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY SIDEP.PKG_DEPENDENCIA_VALIDACIONES AS

FUNCTION FUNC_VALIDA_COD_DEPENDENCIA(
        P_CODIGO_DEPENDENCIA NUMBER) RETURN NUMBER IS
        P_VALIDA NUMBER := 0;
    BEGIN
            SELECT COUNT(*) INTO P_VALIDA FROM SIDEP.RH_DEPENDENCIA WHERE DEPENDENCIA = P_CODIGO_DEPENDENCIA;
        RETURN P_VALIDA;
    END FUNC_VALIDA_COD_DEPENDENCIA;
    
    
    FUNCTION FUNC_VALIDA_COD_PRESUPUESTARIO(
        P_CODIGO_DEPENDENCIA NUMBER) RETURN NUMBER IS
        P_VALIDA NUMBER := 0;
    BEGIN
            SELECT COUNT(*) INTO P_VALIDA FROM SIDEP.RH_DEPENDENCIA WHERE CODIGO_PRESUPUESTARIO = P_CODIGO_DEPENDENCIA;
        RETURN P_VALIDA;
    END FUNC_VALIDA_COD_PRESUPUESTARIO;
    
    FUNCTION FUNC_VALIDA_COD_DEP_SOLICITUD(
        P_CODIGO_DEPENDENCIA NUMBER) RETURN NUMBER IS
         P_VALIDA NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO P_VALIDA FROM SIDEP.TT_GEST_DEPENDENCIA WHERE CODIGO_DEPENDENCIA = P_CODIGO_DEPENDENCIA;
        RETURN P_VALIDA;
    END FUNC_VALIDA_COD_DEP_SOLICITUD;
    
    FUNCTION FUNC_VALIDA_SOLICITUD_CREACION(
        P_CODIGO_DEPENDENCIA NUMBER) RETURN NUMBER IS
        P_VALIDA NUMBER := 0;
        BEGIN
            SELECT COUNT(*) INTO P_VALIDA FROM SIDEP.TT_GEST_DEPENDENCIA WHERE CODIGO_DEPENDENCIA = P_CODIGO_DEPENDENCIA AND ID_ESTADO = 1;
        RETURN P_VALIDA;
    END FUNC_VALIDA_SOLICITUD_CREACION;  
    
END PKG_DEPENDENCIA_VALIDACIONES;
/
--
-- PKG_INSERTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY SIDEP.PKG_INSERTS AS
    
    PROCEDURE proc_ins_tc_usuario (
        p_id_usuario       tc_usuario.id_usuario%TYPE,
        p_usuario          tc_usuario.usuario%TYPE,
        p_nombre           tc_usuario.nombre%TYPE,
        p_correo           tc_usuario.correo%TYPE,
        p_id_source        tc_usuario.id_source%TYPE,
        p_observaciones    tc_usuario.observaciones%TYPE,
        p_fecha_creacion   tc_usuario.fecha_creacion%TYPE,
        p_id_estado        tc_usuario.id_estado%TYPE,
        p_ip               tc_usuario.ip%TYPE
    )
        IS
   /*  PROCESO CREADO PARA INSERT EN LA TABLA= CIT_BASE.TC_USUARIO
       CREADO POR EL USUARIO= BREVOLORIO
       FECHA DE CREACION= 26/03/2018 11:55:51
       FECHA ULTIMA MODIFICACION= 
  */
    BEGIN
        INSERT INTO tc_usuario (
            id_usuario,
            usuario,
            nombre,
            correo,
            id_source,
            observaciones,
            fecha_creacion,
            id_estado,
            ip
        ) VALUES (
            p_id_usuario,
            p_usuario,
            p_nombre,
            p_correo,
            p_id_source,
            p_observaciones,
            p_fecha_creacion,
            p_id_estado,
            p_ip
        );

    END proc_ins_tc_usuario;   --fin de procedure PROC_INS_TC_USUARIO   4
    
    /********************************SIDEP**********************************/
PROCEDURE PROC_INS_TT_TRAZABILIDAD(
    p_id_trazabilidad TT_TRAZABILIDAD.ID_TRAZABILIDAD%TYPE,
    p_id_objeto_trazable TT_TRAZABILIDAD.ID_OBJETO_TRAZABLE%TYPE,
    p_fecha_alta TT_TRAZABILIDAD.FECHA_ALTA%TYPE,
    p_fecha_baja TT_TRAZABILIDAD.FECHA_BAJA%TYPE)
IS
  /*  PROCESO CREADO PARA INSERT EN LA TABLA= CIT_BASE.TT_TRAZABILIDAD
  CREADO POR EL USUARIO= BREVOLORIO
  FECHA DE CREACION= 21/02/2018 09:17:13
  FECHA ULTIMA MODIFICACION=
  */
BEGIN
  INSERT
  INTO TT_TRAZABILIDAD
    (
      ID_TRAZABILIDAD,
      ID_OBJETO_TRAZABLE,
      FECHA_ALTA,
      FECHA_BAJA
    )
    VALUES
    (
      p_id_trazabilidad,
      p_id_objeto_trazable,
      p_fecha_alta,
      p_fecha_baja
    );
END PROC_INS_TT_TRAZABILIDAD; --fin de procedure PROC_INS_TT_TRAZABILIDAD

/* Formatted on 21/09/2020 13:30:57 (QP5 v5.256.13226.35538) */
PROCEDURE PROC_INS_TT_GEST_DEPENDENCIA (
    p_id_gestion_dependencia    TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
    p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
    p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
    p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
    p_nombre_gafete             TT_GEST_DEPENDENCIA.NOMBRE_GAFETE%TYPE,
    p_nombre_abreviado          TT_GEST_DEPENDENCIA.NOMBRE_ABREVIADO%TYPE,
    p_nombre_documento          TT_GEST_DEPENDENCIA.NOMBRE_DOCUMENTO%TYPE,
    p_conector                  TT_GEST_DEPENDENCIA.CONECTOR%TYPE,
    p_fecha_del_acuerdo         TT_GEST_DEPENDENCIA.FECHA_DEL_ACUERDO%TYPE,
    p_fecha_entra_vigencia      TT_GEST_DEPENDENCIA.FECHA_ENTRA_VIGENCIA%TYPE,
    p_fecha_anulacion           TT_GEST_DEPENDENCIA.FECHA_ANULACION%TYPE,
    p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
    p_funcion_unidad            TT_GEST_DEPENDENCIA.FUNCION_UNIDAD%TYPE,
    p_departamento              TT_GEST_DEPENDENCIA.DEPARTAMENTO%TYPE,
    p_municipio                 TT_GEST_DEPENDENCIA.MUNICIPIO%TYPE,
    p_tipo_area                 TT_GEST_DEPENDENCIA.TIPO_AREA%TYPE,
    p_acuerdo_digital           TT_GEST_DEPENDENCIA.ACUERDO_DIGITAL%TYPE,
    p_id_tipo_gestion           TT_GEST_DEPENDENCIA.ID_TIPO_GESTION%TYPE,
    p_id_estado                 TT_GEST_DEPENDENCIA.ID_ESTADO%TYPE,
    p_id_source                 TT_GEST_DEPENDENCIA.ID_SOURCE%TYPE,
    p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
    p_id_estado_proceso         TT_GEST_DEPENDENCIA.ID_ESTADO_PROCESO%TYPE,
    p_id_trazabilidad           TT_GEST_DEPENDENCIA.ID_TRAZABILIDAD%TYPE,
    p_observaciones             TT_GEST_DEPENDENCIA.OBSERVACIONES%TYPE,
    p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
    p_fecha_registro            TT_GEST_DEPENDENCIA.FECHA_REGISTRO%TYPE,
    p_fecha_publicacion         TT_GEST_DEPENDENCIA.FECHA_PUBLICACION%TYPE,
    P_obs_fecha_vigencia        TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE
   )
IS
 /*  PROCESO CREADO PARA INSERT EN LA TABLA= RRHH.TT_GEST_DEPENDENCIA
     CREADO POR EL USUARIO= RRHH
     FECHA DE CREACION= 21/09/2020 13:30:26
     FECHA ULTIMA MODIFICACION=
*/
BEGIN
   INSERT INTO TT_GEST_DEPENDENCIA (ID_GESTION_DEPENDENCIA,
                                    CODIGO_DEPENDENCIA,
                                    CODIGO_PRESUPUESTARIO,
                                    NOMBRE_DEPENDENCIA,
                                    NOMBRE_GAFETE,
                                    NOMBRE_ABREVIADO,
                                    NOMBRE_DOCUMENTO,
                                    CONECTOR,
                                    FECHA_DEL_ACUERDO,
                                    FECHA_ENTRA_VIGENCIA,
                                    FECHA_ANULACION,
                                    REFERENCIA,
                                    FUNCION_UNIDAD,
                                    DEPARTAMENTO,
                                    MUNICIPIO,
                                    TIPO_AREA,
                                    ACUERDO_DIGITAL,
                                    ID_TIPO_GESTION,
                                    ID_ESTADO,
                                    ID_SOURCE,
                                    IP,
                                    ID_ESTADO_PROCESO,
                                    ID_TRAZABILIDAD,
                                    OBSERVACIONES,
                                    ID_USUARIO_REGISTRO,
                                    FECHA_REGISTRO,
                                    FECHA_PUBLICACION,
                                    OBS_FECHA_VIGENCIA)
        VALUES (p_id_gestion_dependencia,
                p_codigo_dependencia,
                p_codigo_presupuestario,
                p_nombre_dependencia,
                p_nombre_gafete,
                p_nombre_abreviado,
                p_nombre_documento,
                p_conector,
                p_fecha_del_acuerdo,
                p_fecha_entra_vigencia,
                p_fecha_anulacion,
                p_referencia,
                p_funcion_unidad,
                p_departamento,
                p_municipio,
                p_tipo_area,
                p_acuerdo_digital,
                p_id_tipo_gestion,
                p_id_estado,
                p_id_source,
                p_ip,
                p_id_estado_proceso,
                p_id_trazabilidad,
                p_observaciones,
                p_id_usuario_registro,
                p_fecha_registro,
                p_fecha_publicacion,
                p_obs_fecha_vigencia);
END PROC_INS_TT_GEST_DEPENDENCIA; --fin de procedure PROC_INS_TT_GEST_DEPENDENCIA

PROCEDURE proc_ins_rh_dependencia (
    p_dependencia                    rh_dependencia.dependencia%TYPE,
    p_id_direccion                   rh_dependencia.id_direccion%TYPE,
    p_nombre_dependencia             rh_dependencia.nombre_dependencia%TYPE,
    p_nombre_gafete                  rh_dependencia.nombre_gafete%TYPE,
    p_nombre_abreviado               rh_dependencia.nombre_abreviado%TYPE,
    p_clasificacion_dependencia      rh_dependencia.clasificacion_dependencia%TYPE,
    p_dependencia_padre              rh_dependencia.dependencia_padre%TYPE,
    p_materia                        rh_dependencia.materia%TYPE,
    p_dependencia_vigente            rh_dependencia.dependencia_vigente%TYPE,
    p_fecha_creacion_dependencia     rh_dependencia.fecha_creacion_dependencia%TYPE,
    p_fecha_anulacion_dependencia    rh_dependencia.fecha_anulacion_dependencia%TYPE,
    p_telefonos                      rh_dependencia.telefonos%TYPE,
    p_conector_dependencia           rh_dependencia.conector_dependencia%TYPE,
    p_nombre_dependencia_documento   rh_dependencia.nombre_dependencia_documento%TYPE,
    p_unidad_presupuestaria          rh_dependencia.unidad_presupuestaria%TYPE,
    p_funcion_unidad                 rh_dependencia.funcion_unidad%TYPE,
    p_codigo_presupuestario          rh_dependencia.codigo_presupuestario%TYPE,
    p_referencia                     rh_dependencia.referencia%TYPE,
    p_usuario_creador                rh_dependencia.usuario_creador%TYPE,
    p_fecha_modificacion             rh_dependencia.fecha_modificacion%TYPE,
    p_usuario_modifico               rh_dependencia.usuario_modifico%TYPE,
    p_id_camara                      rh_dependencia.id_camara%TYPE,
    p_id_competencia                 rh_dependencia.id_competencia%TYPE,
    p_id_especialidad                rh_dependencia.id_especialidad%TYPE,
    p_id_area                        rh_dependencia.id_area%TYPE,
    p_nombre_dependencia_uci         rh_dependencia.nombre_dependencia_uci%TYPE,
    p_id_igss                        rh_dependencia.id_igss%TYPE,
    p_acuerdo_digital                rh_dependencia.acuerdo_digital%TYPE,
    p_fecha_entra_vigencia           rh_dependencia.fecha_entra_vigencia%TYPE,
    p_fecha_publicacion              rh_dependencia.fecha_publicacion%type,
    p_obs_fecha_vigencia             rh_dependencia.obs_fecha_vigencia%type
) IS
/*  PROCESO CREADO PARA INSERT EN LA TABLA= RRHH.RH_DEPENDENCIA
   CREADO POR EL USUARIO= RRHH
   FECHA DE CREACION= 22/10/2020 11:53:34
   FECHA ULTIMA MODIFICACION= 
*/
BEGIN
    INSERT INTO rh_dependencia (
        dependencia,
        id_direccion,
        nombre_dependencia,
        nombre_gafete,
        nombre_abreviado,
        clasificacion_dependencia,
        dependencia_padre,
        materia,
        dependencia_vigente,
        fecha_creacion_dependencia,
        fecha_anulacion_dependencia,
        telefonos,
        conector_dependencia,
        nombre_dependencia_documento,
        unidad_presupuestaria,
        funcion_unidad,
        codigo_presupuestario,
        referencia,
        usuario_creador,
        fecha_modificacion,
        usuario_modifico,
        id_camara,
        id_competencia,
        id_especialidad,
        id_area,
        nombre_dependencia_uci,
        id_igss,
        acuerdo_digital,
        fecha_entra_vigencia,
        fecha_publicacion,
        obs_fecha_vigencia
    ) VALUES (
        p_dependencia,
        p_id_direccion,
        p_nombre_dependencia,
        p_nombre_gafete,
        p_nombre_abreviado,
        p_clasificacion_dependencia,
        p_dependencia_padre,
        p_materia,
        p_dependencia_vigente,
        p_fecha_creacion_dependencia,
        p_fecha_anulacion_dependencia,
        p_telefonos,
        p_conector_dependencia,
        p_nombre_dependencia_documento,
        p_unidad_presupuestaria,
        p_funcion_unidad,
        p_codigo_presupuestario,
        p_referencia,
        p_usuario_creador,
        p_fecha_modificacion,
        p_usuario_modifico,
        p_id_camara,
        p_id_competencia,
        p_id_especialidad,
        p_id_area,
        p_nombre_dependencia_uci,
        p_id_igss,
        p_acuerdo_digital,
        p_fecha_entra_vigencia,
        p_fecha_publicacion,
        p_obs_fecha_vigencia
    );

END proc_ins_rh_dependencia;   --fin de procedure PROC_INS_RH_DEPENDENCIA

/* Formatted on 2/10/2020 10:54:14 (QP5 v5.256.13226.35538) */
PROCEDURE PROC_INS_RH_DIRECCION_DEPENDEN (
   p_id_direccion              RH_DIRECCION_DEPENDENCIA.ID_DIRECCION%TYPE,
   p_pais                      RH_DIRECCION_DEPENDENCIA.PAIS%TYPE,
   p_departamento              RH_DIRECCION_DEPENDENCIA.DEPARTAMENTO%TYPE,
   p_municipio                 RH_DIRECCION_DEPENDENCIA.MUNICIPIO%TYPE,
   p_avenida_calle             RH_DIRECCION_DEPENDENCIA.AVENIDA_CALLE%TYPE,
   p_apartamento_casa          RH_DIRECCION_DEPENDENCIA.APARTAMENTO_CASA%TYPE,
   p_zona                      RH_DIRECCION_DEPENDENCIA.ZONA%TYPE,
   p_barrio_colonia_caserio    RH_DIRECCION_DEPENDENCIA.BARRIO_COLONIA_CASERIO%TYPE,
   p_edificio                  RH_DIRECCION_DEPENDENCIA.EDIFICIO%TYPE,
   p_direccion_simple          RH_DIRECCION_DEPENDENCIA.DIRECCION_SIMPLE%TYPE)
IS
 /*  PROCESO CREADO PARA INSERT EN LA TABLA= RRHH.RH_DIRECCION_DEPENDENCIA
     CREADO POR EL USUARIO= RRHH
     FECHA DE CREACION= 02/10/2020 10:53:45
     FECHA ULTIMA MODIFICACION=
*/
BEGIN
   INSERT INTO RH_DIRECCION_DEPENDENCIA (ID_DIRECCION,
                                         PAIS,
                                         DEPARTAMENTO,
                                         MUNICIPIO,
                                         AVENIDA_CALLE,
                                         APARTAMENTO_CASA,
                                         ZONA,
                                         BARRIO_COLONIA_CASERIO,
                                         EDIFICIO,
                                         DIRECCION_SIMPLE)
        VALUES (p_id_direccion,
                p_pais,
                p_departamento,
                p_municipio,
                p_avenida_calle,
                p_apartamento_casa,
                p_zona,
                p_barrio_colonia_caserio,
                p_edificio,
                p_direccion_simple);
END PROC_INS_RH_DIRECCION_DEPENDEN; --fin de procedure PROC_INS_RH_DIRECCION_DEPENDEN

PROCEDURE proc_ins_tt_dependencia_correo (
    p_id_dependencia_correo   tt_dependencia_correo.id_dependencia_correo%TYPE,
    p_dependencia             tt_dependencia_correo.dependencia%TYPE,
    p_correo_electronico      tt_dependencia_correo.correo_electronico%TYPE,
    p_id_estado               tt_dependencia_correo.id_estado%TYPE,
    p_id_source               tt_dependencia_correo.id_source%TYPE,
    p_id_usuario_registro     tt_dependencia_correo.id_usuario_registro%TYPE,
    p_fecha_registro          tt_dependencia_correo.fecha_registro%TYPE,
    p_observaciones           tt_dependencia_correo.observaciones%TYPE,
    p_id_trazabilidad         tt_dependencia_correo.id_trazabilidad%TYPE,
    p_ip                      tt_dependencia_correo.ip%TYPE
) IS
   /*  PROCESO CREADO PARA INSERT EN LA TABLA= RRHH.TT_DEPENDENCIA_CORREO
       CREADO POR EL USUARIO= RRHH
       FECHA DE CREACION= 16/10/2020 13:36:28
       FECHA ULTIMA MODIFICACION= 
  */
    BEGIN
        INSERT INTO tt_dependencia_correo (
            id_dependencia_correo,
            dependencia,
            correo_electronico,
            id_estado,
            id_source,
            id_usuario_registro,
            fecha_registro,
            observaciones,
            id_trazabilidad,
            ip
        ) VALUES (
            p_id_dependencia_correo,
            p_dependencia,
            p_correo_electronico,
            p_id_estado,
            p_id_source,
            p_id_usuario_registro,
            p_fecha_registro,
            p_observaciones,
            p_id_trazabilidad,
            p_ip
        );

    END proc_ins_tt_dependencia_correo;   --fin de procedure PROC_INS_TT_DEPENDENCIA_CORREO
    
PROCEDURE proc_ins_tt_dependencia_rh_cid (
    p_id_dep_rh_cidej       tt_dependencia_rh_cidej.id_dep_rh_cidej%TYPE,
    p_dependencia           tt_dependencia_rh_cidej.dependencia%TYPE,
    p_id_despacho           tt_dependencia_rh_cidej.id_despacho%TYPE,
    p_id_estado             tt_dependencia_rh_cidej.id_estado%TYPE,
    p_id_source             tt_dependencia_rh_cidej.id_source%TYPE,
    p_id_usuario_registro   tt_dependencia_rh_cidej.id_usuario_registro%TYPE,
    p_fecha_registro        tt_dependencia_rh_cidej.fecha_registro%TYPE,
    p_observaciones         tt_dependencia_rh_cidej.observaciones%TYPE,
    p_id_trazabilidad       tt_dependencia_rh_cidej.id_trazabilidad%TYPE,
    p_ip                    tt_dependencia_rh_cidej.ip%TYPE
) IS
/*  PROCESO CREADO PARA INSERT EN LA TABLA= RRHH.TT_DEPENDENCIA_RH_CIDEJ
   CREADO POR EL USUARIO= RRHH
   FECHA DE CREACION= 28/10/2020 14:50:27
   FECHA ULTIMA MODIFICACION= 
*/
BEGIN
    INSERT INTO tt_dependencia_rh_cidej (
        id_dep_rh_cidej,
        dependencia,
        id_despacho,
        id_estado,
        id_source,
        id_usuario_registro,
        fecha_registro,
        observaciones,
        id_trazabilidad,
        ip
    ) VALUES (
        p_id_dep_rh_cidej,
        p_dependencia,
        p_id_despacho,
        p_id_estado,
        p_id_source,
        p_id_usuario_registro,
        p_fecha_registro,
        p_observaciones,
        p_id_trazabilidad,
        p_ip
    );

END proc_ins_tt_dependencia_rh_cid;   --fin de procedure PROC_INS_TT_DEPENDENCIA_RH_CID
    
PROCEDURE PROC_INS_RH_DEPENDENCIA_GPS (
   p_dependencia          RH_DEPENDENCIA_GPS.DEPENDENCIA%TYPE,
   p_longitud             RH_DEPENDENCIA_GPS.LONGITUD%TYPE,
   p_crea_fecha           RH_DEPENDENCIA_GPS.CREA_FECHA%TYPE,
   p_crea_empleado        RH_DEPENDENCIA_GPS.CREA_EMPLEADO%TYPE,
   p_baja_fecha           RH_DEPENDENCIA_GPS.BAJA_FECHA%TYPE,
   p_baja_empleado        RH_DEPENDENCIA_GPS.BAJA_EMPLEADO%TYPE,
   p_estado               RH_DEPENDENCIA_GPS.ESTADO%TYPE,
   p_codigo_sgt           RH_DEPENDENCIA_GPS.CODIGO_SGT%TYPE,
   p_direccion_simple     RH_DEPENDENCIA_GPS.DIRECCION_SIMPLE%TYPE,
   p_telefono             RH_DEPENDENCIA_GPS.TELEFONO%TYPE,
   p_icono_id             RH_DEPENDENCIA_GPS.ICONO_ID%TYPE,
   p_materia_id           RH_DEPENDENCIA_GPS.MATERIA_ID%TYPE,
   p_codigo_ine           RH_DEPENDENCIA_GPS.CODIGO_INE%TYPE,
   p_iso3166_2            RH_DEPENDENCIA_GPS.ISO3166_2%TYPE,
   p_iso3166_3            RH_DEPENDENCIA_GPS.ISO3166_3%TYPE,
   p_latitud              RH_DEPENDENCIA_GPS.LATITUD%TYPE,
   p_telefono_completo    RH_DEPENDENCIA_GPS.TELEFONO_COMPLETO%TYPE)
IS
 /*  PROCESO CREADO PARA INSERT EN LA TABLA= RRHH.RH_DEPENDENCIA_GPS
     CREADO POR EL USUARIO= RRHH
     FECHA DE CREACION= 29/10/2020 09:17:02
     FECHA ULTIMA MODIFICACION=
*/
BEGIN
   INSERT INTO RH_DEPENDENCIA_GPS (DEPENDENCIA,
                                   LONGITUD,
                                   CREA_FECHA,
                                   CREA_EMPLEADO,
                                   BAJA_FECHA,
                                   BAJA_EMPLEADO,
                                   ESTADO,
                                   CODIGO_SGT,
                                   DIRECCION_SIMPLE,
                                   TELEFONO,
                                   ICONO_ID,
                                   MATERIA_ID,
                                   CODIGO_INE,
                                   ISO3166_2,
                                   ISO3166_3,
                                   LATITUD,
                                   TELEFONO_COMPLETO)
        VALUES (p_dependencia,
                p_longitud,
                p_crea_fecha,
                p_crea_empleado,
                p_baja_fecha,
                p_baja_empleado,
                p_estado,
                p_codigo_sgt,
                p_direccion_simple,
                p_telefono,
                p_icono_id,
                p_materia_id,
                p_codigo_ine,
                p_iso3166_2,
                p_iso3166_3,
                p_latitud,
                p_telefono_completo);
END PROC_INS_RH_DEPENDENCIA_GPS;

END PKG_INSERTS;
/
--
-- PKG_UTILS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY SIDEP.PKG_UTILS AS

 
PROCEDURE PROC_GET_CONSTANTES(p_cur_dataset OUT SYS_REFCURSOR)
AS
v_query varchar2(32767);
BEGIN
v_query:='SELECT '|| '''OAUTH''' ||' CTE,'|| '''OAUTH''' || ' VAL FROM DUAL
          ';
FOR ITEM IN (
                 select procedure_name CTE
                 from all_procedures
                 where owner = PKG_CONSTANTES.NOMBRE_ESQUEMA
                 and object_name = 'PKG_CONSTANTES'
            )  
LOOP 
  if(ITEM.CTE is not null) THEN
    v_query:=v_query|| ' UNION SELECT ''' || ITEM.CTE || ''' CTE, TO_CHAR(PKG_CONSTANTES.' || ITEM.CTE || ') VAL FROM DUAL
    ';
  END IF;
END LOOP;
v_query:=v_query;

OPEN p_cur_dataset FOR 
v_query;
END PROC_GET_CONSTANTES;

PROCEDURE PROC_INS_USUARIO(
                              p_id_usuario TC_USUARIO.ID_USUARIO%TYPE,
                              p_usuario TC_USUARIO.USUARIO%TYPE,
                              p_correo TC_USUARIO.CORREO%TYPE,
                              p_nombre TC_USUARIO.NOMBRE%TYPE,
                              p_ip TC_USUARIO.IP%TYPE,
                              p_id_salida OUT NUMBER,
                              p_msj OUT VARCHAR2)
AS
BEGIN

SELECT
    id_usuario
INTO
    p_id_salida
FROM
    tc_usuario
WHERE
    TRIM(lower(usuario) ) LIKE TRIM(lower(p_usuario) )
    AND   p_id_usuario = id_usuario;

p_msj:='Bienvenido al CitBase';
EXCEPTION
WHEN no_data_found THEN
  PKG_INSERTS.PROC_INS_TC_USUARIO( 
                              p_id_usuario =>p_id_usuario,
                              p_usuario=>p_usuario,
                              p_nombre =>p_nombre,
                              p_correo =>p_correo,
                              p_id_source =>PKG_CONSTANTES.SOURCE_APP,
                              p_observaciones =>null,
                              p_fecha_creacion =>sysdate,
                              p_id_estado =>PKG_CONSTANTES.ESTADO_ACTIVO,
                              p_ip=>p_ip
                            );
  p_id_salida:=p_id_usuario;
  p_msj:='Registrado en CitBase';
WHEN others THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
              p_id_salida := -1;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
              p_msj     := '@error en insercion de Usuario@'                                                                                                                                                                                                                                                                                                                                                                                                                                                         
                          ||' -CODE-'||SQLCODE                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                          || ' -ERROR- '||SQLERRM                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
                          || '-ERROR_STACK-'|| DBMS_UTILITY.FORMAT_ERROR_STACK                                                                                                                                                                                                                                                                                                                                                                                                                                      
                          || '-ERROR_BACKTRACE-' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE                                                                                                                                                                                                                                                                                                                                                                                                                             
                          ; 
END PROC_INS_USUARIO;

END PKG_UTILS;
/

--
-- FUNC_TRAZABILIDAD  (Function) 
--
CREATE OR REPLACE FUNCTION SIDEP."FUNC_TRAZABILIDAD" (p_id_trazabilidad TT_TRAZABILIDAD.ID_TRAZABILIDAD%TYPE,
                                                        p_tabla           VARCHAR2,
                                                        p_operacion       NUMBER,
                                                        p_ip_usuario      VARCHAR2)
  RETURN NUMBER IS

  /******************************************************************************
     NAME:       FUNC_TRAZABILIDAD
     PURPOSE:  
          Funcion que realiza el mantanimiento en la tabla TT_TRAZABILIDAD  

     REVISIONS:
     Ver        Date        Author           Description
     ---------  ----------  ---------------  ------------------------------------
     1.0        04/04/2014   MFong       1. Created this function.
     NOTES:

     Automatically available Auto Replace Keywords:
        Object Name:     FUNC_TRAZABILIDAD
        Sysdate:         04/04/2014
        Date and Time:   04/04/2014, 12:38:11 p.m., and 04/04/2014 12:38:11 p.m.
        Username:        MFong (set in TOAD Options, Procedure Editor)
        Table Name:       (set in the "New PL/SQL Object" dialog)

      Parametros recibidos: 
          p_id_trazabilidad: Recibe el id del objeto anterior si la operacion es UPD o DEL, si es INS se recibe 0  
          p_tabla: nombre de la tabla que se esta actualizando
          p_operacion: Indica si es Nuevo, Actualizacion o Baja de un registro   
          p_ip_usuario: IP del cliente que se logueo a la aplicacion   

  ******************************************************************************/

  v_id_trazabilidad    NUMBER := 0;
  v_nombre_usuario     VARCHAR2(50);
  v_nuevo              NUMBER := 1;
  v_baja               NUMBER := 2;
  v_actualizado        NUMBER := 3;
  v_id_objeto_trazable NUMBER := NULL;
  v_ip_usuario         VARCHAR2(30);
  v_usuario            VARCHAR2(15);
  v_id_usuario         NUMBER;
  v_configuracion      VARCHAR2(50);

BEGIN

  -- Inicializamos las variables con los valores correspondientes





  SELECT ID_OBJETO_TRAZABLE
    INTO v_id_objeto_trazable
    FROM TS_OBJETO_TRAZABLE
   WHERE TRIM(OBJETO_TRAZABLE) = p_tabla;
  --v_id_usuario:=1;

  IF v_id_objeto_trazable IS NOT NULL THEN

    IF p_operacion <> v_baja THEN
      -- Se obtiene el id_trazabilidad nuevo, en base a la secuencia
      SELECT SQ_TRAZABILIDAD.NEXTVAL INTO v_id_trazabilidad FROM DUAL;

      -- Se inserta el registro en la tabla de trazabilidad
      PKG_INSERTS.PROC_INS_TT_TRAZABILIDAD(v_id_trazabilidad,
                                                    v_id_objeto_trazable,
                                                    SYSDATE,
                                                    NULL); --p_fecha_baja
    END IF;

    IF p_operacion = v_actualizado OR p_operacion = v_baja THEN
      -- Se da de baja el registro de trazabilidad
      UPDATE TT_TRAZABILIDAD
         SET FECHA_BAJA = SYSDATE
       WHERE ID_TRAZABILIDAD = p_id_trazabilidad;
    END IF;

    --Se retorna el id de la trazabilidad que corresponde para asignarlo al objeto
    RETURN v_id_trazabilidad;
  ELSE
    dbms_output.put_line('No existe la tabla en el catalogo de objetos');
  END IF;

END FUNC_TRAZABILIDAD;
/
--
-- RH_DEPENDENCIA_BI  (Trigger) 
--
CREATE OR REPLACE TRIGGER SIDEP.RH_DEPENDENCIA_BI 
BEFORE INSERT ON SIDEP.RH_DEPENDENCIA
FOR EACH ROW
BEGIN
    :new.NOMBRE_DEPENDENCIA_UCI:=:new.NOMBRE_DEPENDENCIA;
   EXCEPTION
     WHEN OTHERS THEN
       RAISE;
END RH_DEPENDENCIA_BI;
/


--
-- RH_DEPENDENCIA_BU  (Trigger) 
--
CREATE OR REPLACE TRIGGER SIDEP.RH_DEPENDENCIA_BU 
BEFORE UPDATE
ON SIDEP.RH_DEPENDENCIA 
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


--
-- RH_TRG_PLAZA  (Trigger) 
--
CREATE OR REPLACE TRIGGER SIDEP.RH_TRG_PLAZA 
BEFORE UPDATE
OF STATUS_PLAZA
ON SIDEP.RH_PLAZA 
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
BEGIN

    IF ( :OLD.status_plaza != :New.status_plaza ) then
        
        if ( :NEW.status_plaza = 'C' )  then  /* Cambio de estatus a cancelado => Anulando la plaza...*/
          :NEW.FECHA_REGISTRO_SUPRESION := sysdate;
          :NEW.USUARIO_BAJA_PLAZA := USER;
          
        elsif (:OLD.status_plaza = 'C' ) then /* Estan activando una plaza... no se debe... */ 
            :NEW.status_plaza := 'C';  /* No permitir activar plaza */
            :NEW.FECHA_CAMBIO_STATUS := sysdate;  
            :NEW.USUARIO_CAMBIO_STATUS := user; 
            
        end if;     
         
    end if; 
    
   EXCEPTION
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
       


       
END ;
/
--
-- TGR_RH_DEPENDENCIA_BI  (Trigger) 
--
CREATE OR REPLACE TRIGGER SIDEP.TGR_RH_DEPENDENCIA_BI 
BEFORE INSERT
ON SIDEP.RH_DEPENDENCIA
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
DISABLE
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
--
-- TR_TT_DEPENDENCIA_CORREO_TR  (Trigger) 
--
CREATE OR REPLACE TRIGGER SIDEP.TR_TT_DEPENDENCIA_CORREO_TR 
BEFORE INSERT OR UPDATE OR DELETE ON SIDEP.TT_DEPENDENCIA_CORREO
FOR EACH ROW
DECLARE 
-- 
-- Purpose: Este trigger realiza todo el proceso de trazabilidad del registro 
-- Este trigger fue generado por medio del procedimiento almacenado: CREA_TRIGGER_TRAZABILIDAD 
-- 
-- MODIFICATION HISTORY 
-- Procedimiento           Date    
-- ---------          ------  
-- CREA_TRIGGER_TRAZABILIDAD 16-OCT-20
-- 

v_id_registro NUMBER; 
v_cambio NUMBER := 0; 
v_ip_usuario VARCHAR2(15) := '10.101.3.65';
v_llave_secuencia NUMBER := 0; 
v_nuevo CONSTANT NUMBER := 1; 
v_baja CONSTANT NUMBER := 2; 
v_actualizado CONSTANT NUMBER := 3; 

v_id_trazabilidad NUMBER; 

TYPE t_cambio IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
v_numero_cambios t_cambio; 

BEGIN 
   IF INSERTING THEN 
      :NEW.ID_TRAZABILIDAD := FUNC_TRAZABILIDAD(0, 'TT_DEPENDENCIA_CORREO', v_nuevo, v_ip_usuario);

   ELSIF UPDATING THEN 
     -- Querys para comparar los campos actuales y nuevos para verificar que existan cambios
      SELECT DECODE(:NEW.ID_DEPENDENCIA_CORREO,:OLD.ID_DEPENDENCIA_CORREO,0,1) INTO v_numero_cambios (1) FROM DUAL;
      SELECT DECODE(:NEW.CORREO_ELECTRONICO,:OLD.CORREO_ELECTRONICO,0,1) INTO v_numero_cambios (2) FROM DUAL;
      SELECT DECODE(:NEW.ID_ESTADO,:OLD.ID_ESTADO,0,1) INTO v_numero_cambios (3) FROM DUAL;
      SELECT DECODE(:NEW.ID_SOURCE,:OLD.ID_SOURCE,0,1) INTO v_numero_cambios (4) FROM DUAL;
      SELECT DECODE(:NEW.ID_USUARIO_REGISTRO,:OLD.ID_USUARIO_REGISTRO,0,1) INTO v_numero_cambios (5) FROM DUAL;
      SELECT DECODE(:NEW.FECHA_REGISTRO,:OLD.FECHA_REGISTRO,0,1) INTO v_numero_cambios (6) FROM DUAL;
      SELECT DECODE(:NEW.OBSERVACIONES,:OLD.OBSERVACIONES,0,1) INTO v_numero_cambios (7) FROM DUAL;
      SELECT DECODE(:NEW.IP,:OLD.IP,0,1) INTO v_numero_cambios (8) FROM DUAL;

     FOR i IN 1 .. v_numero_cambios.count 
          LOOP 
              IF v_numero_cambios(i) > 0 THEN 
                  v_cambio := 1; 
              END IF; 
          END LOOP; 

          IF v_cambio > 0 THEN 
              INSERT INTO TH_DEPENDENCIA_CORREO (ID_DEPENDENCIA_CORREO, CORREO_ELECTRONICO, ID_ESTADO, ID_SOURCE, ID_USUARIO_REGISTRO, FECHA_REGISTRO, OBSERVACIONES, ID_TRAZABILIDAD, IP) VALUES (:OLD.ID_DEPENDENCIA_CORREO, :OLD.CORREO_ELECTRONICO, :OLD.ID_ESTADO, :OLD.ID_SOURCE, :OLD.ID_USUARIO_REGISTRO, :OLD.FECHA_REGISTRO, :OLD.OBSERVACIONES, :OLD.ID_TRAZABILIDAD, :OLD.IP);
              :NEW.ID_TRAZABILIDAD := FUNC_TRAZABILIDAD(:OLD.ID_TRAZABILIDAD, 'TT_DEPENDENCIA_CORREO', v_actualizado, v_ip_usuario);
          END IF; 

   ELSIF DELETING THEN 
       INSERT INTO TH_DEPENDENCIA_CORREO (ID_DEPENDENCIA_CORREO, CORREO_ELECTRONICO, ID_ESTADO, ID_SOURCE, ID_USUARIO_REGISTRO, FECHA_REGISTRO, OBSERVACIONES, ID_TRAZABILIDAD, IP) VALUES (:OLD.ID_DEPENDENCIA_CORREO, :OLD.CORREO_ELECTRONICO, :OLD.ID_ESTADO, :OLD.ID_SOURCE, :OLD.ID_USUARIO_REGISTRO, :OLD.FECHA_REGISTRO, :OLD.OBSERVACIONES, :OLD.ID_TRAZABILIDAD, :OLD.IP);
       v_id_trazabilidad := FUNC_TRAZABILIDAD(:OLD.ID_TRAZABILIDAD, 'TT_DEPENDENCIA_CORREO', v_baja, v_ip_usuario);
   END IF; 

END TR_TT_DEPENDENCIA_CORREO_TR;
/
--
-- PKG_DEPENDENCIA  (Package) 
--
CREATE OR REPLACE PACKAGE SIDEP.PKG_DEPENDENCIA AS
    PROCEDURE PROC_VALIDA_DEPENDENCIA(P_DEPENDENCIA RH_DEPENDENCIA.DEPENDENCIA%TYPE, P_VALOR NUMBER, p_id_salida OUT NUMBER, p_msj OUT VARCHAR2);
    PROCEDURE PROC_GET_GEST_DEPENDENCIA (
        p_id_estado_proceso   tt_gest_dependencia.id_estado_proceso%type DEFAULT 0,
        p_id_tipo_gestion     tt_gest_dependencia.id_tipo_gestion%type DEFAULT 0,
        P_CUR_DATASET OUT SYS_REFCURSOR,
        P_MSJ OUT VARCHAR2);
    PROCEDURE PROC_GET_GESTION (P_ID_GESTION TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,P_CUR_DATASET OUT SYS_REFCURSOR,P_MSJ OUT VARCHAR2);
    PROCEDURE PROC_INS_TT_GEST_DEPENDENCIA(
        p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_nombre_gafete             TT_GEST_DEPENDENCIA.NOMBRE_GAFETE%TYPE,
        p_nombre_abreviado          TT_GEST_DEPENDENCIA.NOMBRE_ABREVIADO%TYPE,
        p_nombre_documento          TT_GEST_DEPENDENCIA.NOMBRE_DOCUMENTO%TYPE,
        p_conector                  TT_GEST_DEPENDENCIA.CONECTOR%TYPE,
        p_fecha_del_acuerdo         varchar2,
        p_fecha_entra_vigencia      varchar2,
        p_fecha_anulacion           varchar2,
        p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
        p_funcion_unidad            TT_GEST_DEPENDENCIA.FUNCION_UNIDAD%TYPE,
        p_departamento              TT_GEST_DEPENDENCIA.DEPARTAMENTO%TYPE,
        p_municipio                 TT_GEST_DEPENDENCIA.MUNICIPIO%TYPE,
        p_tipo_area                 TT_GEST_DEPENDENCIA.TIPO_AREA%TYPE,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo            VARCHAR2,
        p_ruta_archivo              VARCHAR2,
        p_id_tipo_gestion           TT_GEST_DEPENDENCIA.ID_TIPO_GESTION%TYPE,
        p_fecha_publicacion         varchar2,
        p_obs_fecha_vigencia        TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2); 
    PROCEDURE PROC_MOD_TT_GEST_DEPENDENCIA(
        p_id_gestion_dependencia    TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_nombre_gafete             TT_GEST_DEPENDENCIA.NOMBRE_GAFETE%TYPE,
        p_nombre_abreviado          TT_GEST_DEPENDENCIA.NOMBRE_ABREVIADO%TYPE,
        p_nombre_documento          TT_GEST_DEPENDENCIA.NOMBRE_DOCUMENTO%TYPE,
        p_conector                  TT_GEST_DEPENDENCIA.CONECTOR%TYPE,
        p_fecha_del_acuerdo         varchar2,
        p_fecha_entra_vigencia      varchar2,
        p_fecha_anulacion           varchar2,
        p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
        p_funcion_unidad            TT_GEST_DEPENDENCIA.FUNCION_UNIDAD%TYPE,
        p_departamento              TT_GEST_DEPENDENCIA.DEPARTAMENTO%TYPE,
        p_municipio                 TT_GEST_DEPENDENCIA.MUNICIPIO%TYPE,
        p_tipo_area                 TT_GEST_DEPENDENCIA.TIPO_AREA%TYPE,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo            VARCHAR2,
        p_ruta_archivo              VARCHAR2,
        p_fecha_publicacion         varchar2,
        p_obs_fecha_vigencia        TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2);        
    PROCEDURE PROC_BAJA_TT_GEST_DEPENDENCIA(
        p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_fecha_anulacion           varchar2,
        p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo            VARCHAR2,
        p_ruta_archivo              VARCHAR2,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2);
    PROCEDURE PROC_MOD_BAJA_GEST_DEPENDENCIA(
        p_id_gestion_dependencia    TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_fecha_anulacion           varchar2,
        p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo            VARCHAR2,
        p_ruta_archivo              VARCHAR2,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2);
    PROCEDURE PROC_GET_DEPENDENCIA_NOMINAL (P_DEPENDENCIA RH_DEPENDENCIA.DEPENDENCIA%TYPE, P_CUR_DATASET OUT SYS_REFCURSOR, P_MSJ OUT VARCHAR2);
    PROCEDURE PROC_INS_REGULA_DEPENDENCIA(
        p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_nombre_gafete             TT_GEST_DEPENDENCIA.NOMBRE_GAFETE%TYPE,
        p_nombre_abreviado          TT_GEST_DEPENDENCIA.NOMBRE_ABREVIADO%TYPE,
        p_nombre_documento          TT_GEST_DEPENDENCIA.NOMBRE_DOCUMENTO%TYPE,
        p_conector                  TT_GEST_DEPENDENCIA.CONECTOR%TYPE,
        p_fecha_del_acuerdo         varchar2,
        p_fecha_entra_vigencia      varchar2,
        p_fecha_anulacion           varchar2,
        p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
        p_funcion_unidad            TT_GEST_DEPENDENCIA.FUNCION_UNIDAD%TYPE,
        p_departamento              TT_GEST_DEPENDENCIA.DEPARTAMENTO%TYPE,
        p_municipio                 TT_GEST_DEPENDENCIA.MUNICIPIO%TYPE,
        p_tipo_area                 TT_GEST_DEPENDENCIA.TIPO_AREA%TYPE,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo            VARCHAR2,
        p_ruta_archivo              VARCHAR2,
        p_id_tipo_gestion           TT_GEST_DEPENDENCIA.ID_TIPO_GESTION%TYPE,
        p_fecha_publicacion         varchar2,
        p_obs_fecha_vigencia        TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2);
    PROCEDURE PROC_VISUALIZAR_ARCHIVO(
        P_ID_GEST_DEPENDENCIA       TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2);
    /* Procedimiento para visualiza el pdf de la dependencia*/
    PROCEDURE PROC_VISUALIZAR_ARCHIVO_DEP(
        P_DEPENDENCIA       RH_DEPENDENCIA.DEPENDENCIA%TYPE,
        p_id_salida       OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj             OUT VARCHAR2);
    PROCEDURE PROC_CREA_DEPENDENCIA(
        p_codigo_dependencia            RH_DEPENDENCIA.DEPENDENCIA%TYPE,
        p_nombre_dependencia            RH_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_nombre_gafete                 RH_DEPENDENCIA.NOMBRE_GAFETE%TYPE,
        p_nombre_abreviado              RH_DEPENDENCIA.NOMBRE_ABREVIADO%TYPE,
        p_fecha_creacion_dependencia    rh_dependencia.fecha_creacion_dependencia%TYPE,
        p_conector_dependencia          RH_DEPENDENCIA.CONECTOR_DEPENDENCIA%TYPE,
        p_nombre_dependencia_documento  RH_DEPENDENCIA.NOMBRE_DEPENDENCIA_DOCUMENTO%TYPE,
        p_funcion_unidad                RH_DEPENDENCIA.FUNCION_UNIDAD%TYPE,
        p_codigo_presupuestario         RH_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_referencia                    RH_DEPENDENCIA.REFERENCIA%TYPE,
        p_id_area                       RH_DEPENDENCIA.ID_AREA%TYPE,
        p_acuerdo_digital               RH_DEPENDENCIA.ACUERDO_DIGITAL%TYPE,
        p_departamento                  RH_DIRECCION_DEPENDENCIA.DEPARTAMENTO%TYPE,
        p_municipio                     RH_DIRECCION_DEPENDENCIA.MUNICIPIO%TYPE,
        p_id_usuario_registro           TT_GEST_dEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_fecha_entra_vigencia          TT_GEST_DEPENDENCIA.FECHA_ENTRA_VIGENCIA%TYPE,
        p_ip                            TT_GEST_DEPENDENCIA.IP%TYPE,
        p_fecha_publicacion             RH_DEPENDENCIA.FECHA_PUBLICACION%TYPE,
        p_obs_fecha_vigencia            RH_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                     OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                           OUT VARCHAR2);
    PROCEDURE PROC_PROCESA_SOL_CREACION(
        p_id_gestion_dependencia            TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_observaciones                     TT_GEST_DEPENDENCIA.OBSERVACIONES%TYPE,
        p_ip                                TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro               TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_usuario                           VARCHAR2,
        p_id_salida                         OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                               OUT VARCHAR2);
    PROCEDURE PROC_RECHAZA_SOLOLICITUD(
        p_id_gestion_dependencia    TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_observaciones             TT_GEST_DEPENDENCIA.OBSERVACIONES%TYPE,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                       OUT VARCHAR2);        
    PROCEDURE PROC_BAJA_DEPENDENCIA(
        p_id_gestion_dependencia    tt_gest_dependencia.id_gestion_dependencia%type,
        p_observaciones             tt_gest_dependencia.observaciones%type,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_usuario                           VARCHAR2,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                       OUT VARCHAR2);
    PROCEDURE PROC_ACT_TT_GEST_DEPENDENCIA(
       p_codigo_dependencia            TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_conector_dependencia          tt_gest_dependencia.conector%type,
        p_funcion_unidad                tt_gest_dependencia.funcion_unidad%type,
        p_referencia                    tt_gest_dependencia.referencia%type,
        p_id_area                       tt_gest_dependencia.tipo_area%type,
        p_fecha_creacion_dependencia    varchar2,
        p_fecha_entra_vigencia          varchar2,
        p_id_usuario_registro           TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo                VARCHAR2,
        p_ruta_archivo                  VARCHAR2,
        p_ip                            TT_GEST_DEPENDENCIA.IP%TYPE,
        p_fecha_publicacion         varchar2,
        p_obs_fecha_vigencia        TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                     OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                           OUT VARCHAR2);
    PROCEDURE PROC_MOD_ACT_GEST_DEPENDENCIA(
         p_id_gestion_dependencia        TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_conector_dependencia          tt_gest_dependencia.conector%type,
        p_funcion_unidad                tt_gest_dependencia.funcion_unidad%type,
        p_referencia                    tt_gest_dependencia.referencia%type,
        p_id_area                       tt_gest_dependencia.tipo_area%type,
        p_fecha_creacion_dependencia    varchar2,
        p_fecha_entra_vigencia          varchar2,
        p_id_usuario_registro           TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo                VARCHAR2,
        p_ruta_archivo                  VARCHAR2,
        p_ip                            TT_GEST_DEPENDENCIA.IP%TYPE,
        p_fecha_publicacion             varchar2,
        p_obs_fecha_vigencia            TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                     OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                           OUT VARCHAR2);
     PROCEDURE PROC_ACTUALIZA_DEPENNOMINAL(
        p_id_gest_dependencia           tt_gest_dependencia.id_gestion_dependencia%type,
        p_observaciones                 tt_gest_dependencia.observaciones%type,
        p_id_usuario_registro           tt_gest_dependencia.id_usuario_registro%type,
        p_ip                            tt_gest_dependencia.ip%type,
        p_usuario                       varchar2,
        p_id_salida                     OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                           OUT VARCHAR2);  
        
    PROCEDURE PROC_GET_PLAZAS_DEPENDENCIA(
        p_codigo_dependencia            TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                       OUT VARCHAR2);
     PROCEDURE PROC_INS_TT_DEP_CORREO(
        p_id_dependencia_correo     tt_dependencia_correo.id_dependencia_correo%TYPE,
        p_dependencia               tt_dependencia_correo.dependencia%TYPE,
        p_correo_electronico        tt_dependencia_correo.correo_electronico%TYPE,
        p_id_usuario_registro       tt_dependencia_correo.id_usuario_registro%type,
        p_ip                        tt_dependencia_correo.ip%type,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                       OUT VARCHAR2);       

    PROCEDURE PROC_VERIFICA_DEPEN_PLAZA(
        p_codig_dependencia     rh_dependencia.dependencia%type,
        p_id_salida             OUT rh_dependencia.dependencia%type,
        p_msj                   OUT varchar2); 
        
    PROCEDURE PROC_INS_TT_DEP_RH_CIDEJ(
        p_id_depen_RH_CIDEJ         tt_dependencia_rh_cidej.id_dep_rh_cidej%TYPE,
        p_dependencia               tt_dependencia_rh_cidej.dependencia%TYPE,
        p_id_despacho               tt_dependencia_rh_cidej.id_despacho%type,
        p_id_usuario_registro       tt_dependencia_rh_cidej.id_usuario_registro%type,
        p_ip                        tt_dependencia_rh_cidej.ip%type,
        p_id_salida                 OUT tt_dependencia_rh_cidej.id_dep_rh_cidej%TYPE,
        p_msj                       OUT VARCHAR2);
    PROCEDURE PROC_VALIDA_DESPACHO(P_ID_DESPACHO TT_DEPENDENCIA_RH_CIDEJ.ID_DESPACHO%TYPE, p_id_salida OUT NUMBER, p_msj OUT VARCHAR2);
    PROCEDURE PROC_ELIMINAR_RECHAZO(
        p_id_gestion_dependencia       TT_GEST_DEPENDENCIA.ID_GESTion_DEPENDENCIA%TYPE, 
        p_observaciones                 TT_GEST_DEPENDENCIA.observaciones%type,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_salida OUT NUMBER, 
        p_msj OUT VARCHAR2);
    PROCEDURE PROC_GET_NOMBRE_DEPENDENCIA (
        P_CODIGO_PRESUPUESTARIO   IN SIDEP.RH_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE, 
        P_CUR_DATASET       OUT SYS_REFCURSOR,
        P_MSJ               OUT VARCHAR2
    );
END PKG_DEPENDENCIA;
/
--
-- PKG_DEPENDENCIA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY SIDEP.PKG_DEPENDENCIA AS
    
    /* Obitne la lista de todas las gestiones*/
    PROCEDURE PROC_GET_GEST_DEPENDENCIA (
        p_id_estado_proceso   tt_gest_dependencia.id_estado_proceso%type DEFAULT 0,
        p_id_tipo_gestion     tt_gest_dependencia.id_tipo_gestion%type DEFAULT 0,
        P_CUR_DATASET   OUT SYS_REFCURSOR,
        P_MSJ           OUT VARCHAR2
    )
        AS
    BEGIN
        OPEN P_CUR_DATASET FOR 
            /* Formatted on 24/09/2020 12:06:55 (QP5 v5.256.13226.35538) */
            SELECT ID_GESTION_DEPENDENCIA,
                CODIGO_DEPENDENCIA,
                CODIGO_PRESUPUESTARIO,
                NOMBRE_DEPENDENCIA,
                NOMBRE_GAFETE,
                NOMBRE_ABREVIADO,
                NOMBRE_DOCUMENTO,
                CONECTOR,
                FECHA_DEL_ACUERDO,
                FECHA_ENTRA_VIGENCIA,
                FECHA_ANULACION,
                REFERENCIA,
                FUNCION_UNIDAD,
                DEPARTAMENTO,
                RH_PKG.DEPARTAMENTO(1,DEPARTAMENTO) NOMBRE_DEPARTAMENTO,
                MUNICIPIO,
                RH_PKG.MUNICIPIO(1,DEPARTAMENTO,MUNICIPIO) NOMBRE_MUNICIPIO,
                TIPO_AREA,
                E.NOMBRE_AREA,
                ACUERDO_DIGITAL,
                A.OBSERVACIONES,
                A.ID_ESTADO_PROCESO,
                B.ESTADO_PROCESO,
                A.ID_TIPO_GESTION,
                C.TIPO_GESTION,
                d.nombre,
                A.FECHA_PUBLICACION,
                a.obs_fecha_vigencia
            FROM SIDEP.TT_GEST_DEPENDENCIA A
                INNER JOIN TS_ESTADO_PROCESO B ON A.ID_ESTADO_PROCESO = B.ID_ESTADO_PROCESO 
                INNER JOIN TS_TIPO_GESTION C ON A.ID_TIPO_GESTION = C.ID_TIPO_GESTION 
                INNER JOIN TC_USUARIO D ON A.ID_USUARIO_REGISTRO = D.ID_USUARIO
                INNER JOIN RH_TIPO_AREA E ON A.TIPO_AREA = E.ID_AREA
            WHERE
                A.ID_ESTADO = 1 AND
                B.ID_ESTADO_PROCESO = DECODE(P_ID_ESTADO_PROCESO,0, B.ID_ESTADO_PROCESO,P_ID_ESTADO_PROCESO) AND
                C.ID_TIPO_GESTION = DECODE(P_ID_TIPO_GESTION, 0, C.ID_TIPO_GESTION, P_ID_TIPO_GESTION)
            ORDER BY FECHA_REGISTRO DESC; 
    END PROC_GET_GEST_DEPENDENCIA;
    
    /*Obtiene una gestion especifica*/
    PROCEDURE PROC_GET_GESTION (
        P_ID_GESTION    TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        P_CUR_DATASET   OUT SYS_REFCURSOR,
        P_MSJ           OUT VARCHAR2
    )
        AS
    BEGIN
        OPEN P_CUR_DATASET FOR 
            /* Formatted on 24/09/2020 12:06:55 (QP5 v5.256.13226.35538) */
            SELECT ID_GESTION_DEPENDENCIA,
                   CODIGO_DEPENDENCIA,
                   CODIGO_PRESUPUESTARIO,
                   NOMBRE_DEPENDENCIA,
                   NOMBRE_GAFETE,
                   NOMBRE_ABREVIADO,
                   NOMBRE_DOCUMENTO,
                   CONECTOR,
                   FECHA_DEL_ACUERDO,
                   FECHA_ENTRA_VIGENCIA,
                   FECHA_ANULACION,
                   REFERENCIA,
                   FUNCION_UNIDAD,
                   DEPARTAMENTO,
                   RH_PKG.DEPARTAMENTO(1,DEPARTAMENTO) NOMBRE_DEPARTAMENTO,
                   MUNICIPIO,
                   RH_PKG.MUNICIPIO(1,DEPARTAMENTO,MUNICIPIO) NOMBRE_MUNICIPIO,
                   TIPO_AREA,
                   B.NOMBRE_AREA,
                   ACUERDO_DIGITAL,
                   ID_TIPO_GESTION,
                   A.OBSERVACIONES,
                   a.fecha_publicacion,
                   a.obs_fecha_vigencia
            FROM SIDEP.TT_GEST_DEPENDENCIA A
                INNER JOIN RH_TIPO_AREA B ON A.TIPO_AREA = B.ID_AREA
            WHERE 
                ID_GESTION_DEPENDENCIA = P_ID_GESTION;
    END PROC_GET_GESTION;
        
    /*-Valida que el codigo de la dependencia/presupuestario no este duplicado*/
    PROCEDURE PROC_VALIDA_DEPENDENCIA(
        P_DEPENDENCIA               RH_DEPENDENCIA.DEPENDENCIA%TYPE,
        P_VALOR                     NUMBER,
        p_id_salida                 OUT NUMBER,
        p_msj                       OUT VARCHAR2)
    AS
        P_VALIDA NUMBER := 0;
        P_VALIDA2 NUMBER := 0;
    BEGIN
        IF P_VALOR = 1 THEN
            P_VALIDA := PKG_DEPENDENCIA_VALIDACIONES.FUNC_VALIDA_COD_DEPENDENCIA(P_DEPENDENCIA);
        ELSIF P_VALOR = 2 THEN
            P_VALIDA := PKG_DEPENDENCIA_VALIDACIONES.FUNC_VALIDA_COD_PRESUPUESTARIO(P_DEPENDENCIA);
        END IF;      
       --0 CODIGO DISPONIBLE
       --1 CODIGO DE DEPENDENCIA EXISTENTE
       --2 CODIGO DE DEPENDENCIA EN LA SOLICITUD ACTIVO
        IF P_VALIDA = 0 THEN
            P_VALIDA2 := PKG_DEPENDENCIA_VALIDACIONES.FUNC_VALIDA_COD_DEP_SOLICITUD(P_DEPENDENCIA);
            IF P_VALIDA2 != 0 THEN
                p_id_salida := -1;
                p_msj := 'El codigo de la dependencia se encuentra en una solicitud';
            else
                p_id_salida := P_VALIDA;
                p_msj := 'OK';
            END IF;
        ELSE
            p_id_salida := -1;
            p_msj := 'Codigo duplicado';
        END IF;
    END PROC_VALIDA_DEPENDENCIA;
    
    /*solicitud Procedimiento de insercion*/
    PROCEDURE PROC_INS_TT_GEST_DEPENDENCIA(
        p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_nombre_gafete             TT_GEST_DEPENDENCIA.NOMBRE_GAFETE%TYPE,
        p_nombre_abreviado          TT_GEST_DEPENDENCIA.NOMBRE_ABREVIADO%TYPE,
        p_nombre_documento          TT_GEST_DEPENDENCIA.NOMBRE_DOCUMENTO%TYPE,
        p_conector                  TT_GEST_DEPENDENCIA.CONECTOR%TYPE,
        p_fecha_del_acuerdo         varchar2,
        p_fecha_entra_vigencia      varchar2,
        p_fecha_anulacion           varchar2,
        p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
        p_funcion_unidad            TT_GEST_DEPENDENCIA.FUNCION_UNIDAD%TYPE,
        p_departamento              TT_GEST_DEPENDENCIA.DEPARTAMENTO%TYPE,
        p_municipio                 TT_GEST_DEPENDENCIA.MUNICIPIO%TYPE,
        p_tipo_area                 TT_GEST_DEPENDENCIA.TIPO_AREA%TYPE,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo            VARCHAR2,
        p_ruta_archivo              VARCHAR2,
        p_id_tipo_gestion           TT_GEST_DEPENDENCIA.ID_TIPO_GESTION%TYPE,
        p_fecha_publicacion         varchar2,
        p_obs_fecha_vigencia        TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2)
    AS 
        ruta TT_GEST_DEPENDENCIA.ACUERDO_DIGITAL%TYPE;
    BEGIN
        SELECT
            SQ_TT_GEST_DEPENDENCIA.NEXTVAL --la sequencia de la tabla
        INTO
            p_id_salida
        FROM
            dual; 

        ruta := p_ruta_archivo || TO_CHAR(p_id_salida) || chr(47)  ||p_nombre_archivo;
                   
        PKG_INSERTS.PROC_INS_TT_GEST_DEPENDENCIA (
            p_id_gestion_dependencia => p_id_salida,
            p_codigo_dependencia => p_codigo_dependencia,
            p_codigo_presupuestario => p_codigo_presupuestario,
            p_nombre_dependencia => p_nombre_dependencia,
            p_nombre_gafete => p_nombre_gafete,
            p_nombre_abreviado => p_nombre_abreviado,
            p_nombre_documento => p_nombre_documento,
            p_conector => p_conector,
            p_fecha_del_acuerdo => nvl(to_date(p_fecha_del_acuerdo,'dd/mm/yyyy'),null),
            p_fecha_entra_vigencia => nvl(to_date(p_fecha_entra_vigencia,'dd/mm/yyyy'),null),
            p_fecha_anulacion => nvl(to_date(p_fecha_anulacion,'dd/mm/yyyy'),null),
            p_referencia => p_referencia,
            p_funcion_unidad => p_funcion_unidad,
            p_departamento => p_departamento,
            p_municipio => p_municipio,
            p_tipo_area => p_tipo_area,
            p_acuerdo_digital => ruta,
            p_id_tipo_gestion => p_id_tipo_gestion,
            p_id_estado => SIDEP.PKG_CONSTANTES.ESTADO_ACTIVO,
            p_id_source => SIDEP.PKG_CONSTANTES.SOURCE_APP,
            p_ip => p_ip,
            p_id_estado_proceso => SIDEP.PKG_CONSTANTES.ESTADO_ACTIVO,
            p_id_trazabilidad => NULL,
            p_observaciones => NULL,
            p_id_usuario_registro => p_id_usuario_registro,
            p_fecha_registro => SYSDATE,
            p_fecha_publicacion => nvl(to_date(p_fecha_publicacion,'dd/mm/yyyy'),null),
            p_obs_fecha_vigencia => p_obs_fecha_vigencia);
            
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al crear una solicitud@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;            
    END PROC_INS_TT_GEST_DEPENDENCIA;   
    
    /*solicitud Procedimiento de actualizacion*/
    PROCEDURE PROC_MOD_TT_GEST_DEPENDENCIA(
        p_id_gestion_dependencia    TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_nombre_gafete             TT_GEST_DEPENDENCIA.NOMBRE_GAFETE%TYPE,
        p_nombre_abreviado          TT_GEST_DEPENDENCIA.NOMBRE_ABREVIADO%TYPE,
        p_nombre_documento          TT_GEST_DEPENDENCIA.NOMBRE_DOCUMENTO%TYPE,
        p_conector                  TT_GEST_DEPENDENCIA.CONECTOR%TYPE,
        p_fecha_del_acuerdo         varchar2,
        p_fecha_entra_vigencia      varchar2,
        p_fecha_anulacion           varchar2,
        p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
        p_funcion_unidad            TT_GEST_DEPENDENCIA.FUNCION_UNIDAD%TYPE,
        p_departamento              TT_GEST_DEPENDENCIA.DEPARTAMENTO%TYPE,
        p_municipio                 TT_GEST_DEPENDENCIA.MUNICIPIO%TYPE,
        p_tipo_area                 TT_GEST_DEPENDENCIA.TIPO_AREA%TYPE,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo            VARCHAR2,
        p_ruta_archivo              VARCHAR2,
        p_fecha_publicacion         varchar2,
        p_obs_fecha_vigencia        TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2)
    AS 
        ruta TT_GEST_DEPENDENCIA.ACUERDO_DIGITAL%TYPE;
        p_estadop   number;
    BEGIN
        ruta := p_ruta_archivo || TO_CHAR(p_id_gestion_dependencia) || chr(47)  ||p_nombre_archivo;
        SELECT ID_ESTADO_PROCESO into p_estadop FROM SIDEP.tt_gest_dependencia WHERE ID_GESTION_DEPENDENCIA = P_ID_GESTION_DEPENDENCIA;
        IF p_estadop = 3 then
            p_estadop := 1;
        END IF;
            
        UPDATE SIDEP.TT_GEST_DEPENDENCIA
        SET    CODIGO_DEPENDENCIA     = p_codigo_dependencia,
               CODIGO_PRESUPUESTARIO  = p_codigo_presupuestario,
               NOMBRE_DEPENDENCIA     = p_nombre_dependencia,
               NOMBRE_GAFETE          = p_nombre_gafete,
               NOMBRE_ABREVIADO       = p_nombre_abreviado,
               NOMBRE_DOCUMENTO       = p_nombre_documento,
               CONECTOR               = p_conector,
               FECHA_DEL_ACUERDO      = to_date(p_fecha_del_acuerdo,'DD/MM/YYYY'),
               FECHA_ENTRA_VIGENCIA   = to_date(p_fecha_entra_vigencia,'DD/MM/YYYY'),
               FECHA_ANULACION        = to_date(p_fecha_anulacion,'DD/MM/YYYY'),
               REFERENCIA             = p_referencia,
               FUNCION_UNIDAD         = p_funcion_unidad,
               DEPARTAMENTO           = p_departamento,
               MUNICIPIO              = p_municipio,
               TIPO_AREA              = p_tipo_area,
               ID_ESTADO_PROCESO      = p_estadop,
               ACUERDO_DIGITAL        = ruta,
               IP                     = p_ip,
               ID_USUARIO_REGISTRO    = p_id_usuario_registro,
               FECHA_PUBLICACION      = to_date(p_fecha_publicacion,'DD/MM/YYYY'),
               OBS_FECHA_VIGENCIA     = p_obs_fecha_vigencia
        WHERE  ID_GESTION_DEPENDENCIA = p_id_gestion_dependencia;
        
        p_id_salida := p_id_gestion_dependencia;    
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error la actualizacion la informacion de la solicitud@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;            
    END PROC_MOD_TT_GEST_DEPENDENCIA;            

    /*Procedimiento para dar de baja a la dependencia*/
    PROCEDURE PROC_BAJA_TT_GEST_DEPENDENCIA(
        p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_fecha_anulacion           varchar2,
        p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo            VARCHAR2,
        p_ruta_archivo              VARCHAR2,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2)
    AS 
        ruta TT_GEST_DEPENDENCIA.ACUERDO_DIGITAL%TYPE;
        p_cantidad  number;    
        p_dep number;
        p_mun number;
        p_tar number;
        p_nombre_gafete  varchar(1024);
        p_nombre_abreviado varchar(1024);
        p_fecha_creacion varchar(11); 
        p_conector RH_DEPENDENCIA.CONECTOR_DEPENDENCIA%TYPE;
        p_nombre_documento varchar(1024);
        p_funcion RH_DEPENDENCIA.FUNCION_UNIDAD%TYPE;
        p_fecha_vigencia VARCHAR2(11);
        p_fecha_publicacion varchar2(11);
        p_obs_fecha_vigencia varchar2(11);
    BEGIN
        SELECT COUNT(*) INTO P_CANTIDAD FROM SIDEP.tt_gest_dependencia 
        WHERE id_estado = 1 AND ID_TIPO_GESTION IN (2,3) AND ID_ESTADO_PROCESO IN (1,3) AND 
        CODIGO_DEPENDENCIA = p_codigo_dependencia;
        IF P_CANTIDAD = 0 THEN
            SELECT
                SQ_TT_GEST_DEPENDENCIA.NEXTVAL --la sequencia de la tabla
            INTO
                p_id_salida
            FROM
                dual;
            
            SELECT  
                NOMBRE_GAFETE, NOMBRE_ABREVIADO,  to_char(FECHA_CREACION_DEPENDENCIA,'DD/MM/YYYY'), CONECTOR_DEPENDENCIA, NOMBRE_DEPENDENCIA_DOCUMENTO, FUNCION_UNIDAD, ID_AREA, DEPARTAMENTO, MUNICIPIO, TO_CHAR(FECHA_ENTRA_VIGENCIA,'DD/MM/YYYY'), TO_CHAR(FECHA_PUBLICACION,'DD/MM/YYYY'), OBS_FECHA_VIGENCIA 
            INTO 
                p_nombre_gafete, p_nombre_abreviado, p_fecha_creacion, p_conector, p_nombre_documento, p_funcion,  p_tar, p_dep, p_mun, p_fecha_vigencia, p_fecha_publicacion, p_obs_fecha_vigencia
            FROM SIDEP.RH_DEPENDENCIA D INNER JOIN SIDEP.RH_DIRECCION_DEPENDENCIA DD ON D.ID_DIRECCION = DD.ID_DIRECCION
            WHERE DEPENDENCIA = p_codigo_dependencia;
            
            ruta := p_ruta_archivo || TO_CHAR(p_id_salida) || chr(47)  ||p_nombre_archivo;
            
            PKG_INSERTS.PROC_INS_TT_GEST_DEPENDENCIA (
                p_id_gestion_dependencia => p_id_salida,
                p_codigo_dependencia => p_codigo_dependencia,
                p_codigo_presupuestario => p_codigo_presupuestario,
                p_nombre_dependencia => p_nombre_dependencia,
                p_nombre_gafete => p_nombre_gafete,
                p_nombre_abreviado => p_nombre_abreviado,
                p_nombre_documento => p_nombre_documento,
                p_conector => p_conector,
                p_fecha_del_acuerdo => nvl(to_date(p_fecha_creacion,'DD/MM/YYYY'),null),
                p_fecha_entra_vigencia => nvl(to_date(p_fecha_vigencia,'DD/MM/YYYY'),null),
                p_fecha_anulacion => nvl(to_date(p_fecha_anulacion,'DD/MM/YYYY'),null),
                p_referencia => p_referencia,
                p_funcion_unidad => p_funcion,
                p_departamento => p_dep,
                p_municipio => p_mun,
                p_tipo_area => p_tar,
                p_acuerdo_digital => ruta,
                p_id_tipo_gestion => PKG_CONSTANTES.BAJA_DEPENDENCIA,
                p_id_estado => SIDEP.PKG_CONSTANTES.ESTADO_ACTIVO,
                p_id_source => SIDEP.PKG_CONSTANTES.SOURCE_APP,
                p_ip => p_ip,
                p_id_estado_proceso => SIDEP.PKG_CONSTANTES.SOLICITUD,
                p_id_trazabilidad => null,
                p_observaciones => null,
                p_id_usuario_registro => p_id_usuario_registro,
                p_fecha_registro => SYSDATE,
                p_fecha_publicacion => nvl(to_date(p_fecha_publicacion,'DD/MM/YYYY'),null),
                p_obs_fecha_vigencia => p_obs_fecha_vigencia);         
        ELSE
            p_id_salida :=-1;
            p_msj := 'Ya existe una gesti?ara esta dependencia nominal';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al crear la solicitud de baja de la dependencia@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;            
    END PROC_BAJA_TT_GEST_DEPENDENCIA;                
    
    /*Procediminto para  modificar la solicitud de la baja de una dependencia*/
    PROCEDURE PROC_MOD_BAJA_GEST_DEPENDENCIA(
        p_id_gestion_dependencia    TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_fecha_anulacion           varchar2,
        p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo            VARCHAR2,
        p_ruta_archivo              VARCHAR2,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2)
    AS 
        ruta TT_GEST_DEPENDENCIA.ACUERDO_DIGITAL%TYPE;
    BEGIN
        
        ruta := p_ruta_archivo || TO_CHAR(p_id_salida) || chr(47)  ||p_nombre_archivo;
        p_id_salida := p_id_gestion_dependencia;
        
        UPDATE TT_GEST_DEPENDENCIA
        SET
            CODIGO_DEPENDENCIA =        p_codigo_dependencia,
            CODIGO_PRESUPUESTARIO =     p_codigo_presupuestario,
            NOMBRE_DEPENDENCIA =        p_nombre_dependencia,
            FECHA_ANULACION =           to_date(p_fecha_anulacion,'dd/mm/yyyy'),
            REFERENCIA =                p_referencia,
            ID_USUARIO_REGISTRO =       p_id_usuario_registro,
            ACUERDO_DIGITAL =           ruta,
            IP =                        p_ip,
            ID_ESTADO_PROCESO =          PKG_CONSTANTES.SOLICITUD
        WHERE
            ID_GESTION_DEPENDENCIA = p_id_gestion_dependencia;              
        
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al actualizar la solicitud de baja@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;            
    END PROC_MOD_BAJA_GEST_DEPENDENCIA;                
    
    
    /*Procedimiento que devuelve la dependencia nominal a consultar*/
    PROCEDURE PROC_GET_DEPENDENCIA_NOMINAL (
        P_DEPENDENCIA   RH_DEPENDENCIA.DEPENDENCIA%TYPE,
        P_CUR_DATASET   OUT SYS_REFCURSOR,
        P_MSJ           OUT VARCHAR2
    )
        AS
    BEGIN
        OPEN P_CUR_DATASET FOR 
            SELECT 
                DEPENDENCIA,
                CODIGO_PRESUPUESTARIO,
                NOMBRE_DEPENDENCIA,
                NOMBRE_GAFETE,
                NOMBRE_ABREVIADO,
                NOMBRE_DEPENDENCIA_DOCUMENTO,  
                A.ID_AREA,
                C.NOMBRE_AREA,
                B.DEPARTAMENTO,
                SIDEP.RH_PKG.DEPARTAMENTO(1,B.DEPARTAMENTO) NOMBRE_DEPARTAMENTO,
                B.MUNICIPIO,
                SIDEP.RH_PKG.MUNICIPIO(1,B.DEPARTAMENTO,B.MUNICIPIO) NOMBRE_MUNICIPIO,
                A.ACUERDO_DIGITAL,
                a.conector_dependencia,                
                A.FUNCION_UNIDAD,
                A.FECHA_CREACION_DEPENDENCIA,
                A.FECHA_ENTRA_VIGENCIA,
                A.REFERENCIA,
                A.FECHA_PUBLICACION,
                a.obs_fecha_vigencia
            FROM SIDEP.RH_DEPENDENCIA A
                INNER JOIN SIDEP.RH_DIRECCION_DEPENDENCIA B ON A.ID_DIRECCION = B.ID_DIRECCION
                LEFT JOIN SIDEP.RH_TIPO_AREA C ON A.ID_AREA = C.ID_AREA
            WHERE 
                UNIDAD_PRESUPUESTARIA = 'S' AND
                DEPENDENCIA = P_DEPENDENCIA;
    END PROC_GET_DEPENDENCIA_NOMINAL;
    
    /*Procedimiento para solicitar la regularizacion de una dependencia*/
    PROCEDURE PROC_INS_REGULA_DEPENDENCIA(
        p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_codigo_presupuestario     TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_nombre_dependencia        TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_nombre_gafete             TT_GEST_DEPENDENCIA.NOMBRE_GAFETE%TYPE,
        p_nombre_abreviado          TT_GEST_DEPENDENCIA.NOMBRE_ABREVIADO%TYPE,
        p_nombre_documento          TT_GEST_DEPENDENCIA.NOMBRE_DOCUMENTO%TYPE,
        p_conector                  TT_GEST_DEPENDENCIA.CONECTOR%TYPE,
        p_fecha_del_acuerdo         varchar2,
        p_fecha_entra_vigencia      varchar2,
        p_fecha_anulacion           varchar2,
        p_referencia                TT_GEST_DEPENDENCIA.REFERENCIA%TYPE,
        p_funcion_unidad            TT_GEST_DEPENDENCIA.FUNCION_UNIDAD%TYPE,
        p_departamento              TT_GEST_DEPENDENCIA.DEPARTAMENTO%TYPE,
        p_municipio                 TT_GEST_DEPENDENCIA.MUNICIPIO%TYPE,
        p_tipo_area                 TT_GEST_DEPENDENCIA.TIPO_AREA%TYPE,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo            VARCHAR2,
        p_ruta_archivo              VARCHAR2,
        p_id_tipo_gestion           TT_GEST_DEPENDENCIA.ID_TIPO_GESTION%TYPE,
        p_fecha_publicacion         varchar2,
        p_obs_fecha_vigencia        TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2)
    AS 
        ruta TT_GEST_DEPENDENCIA.ACUERDO_DIGITAL%TYPE;
        P_CANTIDAD  NUMBER;
    BEGIN
        SELECT COUNT(*) INTO P_CANTIDAD FROM SIDEP.tt_gest_dependencia 
        WHERE id_estado = 1 AND 
        ID_TIPO_GESTION IN (2,4) AND ID_ESTADO_PROCESO IN (1,3) AND
        CODIGO_DEPENDENCIA = p_codigo_dependencia;
        IF P_CANTIDAD = 0 THEN
            SELECT
                SQ_TT_GEST_DEPENDENCIA.NEXTVAL --la sequencia de la tabla
            INTO
                p_id_salida
            FROM
                dual; 
            ruta := p_ruta_archivo || TO_CHAR(p_id_salida) || chr(47)  ||p_nombre_archivo;
                       
            PKG_INSERTS.PROC_INS_TT_GEST_DEPENDENCIA (
                p_id_gestion_dependencia => p_id_salida,
                p_codigo_dependencia => p_codigo_dependencia,
                p_codigo_presupuestario => p_codigo_presupuestario,
                p_nombre_dependencia => p_nombre_dependencia,
                p_nombre_gafete => p_nombre_gafete,
                p_nombre_abreviado => p_nombre_abreviado,
                p_nombre_documento => p_nombre_documento,
                p_conector => p_conector,
                p_fecha_del_acuerdo => nvl(to_date(p_fecha_del_acuerdo,'DD/MM/YYYY'),null),
                p_fecha_entra_vigencia => nvl(to_date(p_fecha_entra_vigencia,'DD/MM/YYYY'),null),
                p_fecha_anulacion => nvl(to_date(p_fecha_anulacion,'DD/MM/YYYY'),null),
                p_referencia => p_referencia,
                p_funcion_unidad => p_funcion_unidad,
                p_departamento => p_departamento,
                p_municipio => p_municipio,
                p_tipo_area => p_tipo_area,
                p_acuerdo_digital => ruta,
                p_id_tipo_gestion => p_id_tipo_gestion,
                p_id_estado => SIDEP.PKG_CONSTANTES.ESTADO_ACTIVO,
                p_id_source => SIDEP.PKG_CONSTANTES.SOURCE_APP,
                p_ip => p_ip,
                p_id_estado_proceso => SIDEP.PKG_CONSTANTES.ESTADO_ACTIVO,
                p_id_trazabilidad => NULL,
                p_observaciones => NULL,
                p_id_usuario_registro => p_id_usuario_registro,
                p_fecha_registro => SYSDATE,
                p_fecha_publicacion => nvl(to_date(p_fecha_publicacion,'DD/MM/YYYY'),null),
                p_obs_fecha_vigencia => p_obs_fecha_vigencia);
        ELSE
            p_id_salida :=-1;
            p_msj := 'Ya existe una gesti?ara la dependencia nominal';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al crear la solicitud de regularizacion@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;            
    END PROC_INS_REGULA_DEPENDENCIA;   
    
        
    /* Procedimiento para visualiza el pdf de la dependencia*/
    PROCEDURE PROC_VISUALIZAR_ARCHIVO_DEP(
        P_DEPENDENCIA       RH_DEPENDENCIA.DEPENDENCIA%TYPE,
        p_id_salida       OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj             OUT VARCHAR2) AS
    BEGIN
        SELECT 
            DEPENDENCIA,
            ACUERDO_DIGITAL
        INTO
            P_ID_SALIDA,
            P_MSJ
        FROM
            SIDEP.RH_DEPENDENCIA
        WHERE 
            DEPENDENCIA = P_DEPENDENCIA;    
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := 'Problemas Ubicando el archivo'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;          
    END PROC_VISUALIZAR_ARCHIVO_DEP;
    
    /* Procedimiento para visualiza el pdf*/
    PROCEDURE PROC_VISUALIZAR_ARCHIVO(
        P_ID_GEST_DEPENDENCIA       TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2) AS
    BEGIN
        SELECT 
            ID_GESTION_DEPENDENCIA,
            ACUERDO_DIGITAL
        INTO
            P_ID_SALIDA,
            P_MSJ
        FROM
            TT_GEST_DEPENDENCIA
        WHERE 
            ID_GESTION_DEPENDENCIA = P_ID_GEST_DEPENDENCIA;    
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := 'Problemas Ubicando el archivo'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;          
    END PROC_VISUALIZAR_ARCHIVO;    
    
    /*Procedimiento para crear la dependencia*/
    PROCEDURE PROC_CREA_DEPENDENCIA(
        p_codigo_dependencia            RH_DEPENDENCIA.DEPENDENCIA%TYPE,
        p_nombre_dependencia            RH_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE,
        p_nombre_gafete                 RH_DEPENDENCIA.NOMBRE_GAFETE%TYPE,
        p_nombre_abreviado              RH_DEPENDENCIA.NOMBRE_ABREVIADO%TYPE,
        p_fecha_creacion_dependencia    rh_dependencia.fecha_creacion_dependencia%TYPE,
        p_conector_dependencia          RH_DEPENDENCIA.CONECTOR_DEPENDENCIA%TYPE,
        p_nombre_dependencia_documento  RH_DEPENDENCIA.NOMBRE_DEPENDENCIA_DOCUMENTO%TYPE,
        p_funcion_unidad                RH_DEPENDENCIA.FUNCION_UNIDAD%TYPE,
        p_codigo_presupuestario         RH_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE,
        p_referencia                    RH_DEPENDENCIA.REFERENCIA%TYPE,
        p_id_area                       RH_DEPENDENCIA.ID_AREA%TYPE,
        p_acuerdo_digital               RH_DEPENDENCIA.ACUERDO_DIGITAL%TYPE,
        p_departamento                  RH_DIRECCION_DEPENDENCIA.DEPARTAMENTO%TYPE,
        p_municipio                     RH_DIRECCION_DEPENDENCIA.MUNICIPIO%TYPE,
        p_id_usuario_registro           TT_GEST_dEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_fecha_entra_vigencia          TT_GEST_DEPENDENCIA.FECHA_ENTRA_VIGENCIA%TYPE,
        p_ip                            TT_GEST_DEPENDENCIA.IP%TYPE,
        p_fecha_publicacion             RH_DEPENDENCIA.FECHA_PUBLICACION%TYPE,
        p_obs_fecha_vigencia            RH_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                     OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                           OUT VARCHAR2) AS
        p_id_direccion                  RH_DIRECCION_DEPENDENCIA.ID_DIRECCION%TYPE;
        p_id_camara                     RH_DEPENDENCIA.ID_AREA%TYPE;
        p_longitud                      rh_dependencia_gps.longitud%type;
        p_codigo_sgt                    rh_dependencia_gps.codigo_sgt%type;
        p_direccion_simple              rh_dependencia_gps.direccion_simple%type;
        p_telefono                      rh_dependencia_gps.telefono%type;
        p_icono_id                      rh_dependencia_gps.icono_id%type;
        p_materia_id                    rh_dependencia_gps.materia_id%type;
        p_codigo_ine                    rh_dependencia_gps.codigo_ine%type;
        p_iso_3166_2                    rh_dependencia_gps.iso3166_2%type;
        p_iso_3166_3                    rh_dependencia_gps.iso3166_3%type;
        p_latitud                       rh_dependencia_gps.latitud%type;
        p_telefono_completo             rh_dependencia_gps.telefono_completo%type;
        p_despacho                      tt_dependencia_rh_cidej.id_dep_rh_cidej%type;
        p_correo_electronico            tt_dependencia_correo.correo_electronico%type;
        CURSOR C_DEPENDENCIA IS
                SELECT DEPENDENCIA 
                FROM RH_DEPENDENCIA 
                WHERE CODIGO_PRESUPUESTARIO = p_codigo_presupuestario AND DEPENDENCIA_VIGENTE = 'S' AND DEPENDENCIA != p_codigo_dependencia;

        CURSOR C_PLAZA(PRM_DEPENDENCIA in number) is
            SELECT PLAZA, DEPENDENCIA, FECHA_PRESUPUESTADA, PUESTO, STATUS_PLAZA, FECHA_SUPRESION, NUMERO_INDIVIDUAL, PLAZAPERMANENTE, 
                PLANILLA_LISTADO, FIANZA, PLAZA_FUNCIONAL, REFERENCIA
            FROM RH_PLAZA 
            WHERE DEPENDENCIA = PRM_DEPENDENCIA and DECODE(STATUS_PLAZA,'C',NVL(FECHA_SUPRESION,p_fecha_creacion_dependencia),p_fecha_creacion_dependencia) >= p_fecha_creacion_dependencia
            ORDER BY FECHA_PRESUPUESTADA ASC; 
        
        CURSOR DEPENDENCIA_GPS_(PRM_CODIGO_PRE IN NUMBER) IS
            SELECT
                LONGITUD, CODIGO_SGT, DIRECCION_SIMPLE, TELEFONO, ICONO_ID, MATERIA_ID, CODIGO_INE, ISO3166_2, ISO3166_3, LATITUD, TELEFONO_COMPLETO 
            FROM SIDEP.RH_DEPENDENCIA_GPS WHERE DEPENDENCIA = PRM_CODIGO_PRE;
        
        CURSOR DEPENDENCIA_DESPACHO(PRM_CODIGO_PRE IN NUMBER) IS
            SELECT ID_DESPACHO
            FROM tt_dependencia_rh_cidej
            WHERE ID_ESTADO = 1 AND DEPENDENCIA = PRM_CODIGO_PRE;
            
        CURSOR DEPENDENCIA_CORREO(PRM_CODIGO_PRE IN NUMBER) IS  
            SELECT CORREO_ELECTRONICO
            FROM tt_dependencia_correo
            WHERE DEPENDENCIA = PRM_CODIGO_PRE AND ID_ESTADO = 1;
            
        PRM_DEPENDENCIA RH_DEPENDENCIA.DEPENDENCIA%TYPE;
        PRM_NOMBRE_DEPENDENCIA  RH_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE;
        PRMFECHA_CREACION rh_dependencia.fecha_creacion_dependencia%TYPE := p_fecha_creacion_dependencia;
        INTENTOINGRESAPLAZA BOOLEAN := TRUE;
        voSave NUMBER;
    BEGIN
        IF  p_id_area = 2 THEN
            p_id_camara := 0;
        ELSE
            p_id_camara := 99;
        END IF;
        
        SELECT MAX(ID_DIRECCION)+1 INTO p_id_direccion FROM SIDEP.RH_DIRECCION_DEPENDENCIA;
        
        BEGIN
            PKG_INSERTS.PROC_INS_RH_DIRECCION_DEPENDEN (
                p_id_direccion=>p_id_direccion,
                p_pais=>1,
                p_departamento=>p_departamento,
                p_municipio=>p_municipio,
                p_avenida_calle=> null,
                p_apartamento_casa=>null,
                p_zona=>null,
                p_barrio_colonia_caserio=>null,
                p_edificio=>null,
                p_direccion_simple=>null);
        EXCEPTION
            WHEN OTHERS THEN
                p_id_salida :=-1;
                p_msj := '@error al crear la direccion de la dependencia@'
                || ' -CODE-'
                || sqlcode
                || ' -ERROR- '
                || sqlerrm
                || '-ERROR_STACK-'
                || dbms_utility.format_error_stack
                || '-ERROR_BACKTRACE-'
                || dbms_utility.format_error_backtrace;   
        END;
        BEGIN
            PKG_INSERTS.PROC_INS_RH_DEPENDENCIA (
                p_dependencia=>p_codigo_dependencia,
                p_id_direccion=>p_id_direccion,
                p_nombre_dependencia=>p_nombre_dependencia,
                p_nombre_gafete=>p_nombre_gafete,
                p_nombre_abreviado=>p_nombre_abreviado,
                p_clasificacion_dependencia=>0,
                p_dependencia_padre=>null,
                p_materia=>0,
                p_dependencia_vigente=>'S',
                p_fecha_creacion_dependencia=>p_fecha_creacion_dependencia,
                p_fecha_anulacion_dependencia=>null,
                p_telefonos=>null,
                p_conector_dependencia=>p_conector_dependencia,
                p_nombre_dependencia_documento=>p_nombre_dependencia_documento,
                p_unidad_presupuestaria=>'S', 
                p_funcion_unidad=>p_funcion_unidad,
                p_codigo_presupuestario=>p_codigo_presupuestario,
                p_referencia=>p_referencia,
                p_usuario_creador=>USER,
                p_fecha_modificacion=>SYSDATE,
                p_usuario_modifico=>null,
                p_id_camara=>p_id_camara,
                p_id_competencia=>0,
                p_id_especialidad=>0,
                p_id_area=>p_id_area,
                p_nombre_dependencia_uci=>null,
                p_id_igss=>null,
                p_acuerdo_digital=>p_acuerdo_digital,
                p_fecha_entra_vigencia=>p_fecha_entra_vigencia,
                p_fecha_publicacion => p_fecha_publicacion,
                p_obs_fecha_vigencia => p_obs_fecha_vigencia);
        EXCEPTION
            WHEN OTHERS THEN
                p_id_salida :=-1;
                p_msj := '@error al crear la nueva dependencia@'
                || ' -CODE-'
                || sqlcode
                || ' -ERROR- '
                || sqlerrm
                || '-ERROR_STACK-'
                || dbms_utility.format_error_stack
                || '-ERROR_BACKTRACE-'
                || dbms_utility.format_error_backtrace;   
        END;
            /* Si la depependencia tiene plazas las mueve al codigo de la nueva dependencia*/
            OPEN C_DEPENDENCIA;
                FETCH C_DEPENDENCIA INTO PRM_DEPENDENCIA;
                IF (C_DEPENDENCIA%FOUND) THEN
                    FOR J IN C_PLAZA(PRM_DEPENDENCIA) 
                    LOOP
                        BEGIN
                            INTENTOINGRESAPLAZA := TRUE;
                            WHILE (INTENTOINGRESAPLAZA) 
                            LOOP
                                BEGIN
                                    INSERT INTO RH_PLAZA (
                                        PLAZA, DEPENDENCIA, PUESTO, STATUS_PLAZA, FECHA_PRESUPUESTADA, FECHA_SUPRESION, NUMERO_INDIVIDUAL, PLAZAPERMANENTE, PLANILLA_LISTADO,
                                        FIANZA, PLAZA_FUNCIONAL, REFERENCIA)
                                    VALUES (
                                        J.PLAZA, p_codigo_dependencia, J.PUESTO, J.STATUS_PLAZA, PRMFECHA_CREACION, DECODE(J.STATUS_PLAZA, 'C', NVL(J.FECHA_SUPRESION, p_fecha_creacion_dependencia), NULL), 
                                        J.NUMERO_INDIVIDUAL, J.PLAZAPERMANENTE, J.PLANILLA_LISTADO, J.FIANZA, J.PLAZA_FUNCIONAL, p_referencia);
                                
                                    INTENTOINGRESAPLAZA := FALSE;
                                EXCEPTION 
                                    WHEN DUP_VAL_ON_INDEX THEN
                                        PRMFECHA_CREACION := PRMFECHA_CREACION+1;
                                    WHEN OTHERS THEN
                                        p_id_salida :=-1;
                                        p_msj := '@error al reclasificar la(s) plaza(s)@'
                                        || ' -CODE-'
                                        || sqlcode
                                        || ' -ERROR- '
                                        || sqlerrm
                                        || '-ERROR_STACK-'
                                        || dbms_utility.format_error_stack
                                        || '-ERROR_BACKTRACE-'
                                        || dbms_utility.format_error_backtrace;    
                                END;
                            END LOOP;
                            --Si las plazas estan ocpuadas inserta el movimiento 
                            BEGIN
                                --PRECLASIFICAR_PLAZA(PRM_DEPENDENCIA, J.FECHA_PRESUPUESTADA, p_codigo_dependencia, PRMFECHA_CREACION, J.PLAZA, p_fecha_creacion_dependencia, p_referencia, 14, voSave/*Cambio de nombre dependencia*/);
                                --DEJAR COMENTADA LA LINEA DE ARRIBA 
                                NULL;
                            EXCEPTION
                                WHEN OTHERS THEN
                                        p_id_salida :=-1;
                                        p_msj := '@error al reclasificar la(s) plaza(s)@'
                                        || ' -CODE-'
                                        || sqlcode
                                        || ' -ERROR- '
                                        || sqlerrm
                                        || '-ERROR_STACK-'
                                        || dbms_utility.format_error_stack
                                        || '-ERROR_BACKTRACE-'
                                        || dbms_utility.format_error_backtrace;
                            END;
                        END;    
                    END LOOP;
                    BEGIN
                        /*INSERT INTO SIDEP.RH_PARTIDA_DEPENDENCIA(
                            TIPO_PLANILLA, PAIS, DEPARTAMENTO, DEPENDENCIA, NUMERO_PARTIDA, FINANCIAMIENTO_EXTERNO, FECHA_VIGENCIA, USUARIO_MODIFICO, FECHA_MODIFICACION)
                        SELECT
                            B.TIPO_PLANILLA, B.PAIS, B.DEPARTAMENTO, p_codigo_dependencia, B.NUMERO_PARTIDA, B.FINANCIAMIENTO_EXTERNO, p_fecha_creacion_dependencia FECHA_VIGENCIA, USER USUARIO_MODIFICO,
                            SYSDATE FECHA_MODIFICACION
                        FROM RH_PARTIDA_DEPENDENCIA B
                        WHERE B.DEPENDENCIA = PRM_DEPENDENCIA AND 
                            NOT EXISTS (
                                SELECT 'X' FROM RH_PARTIDA_DEPENDENCIA A
                                WHERE A.DEPENDENCIA = p_codigo_dependencia AND A.TIPO_PLANILLA = B.TIPO_PLANILLA);
                       
                        UPDATE RH_DEPENDENCIA SET DEPENDENCIA_VIGENTE = 'N', FECHA_ANULACION_DEPENDENCIA = p_fecha_creacion_dependencia-1
                        WHERE DEPENDENCIA = PRM_DEPENDENCIA;  */
                        --NO QUITAR ESTA LINEA   
                        NULL;                            
                    EXCEPTION
                        WHEN OTHERS THEN
                            p_id_salida :=-1;
                            p_msj := '@error al crear la direccion de la dependencia@'
                            || ' -CODE-'
                            || sqlcode
                            || ' -ERROR- '
                            || sqlerrm
                            || '-ERROR_STACK-'
                            || dbms_utility.format_error_stack
                            || '-ERROR_BACKTRACE-'
                            || dbms_utility.format_error_backtrace;                    
                    END;                                    
                    
                END IF;
            CLOSE C_DEPENDENCIA;
            
            /*Realiza el proceso de duplicar el registro de gps cuando se regulariza y cambia de codio de dependencia*/
            OPEN DEPENDENCIA_GPS_(PRM_DEPENDENCIA);
                FETCH DEPENDENCIA_GPS_ INTO p_longitud, p_codigo_sgt, p_direccion_simple, p_telefono, p_icono_id, p_materia_id, p_codigo_ine, p_iso_3166_2, p_iso_3166_3, p_latitud, p_telefono_completo; 
                IF DEPENDENCIA_GPS_%FOUND THEN
                    BEGIN    
                        PKG_INSERTS.PROC_INS_RH_DEPENDENCIA_GPS (
                            p_dependencia=> p_codigo_dependencia,
                            p_longitud=> p_longitud,
                            p_crea_fecha=> sysdate,
                            p_crea_empleado => p_id_usuario_registro,
                            p_baja_fecha => NULL ,
                            p_baja_empleado => NULL,
                            p_estado => PKG_CONSTANTES.estado_activo,
                            p_codigo_sgt => p_codigo_sgt,
                            p_direccion_simple => p_direccion_simple,
                            p_telefono => p_telefono,
                            p_icono_id => p_icono_id,
                            p_materia_id => p_materia_id,
                            p_codigo_ine => p_codigo_ine,
                            p_iso3166_2 => p_iso_3166_2,
                            p_iso3166_3 => p_iso_3166_3,
                            p_latitud => p_latitud,
                            p_telefono_completo => p_telefono_completo);
                            
                            UPDATE SIDEP.RH_DEPENDENCIA_GPS SET
                                ESTADO = 0, BAJA_FECHA = SYSDATE, BAJA_EMPLEADO = p_id_usuario_registro
                            WHERE
                                DEPENDENCIA = PRM_DEPENDENCIA;
                    EXCEPTION                            
                        WHEN OTHERS THEN
                            p_id_salida :=-1;
                            p_msj := '@error al reclasificar la(s) plaza(s)@'
                            || ' -CODE-'
                            || sqlcode
                            || ' -ERROR- '
                            || sqlerrm
                            || '-ERROR_STACK-'
                            || dbms_utility.format_error_stack
                            || '-ERROR_BACKTRACE-'
                            || dbms_utility.format_error_backtrace;  
                    END;                            
                END IF;
            CLOSE DEPENDENCIA_GPS_;     
            /*Realiza el proceso de duplicar el registro de dependencia despacho cuando se regulariza y cambia de codio de dependencia*/
            OPEN DEPENDENCIA_DESPACHO(PRM_DEPENDENCIA);
                FETCH DEPENDENCIA_DESPACHO INTO p_despacho;
                IF DEPENDENCIA_DESPACHO%FOUND THEN
                    BEGIN
                        PROC_INS_TT_DEP_RH_CIDEJ(
                            p_id_depen_RH_CIDEJ=> null,
                            p_dependencia=> p_codigo_dependencia,
                            p_id_despacho=> p_despacho,
                            p_id_usuario_registro=> p_id_usuario_registro,
                            p_ip=>p_ip,
                            p_id_salida=> p_id_salida,
                            p_msj =>p_msj);
                            
                            UPDATE SIDEP.TT_DEPENDENCIA_RH_CIDEJ SET
                                ID_ESTADO = 2, FECHA_REGISTRO = SYSDATE, IP = P_IP, OBSERVACIONES = 'DEPENDENCIA REGULARIZADA'
                            where
                                DEPENDENCIA = PRM_DEPENDENCIA;
                    EXCEPTION
                        WHEN OTHERS THEN
                            p_id_salida :=-1;
                            p_msj := '@error al reclasificar la(s) plaza(s)@'
                            || ' -CODE-'
                            || sqlcode
                            || ' -ERROR- '
                            || sqlerrm
                            || '-ERROR_STACK-'
                            || dbms_utility.format_error_stack
                            || '-ERROR_BACKTRACE-'
                            || dbms_utility.format_error_backtrace;
                    END;                            
                END IF;
            CLOSE DEPENDENCIA_DESPACHO;
            
            /*Realiza el proceso de duplicar el registro de dependencia correo cuando se regulariza y cambia de codio de dependencia*/
            OPEN DEPENDENCIA_CORREO(PRM_DEPENDENCIA);
                FETCH DEPENDENCIA_CORREO INTO p_correo_electronico;
                IF DEPENDENCIA_CORREO%FOUND THEN
                    BEGIN
                        PROC_INS_TT_DEP_CORREO(
                            p_id_dependencia_correo=> null,
                            p_dependencia=> p_codigo_dependencia,
                            p_correo_electronico=> p_correo_electronico,
                            p_id_usuario_registro=> p_id_usuario_registro,
                            p_ip=>p_ip,
                            p_id_salida=> p_id_salida,
                            p_msj =>p_msj);
                            
                            UPDATE SIDEP.TT_DEPENDENCIA_CORREO SET
                                ID_ESTADO = 2, FECHA_REGISTRO = SYSDATE, IP = P_IP, OBSERVACIONES = 'DEPENDENCIA REGULARIZADA'
                            where
                                DEPENDENCIA = PRM_DEPENDENCIA;
                    EXCEPTION
                        WHEN OTHERS THEN
                            p_id_salida :=-1;
                            p_msj := '@error al reclasificar la(s) plaza(s)@'
                            || ' -CODE-'
                            || sqlcode
                            || ' -ERROR- '
                            || sqlerrm
                            || '-ERROR_STACK-'
                            || dbms_utility.format_error_stack
                            || '-ERROR_BACKTRACE-'
                            || dbms_utility.format_error_backtrace;
                    END;
                END IF;
            CLOSE DEPENDENCIA_DESPACHO;
            p_id_salida := p_codigo_dependencia;
            p_msj := 'ok';
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al realizar el proceso de confirmacin de la dependencia@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;                 
    END PROC_CREA_DEPENDENCIA;                         
     
    PROCEDURE PROC_PROCESA_SOL_CREACION(
        p_id_gestion_dependencia            TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_observaciones                     TT_GEST_DEPENDENCIA.OBSERVACIONES%TYPE,
        p_ip                                TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro               TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_usuario                           VARCHAR2,
        p_id_salida                         OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                               OUT VARCHAR2) AS
        p_codigo_dependencia                RH_DEPENDENCIA.DEPENDENCIA%TYPE;
        p_nombre_dependencia                RH_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE;
        p_nombre_gafete                     RH_DEPENDENCIA.NOMBRE_GAFETE%TYPE;
        p_nombre_abreviado                  RH_DEPENDENCIA.NOMBRE_ABREVIADO%TYPE;
        p_fecha_del_acuerdo                 RH_DEPENDENCIA.FECHA_CREACION_DEPENDENCIA%TYPE;
        p_fecha_entra_vigencia              RH_DEPENDENCIA.FECHA_ENTRA_VIGENCIA%TYPE;
        p_conector                          RH_DEPENDENCIA.CONECTOR_DEPENDENCIA%TYPE;
        p_nombre_documento                  RH_DEPENDENCIA.NOMBRE_DEPENDENCIA_DOCUMENTO%TYPE;
        p_funcion_unidad                    RH_DEPENDENCIA.FUNCION_UNIDAD%TYPE;
        p_codigo_presupuestario             RH_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE;
        p_referencia                        RH_DEPENDENCIA.REFERENCIA%TYPE;
        p_tipo_area                         RH_DEPENDENCIA.ID_AREA%TYPE;
        p_acuerdo_digital                   RH_DEPENDENCIA.ACUERDO_DIGITAL%TYPE;
        p_departamento                      RH_DIRECCION_DEPENDENCIA.DEPARTAMENTO%TYPE;
        p_municipio                         RH_DIRECCION_DEPENDENCIA.MUNICIPIO%TYPE;
        p_fecha_publicacion                 RH_DEPENDENCIA.FECHA_PUBLICACION%type;
        p_obs_fecha_vigencia                RH_DEPENDENCIA.OBS_FECHA_VIGENCIA%type;
    BEGIN
        SELECT 
            CODIGO_DEPENDENCIA, CODIGO_PRESUPUESTARIO, NOMBRE_DEPENDENCIA, NOMBRE_GAFETE, NOMBRE_ABREVIADO,
            NOMBRE_DOCUMENTO, CONECTOR, FECHA_DEL_ACUERDO, FECHA_ENTRA_VIGENCIA, REFERENCIA,
            FUNCION_UNIDAD, DEPARTAMENTO, MUNICIPIO, TIPO_AREA, ACUERDO_DIGITAL, FECHA_PUBLICACION, OBS_FECHA_VIGENCIA
        INTO
            p_codigo_dependencia, p_codigo_presupuestario, p_nombre_dependencia, p_nombre_gafete, p_nombre_abreviado,
            p_nombre_documento, p_conector, p_fecha_del_acuerdo, p_fecha_entra_vigencia, p_referencia, 
            p_funcion_unidad, p_departamento, p_municipio, p_tipo_area, p_acuerdo_digital, p_fecha_publicacion, p_obs_fecha_vigencia
        FROM TT_GEST_DEPENDENCIA
        WHERE 
            ID_GESTION_DEPENDENCIA = p_id_gestion_dependencia;
        
        PROC_CREA_DEPENDENCIA(
            p_codigo_dependencia=>p_codigo_dependencia,
            p_nombre_dependencia=>p_nombre_dependencia,
            p_nombre_gafete=>p_nombre_gafete,
            p_nombre_abreviado=>p_nombre_abreviado,
            p_fecha_creacion_dependencia=>p_fecha_del_acuerdo,
            p_conector_dependencia=>p_conector,
            p_nombre_dependencia_documento=>p_nombre_documento,
            p_funcion_unidad=>p_funcion_unidad,
            p_codigo_presupuestario=>p_codigo_presupuestario,
            p_referencia=>p_referencia,
            p_id_area=>p_tipo_area,
            p_acuerdo_digital=>p_acuerdo_digital,
            p_departamento=>p_departamento,
            p_municipio=>p_municipio,
            p_id_usuario_registro=>p_id_usuario_registro,
            p_fecha_entra_vigencia=>p_fecha_entra_vigencia,
            p_ip=>p_ip,
            p_fecha_publicacion=>p_fecha_publicacion,           
            p_obs_fecha_vigencia=>p_obs_fecha_vigencia,
            p_id_salida=>p_id_salida,
            p_msj=>p_msj
        );
        UPDATE SIDEP.TT_GEST_DEPENDENCIA SET
            OBSERVACIONES = p_observaciones,
            ID_ESTADO_PROCESO = PKG_CONSTANTES.ATENDIDA,
            IP = p_ip,
            ID_USUARIO_REGISTRO = p_id_usuario_registro
        WHERE ID_GESTION_DEPENDENCIA = p_id_gestion_dependencia;
       
        p_id_salida := p_codigo_dependencia;
        p_msj := 'ok';
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al procesar la creaci?e la dependencia@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;    
    END PROC_PROCESA_SOL_CREACION;
    
    PROCEDURE PROC_RECHAZA_SOLOLICITUD(
        p_id_gestion_dependencia    TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_observaciones             TT_GEST_DEPENDENCIA.OBSERVACIONES%TYPE,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                       OUT VARCHAR2) AS
    BEGIN
        UPDATE TT_GEST_DEPENDENCIA
        SET
            ID_ESTADO_PROCESO = PKG_CONSTANTES.RECHAZADA,
            OBSERVACIONES = p_observaciones,
            IP = P_IP,
            ID_USUARIO_REGISTRO = p_id_usuario_registro,
            FECHA_REGISTRO = SYSDATE
        WHERE
            ID_GESTION_DEPENDENCIA = p_id_gestion_dependencia;
        p_id_salida := p_id_gestion_dependencia;
        p_msj := 'ok';
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al rechazar la dependencia@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;          
    END PROC_RECHAZA_SOLOLICITUD;

    /*Proceso para dar de baja a una dependencia nominal*/
    PROCEDURE PROC_BAJA_DEPENDENCIA(
        p_id_gestion_dependencia    tt_gest_dependencia.id_gestion_dependencia%type,
        p_observaciones             tt_gest_dependencia.observaciones%type,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_usuario                           VARCHAR2,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                       OUT VARCHAR2) AS
        p_plaza number;
        p_id_codigo_dependencia     tt_gest_dependencia.codigo_dependencia%type;
        p_id_codigo_presupuestario  tt_gest_dependencia.codigo_presupuestario%type;
        p_referencia                tt_gest_dependencia.referencia%type;
        p_fecha_anulacion           tt_gest_dependencia.fecha_anulacion%type;
        p_acuerdo_digital           tt_gest_dependencia.acuerdo_digital%type;
    BEGIN
        SELECT 
            CODIGO_DEPENDENCIA, CODIGO_PRESUPUESTARIO, FECHA_ANULACION, REFERENCIA, ACUERDO_DIGITAL
        INTO
            p_id_codigo_dependencia, p_id_codigo_presupuestario, p_fecha_anulacion, p_referencia, p_acuerdo_digital
        FROM
            SIDEP.TT_GEST_DEPENDENCIA 
        WHERE 
            ID_GESTION_DEPENDENCIA =  p_id_gestion_dependencia;
        /*Verifica que no hayan plazas en la dependencia*/       
        SELECT COUNT(*) INTO P_PLAZA
        FROM SIDEP.RH_PLAZA 
        WHERE DEPENDENCIA = p_id_codigo_dependencia AND
            STATUS_PLAZA <> 'C';
        
        IF P_PLAZA = 0 THEN
            UPDATE RH_DEPENDENCIA 
                SET DEPENDENCIA_VIGENTE = 'N', FECHA_ANULACION_DEPENDENCIA = P_FECHA_ANULACION, 
                    REFERENCIA = P_REFERENCIA, FECHA_MODIFICACION = SYSDATE , USUARIO_MODIFICO = P_USUARIO,
                    ACUERDO_DIGITAL = p_acuerdo_digital
            WHERE
                DEPENDENCIA = P_ID_CODIGO_DEPENDENCIA; 
                
            UPDATE SIDEP.TT_GEST_DEPENDENCIA SET
                OBSERVACIONES = p_observaciones,
                ID_ESTADO_PROCESO = PKG_CONSTANTES.ATENDIDA,
                IP = p_ip,
                ID_USUARIO_REGISTRO = p_id_usuario_registro,
                ACUERDO_DIGITAL = p_acuerdo_digital
            WHERE ID_GESTION_DEPENDENCIA = p_id_gestion_dependencia; 
            
            UPDATE SIDEP.RH_DEPENDENCIA_GPS SET
                ESTADO = 0, BAJA_FECHA = SYSDATE, BAJA_EMPLEADO = p_id_usuario_registro
            WHERE
                DEPENDENCIA = p_id_codigo_dependencia; 
            p_id_salida := p_id_gestion_dependencia;
            p_msj := 'ok';
        ELSE
            p_id_salida := -1;
            p_msj := 'Dependencia con plazas disponibles u ocupadas';    
        END IF;
        
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al procesar la baja de la dependencia@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;   
    END PROC_BAJA_DEPENDENCIA;    
    
    
    /*Procedimiento solicitar la actualizacion a la dependencia*/
    PROCEDURE PROC_ACT_TT_GEST_DEPENDENCIA(
        p_codigo_dependencia            TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_conector_dependencia          tt_gest_dependencia.conector%type,
        p_funcion_unidad                tt_gest_dependencia.funcion_unidad%type,
        p_referencia                    tt_gest_dependencia.referencia%type,
        p_id_area                       tt_gest_dependencia.tipo_area%type,
        p_fecha_creacion_dependencia    varchar2,
        p_fecha_entra_vigencia          varchar2,
        p_id_usuario_registro           TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo                VARCHAR2,
        p_ruta_archivo                  VARCHAR2,
        p_ip                            TT_GEST_DEPENDENCIA.IP%TYPE,
        p_fecha_publicacion             varchar2,
        p_obs_fecha_vigencia            TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                     OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                           OUT VARCHAR2)
    AS 
        ruta TT_GEST_DEPENDENCIA.ACUERDO_DIGITAL%TYPE;
        p_nombre_dependencia            TT_GEST_DEPENDENCIA.NOMBRE_DEPENDENCIA%TYPE;
        p_codigo_presupuestario         TT_GEST_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE;
        p_nombre_gafete  varchar(1024);
        p_nombre_abreviado varchar(1024);
        p_nombre_documento varchar(1024);
        p_dep number;
        p_mun number;
    BEGIN
        p_id_salida := SQ_TT_GEST_DEPENDENCIA.NEXTVAL;
        SELECT  
            NOMBRE_DEPENDENCIA, NOMBRE_GAFETE, NOMBRE_ABREVIADO, NOMBRE_DEPENDENCIA_DOCUMENTO, CODIGO_PRESUPUESTARIO, DD.DEPARTAMENTO, DD.MUNICIPIO
        INTO 
            p_nombre_dependencia, p_nombre_gafete, p_nombre_abreviado, p_nombre_documento, p_codigo_presupuestario, p_dep, p_mun
        FROM SIDEP.RH_DEPENDENCIA D INNER JOIN SIDEP.RH_DIRECCION_DEPENDENCIA DD ON D.ID_DIRECCION = DD.ID_DIRECCION
        WHERE DEPENDENCIA = p_codigo_dependencia;   
        ruta := p_ruta_archivo || TO_CHAR(p_id_salida) || chr(47)  ||p_nombre_archivo;
        
        PKG_INSERTS.PROC_INS_TT_GEST_DEPENDENCIA (
            p_id_gestion_dependencia => p_id_salida,
            p_codigo_dependencia => p_codigo_dependencia,
            p_codigo_presupuestario => p_codigo_presupuestario,
            p_nombre_dependencia => p_nombre_dependencia,
            p_nombre_gafete => p_nombre_gafete,
            p_nombre_abreviado => p_nombre_abreviado,
            p_nombre_documento => p_nombre_documento,
            p_conector => p_conector_dependencia,
            p_fecha_del_acuerdo => nvl(to_date(p_fecha_creacion_dependencia,'DD/MM/YYYY'),null),
            p_fecha_entra_vigencia => nvl(to_date(p_fecha_entra_vigencia,'DD/MM/YYYY'),null),
            p_fecha_anulacion => null,
            p_referencia => p_referencia,
            p_funcion_unidad => p_funcion_unidad,
            p_departamento => p_dep,
            p_municipio => p_mun,
            p_tipo_area => p_id_area,
            p_acuerdo_digital => ruta,
            p_id_tipo_gestion => PKG_CONSTANTES.ACTUALIZA_DEPENDENCIA,
            p_id_estado => SIDEP.PKG_CONSTANTES.ESTADO_ACTIVO,
            p_id_source => SIDEP.PKG_CONSTANTES.SOURCE_APP,
            p_ip => p_ip,
            p_id_estado_proceso => SIDEP.PKG_CONSTANTES.SOLICITUD,
            p_id_trazabilidad => null,
            p_observaciones => null,
            p_id_usuario_registro => p_id_usuario_registro,
            p_fecha_registro => SYSDATE,
            p_fecha_publicacion => nvl(to_date(p_fecha_publicacion,'DD/MM/YYYY'),null),
            p_obs_fecha_vigencia => p_obs_fecha_vigencia);         
        
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error la actualizacion de la dependencia@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;            
    END PROC_ACT_TT_GEST_DEPENDENCIA;                
    
    /*Procediminto para dar modificar la solicitud de actualizar de una dependencia*/
    PROCEDURE PROC_MOD_ACT_GEST_DEPENDENCIA(
        p_id_gestion_dependencia        TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_conector_dependencia          tt_gest_dependencia.conector%type,
        p_funcion_unidad                tt_gest_dependencia.funcion_unidad%type,
        p_referencia                    tt_gest_dependencia.referencia%type,
        p_id_area                       tt_gest_dependencia.tipo_area%type,
        p_fecha_creacion_dependencia    varchar2,
        p_fecha_entra_vigencia          varchar2,
        p_id_usuario_registro           TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_nombre_archivo                VARCHAR2,
        p_ruta_archivo                  VARCHAR2,
        p_ip                            TT_GEST_DEPENDENCIA.IP%TYPE,
        p_fecha_publicacion             varchar2,
        p_obs_fecha_vigencia            TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
        p_id_salida                     OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                           OUT VARCHAR2)
    AS 
        ruta TT_GEST_DEPENDENCIA.ACUERDO_DIGITAL%TYPE;
    BEGIN
        
        ruta := p_ruta_archivo || TO_CHAR(p_id_gestion_dependencia) || chr(47)  ||p_nombre_archivo;
        p_id_salida := p_id_gestion_dependencia;
        
        UPDATE TT_GEST_DEPENDENCIA
        SET
            FECHA_DEL_ACUERDO =         to_date(p_fecha_creacion_dependencia,'dd/mm/yyyy'),
            fecha_entra_vigencia =      to_date(p_fecha_entra_vigencia,'dd/mm/yyyy'),
            CONECTOR =                  p_conector_dependencia,    
            FUNCION_UNIDAD =            p_funcion_unidad, 
            REFERENCIA =                p_referencia,
            ID_USUARIO_REGISTRO =       p_id_usuario_registro,
            ACUERDO_DIGITAL =           ruta,
            IP =                        p_ip,
            ID_ESTADO_PROCESO =         PKG_CONSTANTES.SOLICITUD,
            FECHA_PUBLICACION =         to_date(P_fecha_publicacion,'dd/mm/yyyy'),
            obs_fecha_vigencia =        p_obs_fecha_vigencia
        WHERE
            ID_GESTION_DEPENDENCIA = p_id_gestion_dependencia;              
        
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al modificar la solicitud de actualizar@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;            
    END PROC_MOD_ACT_GEST_DEPENDENCIA;                
    
    PROCEDURE PROC_ACTUALIZA_DEPENNOMINAL(
        p_id_gest_dependencia           tt_gest_dependencia.id_gestion_dependencia%type,
        p_observaciones                   tt_gest_dependencia.observaciones%type,
        p_id_usuario_registro           tt_gest_dependencia.id_usuario_registro%type,
        p_ip                            tt_gest_dependencia.ip%type,
        p_usuario                       varchar2,
        p_id_salida                     OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                           OUT VARCHAR2) AS
        p_codigo_dependencia            tt_gest_dependencia.codigo_dependencia%type;
        p_conector_dependencia          tt_gest_dependencia.conector%type;
        p_funcion_unidad                tt_gest_dependencia.funcion_unidad%type;
        p_referencia                    tt_gest_dependencia.referencia%type;
        p_id_area                       tt_gest_dependencia.tipo_area%type;
        p_acuerdo_digital               tt_gest_dependencia.acuerdo_digital%type;
        p_fecha_creacion_dependencia    tt_gest_dependencia.fecha_del_acuerdo%type;
        p_fecha_entra_vigencia          tt_gest_dependencia.fecha_entra_vigencia%type;
        p_fecha_publicacion             tt_gest_dependencia.fecha_publicacion%type;
        p_obs_fecha_vigencia            tt_gest_dependencia.obs_fecha_vigencia%type;
    BEGIN
        SELECT 
            CODIGO_DEPENDENCIA,CONECTOR,FECHA_DEL_ACUERDO,FECHA_ENTRA_VIGENCIA,
            REFERENCIA,FUNCION_UNIDAD,TIPO_AREA,ACUERDO_DIGITAL, FECHA_PUBLICACION, OBS_FECHA_VIGENCIA
        INTO
            p_codigo_dependencia, p_conector_dependencia,p_fecha_creacion_dependencia,p_fecha_entra_vigencia,
            p_referencia, p_funcion_unidad,  p_id_area, p_acuerdo_digital, p_fecha_publicacion, p_obs_fecha_vigencia
        FROM TT_GEST_DEPENDENCIA
        WHERE 
            ID_GESTION_DEPENDENCIA = p_id_gest_dependencia;
        UPDATE RH_DEPENDENCIA SET
            CONECTOR_DEPENDENCIA = p_conector_dependencia, FUNCION_UNIDAD = p_funcion_unidad, REFERENCIA = p_referencia,
            ID_AREA = p_id_area, ACUERDO_DIGITAL = p_acuerdo_digital, FECHA_CREACION_DEPENDENCIA = p_fecha_creacion_dependencia,
            FECHA_ENTRA_VIGENCIA = p_fecha_entra_vigencia, USUARIO_CREADOR = p_usuario, FECHA_MODIFICACION = SYSDATE, 
            FECHA_PUBLICACION = P_fecha_publicacion, OBS_FECHA_VIGENCIA = p_obs_fecha_vigencia
        WHERE
            DEPENDENCIA = p_codigo_dependencia;
        
        UPDATE TT_GEST_DEPENDENCIA SET
            ID_USUARIO_REGISTRO = p_id_usuario_registro,
            FECHA_REGISTRO = SYSDATE,
            ID_ESTADO_PROCESO = PKG_CONSTANTES.ATENDIDA,
            OBSERVACIONES = p_observaciones,
            IP = p_ip
        WHERE
            ID_GESTION_DEPENDENCIA = p_id_gest_dependencia;
        p_id_salida := p_id_gest_dependencia;
        p_msj := 'ok';
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al procesar la actualizacion de la dependencia@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;  
    END PROC_ACTUALIZA_DEPENNOMINAL;
    
    PROCEDURE PROC_INS_TT_DEP_CORREO(
        p_id_dependencia_correo     tt_dependencia_correo.id_dependencia_correo%TYPE,
        p_dependencia               tt_dependencia_correo.dependencia%TYPE,
        p_correo_electronico        tt_dependencia_correo.correo_electronico%TYPE,
        p_id_usuario_registro       tt_dependencia_correo.id_usuario_registro%type,
        p_ip                        tt_dependencia_correo.ip%type,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                       OUT VARCHAR2)
    IS
    BEGIN
        if p_id_dependencia_correo is null then
            SELECT
                SQ_TT_DEPENDENCIA_CORREO.NEXTVAL --la sequencia de la tabla
            INTO
                p_id_salida
            FROM
                dual;
            PKG_INSERTS.proc_ins_tt_dependencia_correo (
                p_id_dependencia_correo=> p_id_salida,
                p_dependencia=>p_dependencia,
                p_correo_electronico=>p_correo_electronico,
                p_id_estado=>PKG_CONSTANTES.ESTADO_ACTIVO,
                p_id_source=>PKG_CONSTANTES.SOURCE_APP,
                p_id_usuario_registro=>p_id_usuario_registro,
                p_fecha_registro=> SYSDATE,
                p_observaciones=>null,
                p_id_trazabilidad=>null,
                p_ip=>p_ip);
                p_msj := 'ok';
        ELSE
            UPDATE tt_dependencia_correo
                SET 
                    CORREO_ELECTRONICO = p_correo_electronico, 
                    ID_USUARIO_REGISTRO = p_id_usuario_registro, 
                    ip = p_ip, 
                    FECHA_REGISTRO = SYSDATE
            WHERE
                id_dependencia_correo = p_id_dependencia_correo;
            p_id_salida := p_id_dependencia_correo;    
            p_msj := 'ok';
        END IF;
          
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error guardar la direccion de la dependencia@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;             
    END PROC_INS_TT_DEP_CORREO;
    
    PROCEDURE PROC_GET_PLAZAS_DEPENDENCIA(
        p_codigo_dependencia        TT_GEST_DEPENDENCIA.CODIGO_DEPENDENCIA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                       OUT VARCHAR2) IS
    BEGIN
        /*Verifica que no hayan plazas en la dependencia*/       
        SELECT COUNT(*) INTO p_id_salida
        FROM SIDEP.RH_PLAZA 
        WHERE DEPENDENCIA = p_codigo_dependencia AND
            STATUS_PLAZA <> 'C';
        IF p_id_salida > 0 THEN
            p_id_salida := -1;
            p_msj := 'No se puede dar de baja a esta dependencia debido a que tiene plazas activas o disponibles';
        else
            p_msj := 'ok';
        END IF;  
        
    END PROC_GET_PLAZAS_DEPENDENCIA;
    
    PROCEDURE PROC_INS_TT_DEP_RH_CIDEJ(
        p_id_depen_rh_cidej         tt_dependencia_rh_cidej.id_dep_rh_cidej%TYPE,
        p_dependencia               tt_dependencia_rh_cidej.dependencia%TYPE,
        p_id_despacho               tt_dependencia_rh_cidej.id_despacho%type,
        p_id_usuario_registro       tt_dependencia_rh_cidej.id_usuario_registro%type,
        p_ip                        tt_dependencia_rh_cidej.ip%type,
        p_id_salida                 OUT tt_dependencia_rh_cidej.id_dep_rh_cidej%TYPE,
        p_msj                       OUT VARCHAR2)
    IS
    BEGIN
        if p_id_depen_rh_cidej is null then
            SELECT
                SQ_TT_DEPENDENCIA_RH_CIDEJ.NEXTVAL --la sequencia de la tabla
            INTO
                p_id_salida
            FROM
                dual;
            PKG_INSERTS.proc_ins_tt_dependencia_rh_cid (
                p_id_dep_rh_cidej=> p_id_salida,
                p_dependencia=>p_dependencia,
                p_id_despacho=>p_id_despacho,
                p_id_estado=>PKG_CONSTANTES.ESTADO_ACTIVO,
                p_id_source=>PKG_CONSTANTES.SOURCE_APP,
                p_id_usuario_registro=>p_id_usuario_registro,
                p_fecha_registro=> SYSDATE,
                p_observaciones=>null,
                p_id_trazabilidad=>null,
                p_ip=>p_ip);
            p_msj := 'ok';
        else
            UPDATE tt_dependencia_rh_cidej
                SET id_Despacho = p_id_despacho, ip = p_ip, FECHA_REGISTRO = SYSDATE, 
                    id_usuario_registro = p_id_usuario_registro
            WHERE
                id_dep_rh_cidej = p_id_depen_RH_CIDEJ;
            p_id_salida := p_id_depen_RH_CIDEJ;
            p_msj := 'ok';
        end if;
          
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al crear la dependencia y codigo despacho@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;             
    END PROC_INS_TT_DEP_RH_CIDEJ;
    
    
    PROCEDURE PROC_VERIFICA_DEPEN_PLAZA(
        p_codig_dependencia     rh_dependencia.dependencia%type,
        p_id_salida             OUT rh_dependencia.dependencia%type,
        p_msj                   OUT varchar2) IS
        P_PLAZA                 NUMBER;
    BEGIN
        SELECT COUNT(*) INTO P_PLAZA
        FROM SIDEP.RH_PLAZA 
        WHERE DEPENDENCIA = p_codig_dependencia AND
            STATUS_PLAZA <> 'C';  
        IF P_PLAZA = 0 THEN
            p_id_salida := P_PLAZA;
            p_msj := 'ok';
        ELSE
             p_id_salida := -1;
            p_msj := 'No puede solicitar la baja de la dependencia debido a que cuenta con plazas disponibles u ocupadas';
        END IF;
    END PROC_VERIFICA_DEPEN_PLAZA; 
     
     /*Valida que el codigo de la despacho no este duplicado*/
    PROCEDURE PROC_VALIDA_DESPACHO(
        P_ID_DESPACHO TT_DEPENDENCIA_RH_CIDEJ.ID_DESPACHO%TYPE, 
        p_id_salida OUT NUMBER, 
        p_msj OUT VARCHAR2)
    AS
        P_VALIDA NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO P_VALIDA FROM TT_DEPENDENCIA_RH_CIDEJ 
        WHERE ID_ESTADO = 1 AND ID_DESPACHO = P_ID_DESPACHO;
        IF P_VALIDA = 0 THEN
            p_id_salida := 1;
            p_msj := 'ok';
        ELSE
            p_id_salida := -1;
            p_msj := 'Este codigo de despacho ya esta asignado a una dependencia';
        END IF;
    END PROC_VALIDA_DESPACHO; 
    PROCEDURE PROC_ELIMINAR_RECHAZO(
        p_id_gestion_dependencia        TT_GEST_DEPENDENCIA.ID_GESTion_DEPENDENCIA%TYPE, 
        p_observaciones                 TT_GEST_DEPENDENCIA.observaciones%type,
        p_id_usuario_registro           TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_ip                            TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_salida OUT NUMBER, 
        p_msj OUT VARCHAR2) 
    AS
    BEGIN
        UPDATE TT_GEST_DEPENDENCIA 
            SET OBSERVACIONES = p_observaciones, ID_ESTADO = PKG_CONSTANTES.ESTADO_INACTIVO, FECHA_REGISTRO = SYSDATE, ID_USUARIO_REGISTRO = p_id_usuario_registro, ip = p_ip
        WHERE 
            ID_ESTADO_PROCESO = 3 AND
            ID_GESTion_DEPENDENCIA = p_id_gestion_dependencia;
        p_id_salida := p_id_gestion_dependencia;
        p_msj := 'ok';
    EXCEPTION
        WHEN OTHERS THEN
            p_id_salida :=-1;
            p_msj := '@error al crear la dependencia y codigo despacho@'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace; 
    END PROC_ELIMINAR_RECHAZO;
    
    /*Devuelve El nombre de la dependenia original a regularizar*/
    PROCEDURE PROC_GET_NOMBRE_DEPENDENCIA (
        P_CODIGO_PRESUPUESTARIO   IN SIDEP.RH_DEPENDENCIA.CODIGO_PRESUPUESTARIO%TYPE, 
        P_CUR_DATASET       OUT SYS_REFCURSOR,
        P_MSJ               OUT VARCHAR2
    )
        AS
    BEGIN
        OPEN P_CUR_DATASET FOR 
            SELECT
                dependencia,
                codigo_presupuestario,
                nombre_dependencia
            FROM
                SIDEP.rh_dependencia
            WHERE
                codigo_presupuestario = P_CODIGO_PRESUPUESTARIO
                AND dependencia_vigente = 'S'
                AND unidad_presupuestaria = 'S';                   
    END PROC_GET_NOMBRE_DEPENDENCIA;
END PKG_DEPENDENCIA;
/

-- 
-- Non Foreign Key Constraints for Table RH_EDIFICIO 
-- 
ALTER TABLE SIDEP.RH_EDIFICIO ADD (
  CONSTRAINT PK_EDIFICIO
  PRIMARY KEY
  (EDIFICIO)
  USING INDEX SIDEP.PK_EDIFICIO
  ENABLE VALIDATE);
/


-- 
-- Non Foreign Key Constraints for Table RH_PUESTO 
-- 
ALTER TABLE SIDEP.RH_PUESTO ADD (
  CONSTRAINT CK_AREAJUDICIAL
  CHECK ( area_judicial in ( 'S', 'N' ))
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.RH_PUESTO ADD (
  CONSTRAINT CK_AREA_PUESTO
  CHECK (AREA IN ( 'A', 'J', 'P' ))
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.RH_PUESTO ADD (
  CONSTRAINT STATUS_PUESTO2
  CHECK (Status_Puesto_Vigente IN ('S', 'N'))
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.RH_PUESTO ADD (
  CONSTRAINT XPKPUESTO
  PRIMARY KEY
  (PUESTO)
  USING INDEX SIDEP.XPKPUESTO
  ENABLE VALIDATE);
/


-- 
-- Non Foreign Key Constraints for Table TS_SOURCE 
-- 
ALTER TABLE SIDEP.TS_SOURCE ADD (
  CONSTRAINT PK_TS_SOURCE
  PRIMARY KEY
  (ID_SOURCE)
  USING INDEX SIDEP.PK_TS_SOURCE
  ENABLE VALIDATE);
/

-- 
-- Non Foreign Key Constraints for Table RH_DEPARTAMENTO 
-- 
ALTER TABLE SIDEP.RH_DEPARTAMENTO ADD (
  CONSTRAINT AREA_REGIONAL
  CHECK (Area IN ( 'C' , 'S', 'E', 'O', 'N' ))
  ENABLE VALIDATE);
/

-- 
-- Non Foreign Key Constraints for Table RH_MUNICIPIO 
-- 
ALTER TABLE SIDEP.RH_MUNICIPIO ADD (
  CONSTRAINT CK_FERIA_LOCAL_FIJO
  CHECK (feria_local_fijo in ( 'S', 'N' ))
  ENABLE VALIDATE);
/


-- 
-- Non Foreign Key Constraints for Table TS_ESTADO 
-- 
ALTER TABLE SIDEP.TS_ESTADO ADD (
  CONSTRAINT PK_TS_ESTADO
  PRIMARY KEY
  (ID_ESTADO)
  USING INDEX SIDEP.PK_TS_ESTADO
  ENABLE VALIDATE);
/
-- 
-- Non Foreign Key Constraints for Table TS_OBJETO_TRAZABLE 
-- 
ALTER TABLE SIDEP.TS_OBJETO_TRAZABLE ADD (
  CONSTRAINT PK_TS_OBJETO_TRAZABLE
  PRIMARY KEY
  (ID_OBJETO_TRAZABLE)
  USING INDEX SIDEP.PK_TS_OBJETO_TRAZABLE
  ENABLE VALIDATE);
/

-- 
-- Non Foreign Key Constraints for Table TT_TRAZABILIDAD 
-- 
ALTER TABLE SIDEP.TT_TRAZABILIDAD ADD (
  CONSTRAINT PK_TT_TRAZABILIDAD
  PRIMARY KEY
  (ID_TRAZABILIDAD)
  USING INDEX SIDEP.PK_TT_TRAZABILIDAD
  ENABLE VALIDATE);
/


-- 
-- Non Foreign Key Constraints for Table TC_USUARIO 
-- 
ALTER TABLE SIDEP.TC_USUARIO ADD (
  CONSTRAINT PK_TC_USUARIO
  PRIMARY KEY
  (ID_USUARIO)
  USING INDEX SIDEP.PK_TC_USUARIO
  ENABLE VALIDATE);
/

-- 
-- Non Foreign Key Constraints for Table TS_TIPO_GESTION 
-- 
ALTER TABLE SIDEP.TS_TIPO_GESTION ADD (
  CONSTRAINT TS_TIPO_GESTION_PK
  PRIMARY KEY
  (ID_TIPO_GESTION)
  USING INDEX SIDEP.TS_TIPO_GESTION_PK
  ENABLE VALIDATE);
/



-- 
-- Non Foreign Key Constraints for Table TT_DEPENDENCIA_CORREO 
-- 
ALTER TABLE SIDEP.TT_DEPENDENCIA_CORREO ADD (
  CONSTRAINT TT_DEPENDENCIA_CORREO_PK
  PRIMARY KEY
  (ID_DEPENDENCIA_CORREO)
  USING INDEX SIDEP.TT_DEPENDENCIA_CORREO_PK
  ENABLE VALIDATE);
/

-- 
-- Non Foreign Key Constraints for Table TT_DEPENDENCIA_RH_CIDEJ 
-- 
ALTER TABLE SIDEP.TT_DEPENDENCIA_RH_CIDEJ ADD (
  CONSTRAINT TT_DEPENDENCIA_RH_CIDEJ_PK
  PRIMARY KEY
  (ID_DEP_RH_CIDEJ)
  USING INDEX SIDEP.TT_DEPENDENCIA_RH_CIDEJ_PK
  ENABLE VALIDATE);

/

-- 
-- Non Foreign Key Constraints for Table TT_GEST_DEPENDENCIA 
-- 
ALTER TABLE SIDEP.TT_GEST_DEPENDENCIA ADD (
  CONSTRAINT PK_TT_GEST_DEPENDENCIA
  PRIMARY KEY
  (ID_GESTION_DEPENDENCIA)
  USING INDEX SIDEP.PK_TT_GEST_DEPENDENCIA
  ENABLE VALIDATE);
/
-- 
-- Non Foreign Key Constraints for Table RH_DEPENDENCIA 
-- 
ALTER TABLE SIDEP.RH_DEPENDENCIA ADD (
  CONSTRAINT CK_DEPENDENCIAVIGENTE
  CHECK (DEPENDENCIA_VIGENTE IN ( 'S', 'N' ))
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.RH_DEPENDENCIA ADD (
  CONSTRAINT CK_FUNCIONUNIDAD
  CHECK (FUNCION_UNIDAD IN ('N', 'T', 'A' ))
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.RH_DEPENDENCIA ADD (
  CONSTRAINT CK_UNIDADPRESUPUESTARIA
  CHECK (UNIDAD_PRESUPUESTARIA IN ('S','N'))
  ENABLE VALIDATE);
/



-- 
-- Non Foreign Key Constraints for Table RH_DEPENDENCIA_GPS 
-- 
ALTER TABLE SIDEP.RH_DEPENDENCIA_GPS ADD (
  CONSTRAINT PK_RH_DEPENDENCIA_GPS
  PRIMARY KEY
  (DEPENDENCIA)
  USING INDEX SIDEP.PK_RH_DEPENDENCIA_GPS
  ENABLE VALIDATE);
/

-- 
-- Non Foreign Key Constraints for Table RH_PLAZA 
-- 
ALTER TABLE SIDEP.RH_PLAZA ADD (
  CONSTRAINT STATUS_PLAZA
  CHECK (Status_Plaza IN ('A', 'C', 'D' ))
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.RH_PLAZA ADD (
  CONSTRAINT XPKPLAZA
  PRIMARY KEY
  (DEPENDENCIA, PLAZA, FECHA_PRESUPUESTADA)
  USING INDEX SIDEP.XPKPLAZA
  ENABLE VALIDATE);
/


-- 
-- Non Foreign Key Constraints for Table TC_GENERICO 
-- 
ALTER TABLE SIDEP.TC_GENERICO ADD (
  CONSTRAINT PK_TC_GENERICO
  PRIMARY KEY
  (ID_GENERICO)
  USING INDEX SIDEP.PK_TC_GENERICO
  ENABLE VALIDATE);
/

-- 
-- Foreign Key Constraints for Table RH_PUESTO 
-- 
ALTER TABLE SIDEP.RH_PUESTO ADD (
  CONSTRAINT FK_PUESTO_PUESTO 
  FOREIGN KEY (PUESTO_REFERENCIA) 
  REFERENCES SIDEP.RH_PUESTO (PUESTO)
  ENABLE VALIDATE);
/

-- 
-- Foreign Key Constraints for Table TS_ESTADO 
-- 
ALTER TABLE SIDEP.TS_ESTADO ADD (
  CONSTRAINT FK_TS_ESTADO_REF_TS_SOURCE 
  FOREIGN KEY (ID_SOURCE) 
  REFERENCES SIDEP.TS_SOURCE (ID_SOURCE)
  ENABLE VALIDATE);
/

-- 
-- Foreign Key Constraints for Table TS_OBJETO_TRAZABLE 
-- 
ALTER TABLE SIDEP.TS_OBJETO_TRAZABLE ADD (
  CONSTRAINT FK_TS_OBJETO_T_REF_TS_ESTADO 
  FOREIGN KEY (ID_ESTADO) 
  REFERENCES SIDEP.TS_ESTADO (ID_ESTADO)
  ENABLE VALIDATE);
/
-- 
-- Foreign Key Constraints for Table TT_TRAZABILIDAD 
-- 
ALTER TABLE SIDEP.TT_TRAZABILIDAD ADD (
  CONSTRAINT FK_TT_TRAZABIL_REF_TS_OBJETO_T 
  FOREIGN KEY (ID_OBJETO_TRAZABLE) 
  REFERENCES SIDEP.TS_OBJETO_TRAZABLE (ID_OBJETO_TRAZABLE)
  ENABLE VALIDATE);
/

-- 
-- Foreign Key Constraints for Table RH_DIRECCION_DEPENDENCIA 
-- 
ALTER TABLE SIDEP.RH_DIRECCION_DEPENDENCIA ADD (
  CONSTRAINT FK_DIRDEPENDENCIA_EDIFICIO 
  FOREIGN KEY (EDIFICIO) 
  REFERENCES SIDEP.RH_EDIFICIO (EDIFICIO)
  ENABLE VALIDATE);
/
-- 
-- Foreign Key Constraints for Table TC_USUARIO 
-- 
ALTER TABLE SIDEP.TC_USUARIO ADD (
  CONSTRAINT FK_TC_USUARIO_REF_TS_SOURCE 
  FOREIGN KEY (ID_SOURCE) 
  REFERENCES SIDEP.TS_SOURCE (ID_SOURCE)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TC_USUARIO ADD (
  CONSTRAINT TC_USUARIO_REF_TS_ESTADO 
  FOREIGN KEY (ID_ESTADO) 
  REFERENCES SIDEP.TS_ESTADO (ID_ESTADO)
  ENABLE VALIDATE);
/
-- 
-- Foreign Key Constraints for Table TS_ESTADO_PROCESO 
-- 
ALTER TABLE SIDEP.TS_ESTADO_PROCESO ADD (
  CONSTRAINT FK_TS_ESTADO_PROC_REF_TC_USUAR 
  FOREIGN KEY (ID_USUARIO_REGISTRO) 
  REFERENCES SIDEP.TC_USUARIO (ID_USUARIO)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TS_ESTADO_PROCESO ADD (
  CONSTRAINT FK_TS_ESTADO_PROC_REF_TS_ESTAD 
  FOREIGN KEY (ID_ESTADO) 
  REFERENCES SIDEP.TS_ESTADO (ID_ESTADO)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TS_ESTADO_PROCESO ADD (
  CONSTRAINT FK_TS_ESTADO_PROC_REF_TS_SOURC 
  FOREIGN KEY (ID_SOURCE) 
  REFERENCES SIDEP.TS_SOURCE (ID_SOURCE)
  ENABLE VALIDATE);
/


-- 
-- Foreign Key Constraints for Table TS_TIPO_GESTION 
-- 
ALTER TABLE SIDEP.TS_TIPO_GESTION ADD (
  CONSTRAINT FK_TS_TIPO_GESTION_REF_TC_USUA 
  FOREIGN KEY (ID_USUARIO_REGISTRO) 
  REFERENCES SIDEP.TC_USUARIO (ID_USUARIO)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TS_TIPO_GESTION ADD (
  CONSTRAINT FK_TS_TIPO_GESTION_REF_TS_ESTA 
  FOREIGN KEY (ID_ESTADO) 
  REFERENCES SIDEP.TS_ESTADO (ID_ESTADO)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TS_TIPO_GESTION ADD (
  CONSTRAINT FK_TS_TIPO_GESTION_REF_TS_SOUR 
  FOREIGN KEY (ID_SOURCE) 
  REFERENCES SIDEP.TS_SOURCE (ID_SOURCE)
  ENABLE VALIDATE);
/


-- 
-- Foreign Key Constraints for Table TT_DEPENDENCIA_CORREO 
-- 
ALTER TABLE SIDEP.TT_DEPENDENCIA_CORREO ADD (
  CONSTRAINT FK_DEP_CORREO_REF_TC_USUARIO 
  FOREIGN KEY (ID_USUARIO_REGISTRO) 
  REFERENCES SIDEP.TC_USUARIO (ID_USUARIO)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TT_DEPENDENCIA_CORREO ADD (
  CONSTRAINT FK_DEP_CORREO_REF_TS_ESTADO 
  FOREIGN KEY (ID_ESTADO) 
  REFERENCES SIDEP.TS_ESTADO (ID_ESTADO)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TT_DEPENDENCIA_CORREO ADD (
  CONSTRAINT FK_DEP_CORREO_REF_TS_SOURCE 
  FOREIGN KEY (ID_SOURCE) 
  REFERENCES SIDEP.TS_SOURCE (ID_SOURCE)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TT_DEPENDENCIA_CORREO ADD (
  CONSTRAINT FK_DEP_CORREO_REF_TT_TRAZA 
  FOREIGN KEY (ID_TRAZABILIDAD) 
  REFERENCES SIDEP.TT_TRAZABILIDAD (ID_TRAZABILIDAD)
  ENABLE VALIDATE);
/


-- 
-- Foreign Key Constraints for Table TT_DEPENDENCIA_RH_CIDEJ 
-- 
ALTER TABLE SIDEP.TT_DEPENDENCIA_RH_CIDEJ ADD (
  CONSTRAINT FK_TT_DEP_RH_CIDEJ_REF_TS_EST 
  FOREIGN KEY (ID_ESTADO) 
  REFERENCES SIDEP.TS_ESTADO (ID_ESTADO)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TT_DEPENDENCIA_RH_CIDEJ ADD (
  CONSTRAINT FK_TT_DEP_RH_CIDEJ_REF_TS_SOU 
  FOREIGN KEY (ID_SOURCE) 
  REFERENCES SIDEP.TS_SOURCE (ID_SOURCE)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TT_DEPENDENCIA_RH_CIDEJ ADD (
  CONSTRAINT FK_TT_DEP_RH_CIDEJ_REF_TS_USU 
  FOREIGN KEY (ID_USUARIO_REGISTRO) 
  REFERENCES SIDEP.TC_USUARIO (ID_USUARIO)
  ENABLE VALIDATE);
/

-- 
-- Foreign Key Constraints for Table TT_GEST_DEPENDENCIA 
-- 
ALTER TABLE SIDEP.TT_GEST_DEPENDENCIA ADD (
  CONSTRAINT FK_TT_GEST_DEPEN_REF_TS_ESTADO 
  FOREIGN KEY (ID_ESTADO) 
  REFERENCES SIDEP.TS_ESTADO (ID_ESTADO)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TT_GEST_DEPENDENCIA ADD (
  CONSTRAINT FK_TT_GEST_DEPEN_REF_TS_SOURCE 
  FOREIGN KEY (ID_SOURCE) 
  REFERENCES SIDEP.TS_SOURCE (ID_SOURCE)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TT_GEST_DEPENDENCIA ADD (
  CONSTRAINT FK_TT_GEST_DEPEN_REF_TT_TRAZA 
  FOREIGN KEY (ID_TRAZABILIDAD) 
  REFERENCES SIDEP.TT_TRAZABILIDAD (ID_TRAZABILIDAD)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TT_GEST_DEPENDENCIA ADD (
  CONSTRAINT FK_TT_GEST_DEP_REF_TC_USUARIO 
  FOREIGN KEY (ID_USUARIO_REGISTRO) 
  REFERENCES SIDEP.TC_USUARIO (ID_USUARIO)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.RH_PLAZA ADD (
  CONSTRAINT R_PLAZA_PUESTO 
  FOREIGN KEY (PUESTO) 
  REFERENCES SIDEP.RH_PUESTO (PUESTO)
  ENABLE VALIDATE);
/


-- 
-- Foreign Key Constraints for Table TC_GENERICO 
-- 
ALTER TABLE SIDEP.TC_GENERICO ADD (
  CONSTRAINT FK_TC_GENERICO_REF_TC_USUARIO 
  FOREIGN KEY (ID_USUARIO_REGISTRO) 
  REFERENCES SIDEP.TC_USUARIO (ID_USUARIO)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TC_GENERICO ADD (
  CONSTRAINT FK_TC_GENERICO_REF_TS_ESTADO 
  FOREIGN KEY (ID_ESTADO) 
  REFERENCES SIDEP.TS_ESTADO (ID_ESTADO)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TC_GENERICO ADD (
  CONSTRAINT FK_TC_GENERICO_REF_TS_SOURCE 
  FOREIGN KEY (ID_SOURCE) 
  REFERENCES SIDEP.TS_SOURCE (ID_SOURCE)
  ENABLE VALIDATE);
/
ALTER TABLE SIDEP.TC_GENERICO ADD (
  CONSTRAINT FK_TC_GENERICO_REF_TT_TRAZABIL 
  FOREIGN KEY (ID_TRAZABILIDAD) 
  REFERENCES SIDEP.TT_TRAZABILIDAD (ID_TRAZABILIDAD)
  ENABLE VALIDATE);
/

GRANT READ, WRITE ON DIRECTORY DATA_PUMP_DIR TO EXP_FULL_DATABASE;
/
GRANT READ, WRITE ON DIRECTORY DATA_PUMP_DIR TO IMP_FULL_DATABASE;
/
GRANT EXECUTE, READ, WRITE ON DIRECTORY ADMIN_DIR TO JBARREDA WITH GRANT OPTION;
