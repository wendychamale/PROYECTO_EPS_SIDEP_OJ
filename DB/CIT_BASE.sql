--
-- Create Schema Script 
--   Database Version          : 11.2.0.1.0 
--   Database Compatible Level : 11.2.0.0.0 
--   Script Compatible Level   : 11.2.0.0.0 
--   Toad Version              : 12.1.0.22 
--   DB Connect String         : DESACIT01 
--   Schema                    : CIT_BASE 
--   Script Created by         : RRHH 
--   Script Created at         : 27/06/2022 09:00:18 
--   Physical Location         :  
--   Notes                     :  
--

-- Object Counts: 
--   Roles: 2           Sys Privs: 9        Roles: 0             
--   Users: 1           Sys Privs: 24       Roles: 2             
--   Tablespaces: 2     DataFiles: 2        TempFiles: 1 
-- 
--   Directories: 26 
--   Functions: 1       Lines of Code: 84 
--   Indexes: 6         Columns: 6          
--   Object Privileges: 86 
--   Packages: 5        Lines of Code: 121 
--   Package Bodies: 5  Lines of Code: 849 
--   Sequences: 1 
--   Tables: 6          Columns: 35         Constraints: 41     


-- "Set define off" turns off substitution variables. 
Set define off; 

--
-- TEMP  (Tablespace) 
--
CREATE TEMPORARY TABLESPACE TEMP TEMPFILE 
  '/home/oracle/app/DESACIT01/temp01.dbf' SIZE 33554416K AUTOEXTEND ON NEXT 40M MAXSIZE UNLIMITED
TABLESPACE GROUP ''
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1M;


--
-- USERS  (Tablespace) 
--
CREATE TABLESPACE USERS DATAFILE 
  '/home/oracle/app/DESACIT01/users01.dbf' SIZE 33554416K AUTOEXTEND ON NEXT 32G MAXSIZE UNLIMITED,
  '/datafiles/users02.dbf' SIZE 4590M AUTOEXTEND OFF
LOGGING
ONLINE
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;


--
-- "DEFAULT"  (Profile) 
--
CREATE PROFILE "DEFAULT" LIMIT
  SESSIONS_PER_USER UNLIMITED
  CPU_PER_SESSION UNLIMITED
  CPU_PER_CALL UNLIMITED
  CONNECT_TIME UNLIMITED
  IDLE_TIME UNLIMITED
  LOGICAL_READS_PER_SESSION UNLIMITED
  LOGICAL_READS_PER_CALL UNLIMITED
  COMPOSITE_LIMIT UNLIMITED
  PRIVATE_SGA UNLIMITED
  FAILED_LOGIN_ATTEMPTS 10
  PASSWORD_LIFE_TIME UNLIMITED
  PASSWORD_REUSE_TIME UNLIMITED
  PASSWORD_REUSE_MAX UNLIMITED
  PASSWORD_LOCK_TIME UNLIMITED
  PASSWORD_GRACE_TIME UNLIMITED
  PASSWORD_VERIFY_FUNCTION NULL;


--
-- CONNECT  (Role) 
--
CREATE ROLE CONNECT NOT IDENTIFIED;

-- System privileges granted to CONNECT
GRANT CREATE SESSION TO CONNECT;



--
-- RESOURCE  (Role) 
--
CREATE ROLE RESOURCE NOT IDENTIFIED;

-- System privileges granted to RESOURCE
GRANT CREATE CLUSTER TO RESOURCE;
GRANT CREATE INDEXTYPE TO RESOURCE;
GRANT CREATE OPERATOR TO RESOURCE;
GRANT CREATE PROCEDURE TO RESOURCE;
GRANT CREATE SEQUENCE TO RESOURCE;
GRANT CREATE TABLE TO RESOURCE;
GRANT CREATE TRIGGER TO RESOURCE;
GRANT CREATE TYPE TO RESOURCE;



--
-- CIT_BASE  (User) 
--
CREATE USER CIT_BASE
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 2 Roles for CIT_BASE 
  GRANT CONNECT TO CIT_BASE;
  GRANT RESOURCE TO CIT_BASE;
  ALTER USER CIT_BASE DEFAULT ROLE ALL;
  -- 24 System Privileges for CIT_BASE 
  GRANT ALTER ANY INDEX TO CIT_BASE;
  GRANT ALTER ANY SEQUENCE TO CIT_BASE;
  GRANT ALTER ANY TABLE TO CIT_BASE;
  GRANT ALTER ANY TRIGGER TO CIT_BASE;
  GRANT CREATE ANY INDEX TO CIT_BASE;
  GRANT CREATE ANY SEQUENCE TO CIT_BASE;
  GRANT CREATE ANY SYNONYM TO CIT_BASE;
  GRANT CREATE ANY TABLE TO CIT_BASE;
  GRANT CREATE ANY TRIGGER TO CIT_BASE;
  GRANT CREATE ANY VIEW TO CIT_BASE;
  GRANT CREATE PROCEDURE TO CIT_BASE;
  GRANT CREATE PUBLIC SYNONYM TO CIT_BASE;
  GRANT CREATE TRIGGER TO CIT_BASE;
  GRANT CREATE VIEW TO CIT_BASE;
  GRANT DELETE ANY TABLE TO CIT_BASE;
  GRANT DROP ANY INDEX TO CIT_BASE;
  GRANT DROP ANY SEQUENCE TO CIT_BASE;
  GRANT DROP ANY TABLE TO CIT_BASE;
  GRANT DROP ANY TRIGGER TO CIT_BASE;
  GRANT DROP ANY VIEW TO CIT_BASE;
  GRANT INSERT ANY TABLE TO CIT_BASE;
  GRANT QUERY REWRITE TO CIT_BASE;
  GRANT SELECT ANY TABLE TO CIT_BASE;
  GRANT UNLIMITED TABLESPACE TO CIT_BASE;


--
-- ADMIN_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
ADMIN_DIR AS 
'/oracle/app/oracle/product/10.2.0/db_1/md/admin';


--
-- BACKUP_MANUAL  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
BACKUP_MANUAL AS 
'/datafiles/restauracion';


--
-- BCK_RRHH  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
BCK_RRHH AS 
'/oracle10g/backups';


--
-- BDUMP  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
BDUMP AS 
'/oracle/app/oracle/admin/RRHH/bdump';


--
-- BOLETAS_PDF  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
BOLETAS_PDF AS 
'/tmp/plantilla';


--
-- DATA_FILE_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
DATA_FILE_DIR AS 
'/oracle/app/oracle/product/11.2.0/dbhome_1/demo/schema/sales_history/';


--
-- DATA_PUMP_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
DATA_PUMP_DIR AS 
'/oracle/app/oracle/product/11.2.0/dbhome_1/rdbms/log/';


--
-- DIR_ACTIVE_DIRECTORY  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
DIR_ACTIVE_DIRECTORY AS 
'D:\oracle\product\10.2.0\admin\rrhh\activedirectory';


--
-- EXPDP_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
EXPDP_DIR AS 
'/archive/backup/exp/expdir/';


--
-- EXPDP_LOGDIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
EXPDP_LOGDIR AS 
'/home/';


--
-- IMPDIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
IMPDIR AS 
'/fixes';


--
-- LOG_FILE_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
LOG_FILE_DIR AS 
'/oracle/app/oracle/product/11.2.0/dbhome_1/demo/schema/log/';


--
-- MEDIA_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
MEDIA_DIR AS 
'/oracle/app/oracle/product/11.2.0/dbhome_1/demo/schema/product_media/';


--
-- ORACLE_OCM_CONFIG_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
ORACLE_OCM_CONFIG_DIR AS 
'/oracle/app/oracle/product/11.2.0/dbhome_1/ccr/state';


--
-- QUEST_SOO_ADUMP_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
QUEST_SOO_ADUMP_DIR AS 
'/oracle/app/oracle/admin/CSJBDDPA/adump/';


--
-- QUEST_SOO_BDUMP_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
QUEST_SOO_BDUMP_DIR AS 
'/oracle/app/oracle/admin/CSJBDDPA/bdump/';


--
-- QUEST_SOO_CDUMP_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
QUEST_SOO_CDUMP_DIR AS 
'/oracle/app/oracle/admin/CSJBDDPA/cdump/';


--
-- QUEST_SOO_UDUMP_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
QUEST_SOO_UDUMP_DIR AS 
'/oracle/app/oracle/admin/CSJBDDPA/udump/';


--
-- RMAN_LOGDIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
RMAN_LOGDIR AS 
'/archive/backup/rman/logdir';


--
-- SALIDA  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
SALIDA AS 
'/reco/rman';


--
-- SPACE_LOG_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
SPACE_LOG_DIR AS 
'/home/oracle/datum';


--
-- SS_OE_XMLDIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
SS_OE_XMLDIR AS 
'/oracle/app/oracle/product/11.2.0/dbhome_1/demo/schema/order_entry/';


--
-- SUBDIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
SUBDIR AS 
'/oracle/app/oracle/product/11.2.0/dbhome_1/demo/schema/order_entry//2002/Sep';


--
-- TOAD_TRACEFILE_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
TOAD_TRACEFILE_DIR AS 
'/oracle/app/oracle/diag/rdbms/desacit01/DESACIT0/trace';


--
-- WORK_DIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
WORK_DIR AS 
'/oracle/app/oracle/product/10.2.0/db_1/work';


--
-- XMLDIR  (Directory) 
--
CREATE OR REPLACE DIRECTORY 
XMLDIR AS 
'/ade/b/2125410156/oracle/rdbms/xml';


--
-- TS_SOURCE  (Table) 
--
CREATE TABLE CIT_BASE.TS_SOURCE
(
  ID_SOURCE      NUMBER                         NOT NULL,
  SOURCE         VARCHAR2(100 BYTE)             NOT NULL,
  OBSERVACIONES  VARCHAR2(100 BYTE)
)
TABLESPACE USERS
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
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
NOCOMPRESS ;


--
-- SQ_TRAZABILIDAD  (Sequence) 
--
CREATE SEQUENCE CIT_BASE.SQ_TRAZABILIDAD
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;


--
-- PK_TS_SOURCE  (Index) 
--
CREATE UNIQUE INDEX CIT_BASE.PK_TS_SOURCE ON CIT_BASE.TS_SOURCE
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


--
-- PKG_APOYO_INSERTS  (Package) 
--
CREATE OR REPLACE PACKAGE CIT_BASE."PKG_APOYO_INSERTS" AS 

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
CREATE OR REPLACE PACKAGE CIT_BASE."PKG_CONSTANTES" AS 
FUNCTION NOMBRE_ESQUEMA RETURN VARCHAR2;
FUNCTION ES_DESARROLLO RETURN NUMBER;
FUNCTION VERSION_SISTEMA RETURN FLOAT;

FUNCTION ESTADO_ACTIVO RETURN NUMBER; 
FUNCTION ESTADO_INACTIVO RETURN NUMBER; 

FUNCTION SOURCE_BDD RETURN NUMBER ;
FUNCTION SOURCE_APP RETURN NUMBER ;

END PKG_CONSTANTES;
/

--
-- PKG_APOYO_INSERTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY CIT_BASE."PKG_APOYO_INSERTS" AS
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
                          v_parametro:= 'decode('||x.columna||',NULL,¬NULL¬,'||x.columna||')';
                       elsif x.data_type = 'VARCHAR2' then
                          v_parametro:= '¬¬¬¬#'||x.columna||'#¬¬¬¬';
                       elsif x.data_type = 'DATE' then
                          v_parametro:= 'to_char('||x.columna||',¬DD/MM/YYYY HH24:MI:SS¬)';
                          v_parametro:= '¬TO_DATE(¬¬¬#'||v_parametro||'#¬¬¬,¬¬DD/MM/YYYY HH24:MI:SS¬¬)¬';
                          --v_parametro:= 'decode('||v_parametro||',NULL,¬NULL¬,'||v_parametro||')';
                       else
                          v_parametro:= 'decode('||x.columna||',NULL,¬NULL¬,'||x.columna||')';
                       end if;  -- fin de if x.data_type = 'NUMBER' then

                       v_campos_parametros:=  v_campos_parametros||'#¬,¬#'||v_parametro; 

                    else
                        v_regresa:= x.columna;

                       if x.data_type = 'NUMBER' then
                          v_parametro:= 'decode('||x.columna||',NULL,¬NULL¬,'||x.columna||')';
                       elsif x.data_type = 'VARCHAR2' then
                          v_parametro:= '¬¬¬¬#'||x.columna||'#¬¬¬¬';
                          --v_parametro:= '''''''''#'||x.columna||'#''''''';
                       elsif x.data_type = 'DATE' then
                          v_parametro:= 'to_char('||x.columna||',¬DD/MM/YYYY HH24:MI:SS¬)';
                          v_parametro:= '¬TO_DATE(¬¬¬#'||v_parametro||'#¬¬¬,¬¬DD/MM/YYYY HH24:MI:SS¬¬)¬';
                       else
                          v_parametro:= 'decode('||x.columna||',NULL,¬NULL¬,'||x.columna||')';
                       end if;  -- fin de if x.data_type = 'NUMBER' then
                       v_campos_parametros:=  '#'||v_parametro;

                    end if;        
               end loop;  --fin de if v_regresa is not null then

               if substr(v_campos_parametros,length(v_campos_parametros)-1) = '¬¬' then
                  v_campos_parametros:= substr(v_campos_parametros,1,length(v_campos_parametros)-2);
               elsif substr(v_campos_parametros,length(v_campos_parametros)) = ')' then    
                  v_campos_parametros:= v_campos_parametros||'#';              
               end if;

           v_regresa_full:= 'select ¬INSERT INTO '||pp_tabla||'('||v_regresa||') values (¬'||v_campos_parametros||'¬);¬ FROM '||pp_tabla;

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
        PKG_APOYO_INSERTS.proc_body_proc_insert ( p_esquema, 'TODAS',ptipo ); DBMS_OUTPUT.Put_Line('');
        DBMS_OUTPUT.Put_Line(CHR(10)||'END PKG_INSERTS; '||CHR(10));

        DBMS_OUTPUT.Put_Line('CREATE OR REPLACE PACKAGE BODY '||p_esquema||'.PKG_INSERTS AS'||CHR(10));
        PKG_APOYO_INSERTS.proc_cuerpo_proc_insert_new ( p_esquema, 'TODAS',ptipo ); DBMS_OUTPUT.Put_Line('');
        DBMS_OUTPUT.Put_Line(CHR(10)||'END PKG_INSERTS; ');
        DBMS_OUTPUT.Put_Line(CHR(10)||'--INICIA CREACIÓN DE SECUENCIAS');        
        PKG_APOYO_INSERTS.PROC_GENERA_SECUENCIAS(UPPER(p_esquema), ptipo);
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
                          --v_parametro:= 'decode('||v_parametro||',NULL,¬NULL¬,'||v_parametro||')';
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

/*               if substr(v_campos_parametros,length(v_campos_parametros)-1) = '¬¬' then
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
CREATE OR REPLACE PACKAGE BODY CIT_BASE."PKG_CONSTANTES" AS
FUNCTION NOMBRE_ESQUEMA RETURN VARCHAR2 AS BEGIN RETURN 'SIGEVA'; END NOMBRE_ESQUEMA; 
FUNCTION ES_DESARROLLO RETURN NUMBER AS BEGIN RETURN 1; END ES_DESARROLLO;
FUNCTION VERSION_SISTEMA RETURN FLOAT AS BEGIN RETURN 0.25; END VERSION_SISTEMA;


FUNCTION ESTADO_ACTIVO RETURN NUMBER AS BEGIN RETURN 1; END ESTADO_ACTIVO;
FUNCTION ESTADO_INACTIVO RETURN NUMBER AS BEGIN RETURN 2; END ESTADO_INACTIVO;

FUNCTION SOURCE_BDD RETURN NUMBER AS BEGIN RETURN 1; END SOURCE_BDD;
FUNCTION SOURCE_APP RETURN NUMBER AS BEGIN RETURN 2; END SOURCE_APP;

END PKG_CONSTANTES;
/

--
-- TS_ESTADO  (Table) 
--
CREATE TABLE CIT_BASE.TS_ESTADO
(
  ID_ESTADO       NUMBER                        NOT NULL,
  ESTADO          VARCHAR2(100 BYTE)            NOT NULL,
  FECHA_CREACION  DATE                          NOT NULL,
  OBSERVACIONES   VARCHAR2(200 BYTE),
  ID_SOURCE       NUMBER                        NOT NULL,
  ACTIVO          NUMBER
)
TABLESPACE USERS
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
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
NOCOMPRESS ;


--
-- TS_OBJETO_TRAZABLE  (Table) 
--
CREATE TABLE CIT_BASE.TS_OBJETO_TRAZABLE
(
  ID_OBJETO_TRAZABLE  NUMBER                    NOT NULL,
  OBJETO_TRAZABLE     VARCHAR2(100 BYTE)        NOT NULL,
  DESCRIPCION         VARCHAR2(200 BYTE)        NOT NULL,
  ID_ESTADO           NUMBER                    NOT NULL
)
TABLESPACE USERS
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            MAXSIZE          UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOCOMPRESS ;


--
-- TT_TRAZABILIDAD  (Table) 
--
CREATE TABLE CIT_BASE.TT_TRAZABILIDAD
(
  ID_TRAZABILIDAD     NUMBER                    NOT NULL,
  FECHA_ALTA          DATE                      NOT NULL,
  FECHA_BAJA          DATE,
  ID_OBJETO_TRAZABLE  NUMBER                    NOT NULL
)
TABLESPACE USERS
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            MAXSIZE          UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOCOMPRESS ;


--
-- PK_TS_ESTADO  (Index) 
--
CREATE UNIQUE INDEX CIT_BASE.PK_TS_ESTADO ON CIT_BASE.TS_ESTADO
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


--
-- PK_TS_OBJETO_TRAZABLE  (Index) 
--
CREATE UNIQUE INDEX CIT_BASE.PK_TS_OBJETO_TRAZABLE ON CIT_BASE.TS_OBJETO_TRAZABLE
(ID_OBJETO_TRAZABLE)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            MAXSIZE          UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           );


--
-- PK_TT_TRAZABILIDAD  (Index) 
--
CREATE UNIQUE INDEX CIT_BASE.PK_TT_TRAZABILIDAD ON CIT_BASE.TT_TRAZABILIDAD
(ID_TRAZABILIDAD)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            MAXSIZE          UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           );


--
-- PKG_CREA_TRIGGERS_TRAZABILIDAD  (Package) 
--
CREATE OR REPLACE PACKAGE CIT_BASE."PKG_CREA_TRIGGERS_TRAZABILIDAD" AS
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
-- PKG_CREA_TRIGGERS_TRAZABILIDAD  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY CIT_BASE."PKG_CREA_TRIGGERS_TRAZABILIDAD" AS
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
-- TC_USUARIO  (Table) 
--
CREATE TABLE CIT_BASE.TC_USUARIO
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
TABLESPACE USERS
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
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
NOCOMPRESS ;


--
-- PK_TC_USUARIO  (Index) 
--
CREATE UNIQUE INDEX CIT_BASE.PK_TC_USUARIO ON CIT_BASE.TC_USUARIO
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


--
-- PKG_INSERTS  (Package) 
--
CREATE OR REPLACE PACKAGE CIT_BASE."PKG_INSERTS" AS 

PROCEDURE PROC_INS_TT_TRAZABILIDAD(
    p_id_trazabilidad TT_TRAZABILIDAD.ID_TRAZABILIDAD%TYPE,
    p_id_objeto_trazable TT_TRAZABILIDAD.ID_OBJETO_TRAZABLE%TYPE,
    p_fecha_alta TT_TRAZABILIDAD.FECHA_ALTA%TYPE,
    p_fecha_baja TT_TRAZABILIDAD.FECHA_BAJA%TYPE);

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

END PKG_INSERTS;


/

--
-- PKG_UTILS  (Package) 
--
CREATE OR REPLACE PACKAGE CIT_BASE."PKG_UTILS" AS 
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
-- PKG_INSERTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY CIT_BASE."PKG_INSERTS" AS

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

    END proc_ins_tc_usuario;   --fin de procedure PROC_INS_TC_USUARIO

END PKG_INSERTS;


/

--
-- PKG_UTILS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY CIT_BASE.PKG_UTILS AS

 
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
CREATE OR REPLACE FUNCTION CIT_BASE."FUNC_TRAZABILIDAD" (p_id_trazabilidad TT_TRAZABILIDAD.ID_TRAZABILIDAD%TYPE,
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
-- TC_GENERICO  (Table) 
--
CREATE TABLE CIT_BASE.TC_GENERICO
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
TABLESPACE USERS
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            MAXSIZE          UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOCOMPRESS ;


--
-- PK_TC_GENERICO  (Index) 
--
CREATE UNIQUE INDEX CIT_BASE.PK_TC_GENERICO ON CIT_BASE.TC_GENERICO
(ID_GENERICO)
TABLESPACE USERS
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            MAXSIZE          UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           );


-- 
-- Non Foreign Key Constraints for Table TS_SOURCE 
-- 
ALTER TABLE CIT_BASE.TS_SOURCE ADD (
  CONSTRAINT PK_TS_SOURCE
  PRIMARY KEY
  (ID_SOURCE)
  USING INDEX CIT_BASE.PK_TS_SOURCE
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table TS_ESTADO 
-- 
ALTER TABLE CIT_BASE.TS_ESTADO ADD (
  CONSTRAINT PK_TS_ESTADO
  PRIMARY KEY
  (ID_ESTADO)
  USING INDEX CIT_BASE.PK_TS_ESTADO
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table TS_OBJETO_TRAZABLE 
-- 
ALTER TABLE CIT_BASE.TS_OBJETO_TRAZABLE ADD (
  CONSTRAINT PK_TS_OBJETO_TRAZABLE
  PRIMARY KEY
  (ID_OBJETO_TRAZABLE)
  USING INDEX CIT_BASE.PK_TS_OBJETO_TRAZABLE
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table TT_TRAZABILIDAD 
-- 
ALTER TABLE CIT_BASE.TT_TRAZABILIDAD ADD (
  CONSTRAINT PK_TT_TRAZABILIDAD
  PRIMARY KEY
  (ID_TRAZABILIDAD)
  USING INDEX CIT_BASE.PK_TT_TRAZABILIDAD
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table TC_USUARIO 
-- 
ALTER TABLE CIT_BASE.TC_USUARIO ADD (
  CONSTRAINT PK_TC_USUARIO
  PRIMARY KEY
  (ID_USUARIO)
  USING INDEX CIT_BASE.PK_TC_USUARIO
  ENABLE VALIDATE);


-- 
-- Non Foreign Key Constraints for Table TC_GENERICO 
-- 
ALTER TABLE CIT_BASE.TC_GENERICO ADD (
  CONSTRAINT PK_TC_GENERICO
  PRIMARY KEY
  (ID_GENERICO)
  USING INDEX CIT_BASE.PK_TC_GENERICO
  ENABLE VALIDATE);


-- 
-- Foreign Key Constraints for Table TS_ESTADO 
-- 
ALTER TABLE CIT_BASE.TS_ESTADO ADD (
  CONSTRAINT FK_TS_ESTADO_REF_TS_SOURCE 
  FOREIGN KEY (ID_SOURCE) 
  REFERENCES CIT_BASE.TS_SOURCE (ID_SOURCE)
  ENABLE VALIDATE);


-- 
-- Foreign Key Constraints for Table TS_OBJETO_TRAZABLE 
-- 
ALTER TABLE CIT_BASE.TS_OBJETO_TRAZABLE ADD (
  CONSTRAINT FK_TS_OBJETO_T_REF_TS_ESTADO 
  FOREIGN KEY (ID_ESTADO) 
  REFERENCES CIT_BASE.TS_ESTADO (ID_ESTADO)
  ENABLE VALIDATE);


-- 
-- Foreign Key Constraints for Table TT_TRAZABILIDAD 
-- 
ALTER TABLE CIT_BASE.TT_TRAZABILIDAD ADD (
  CONSTRAINT FK_TT_TRAZABIL_REF_TS_OBJETO_T 
  FOREIGN KEY (ID_OBJETO_TRAZABLE) 
  REFERENCES CIT_BASE.TS_OBJETO_TRAZABLE (ID_OBJETO_TRAZABLE)
  ENABLE VALIDATE);


-- 
-- Foreign Key Constraints for Table TC_USUARIO 
-- 
ALTER TABLE CIT_BASE.TC_USUARIO ADD (
  CONSTRAINT FK_TC_USUARIO_REF_TS_SOURCE 
  FOREIGN KEY (ID_SOURCE) 
  REFERENCES CIT_BASE.TS_SOURCE (ID_SOURCE)
  ENABLE VALIDATE);

ALTER TABLE CIT_BASE.TC_USUARIO ADD (
  CONSTRAINT TC_USUARIO_REF_TS_ESTADO 
  FOREIGN KEY (ID_ESTADO) 
  REFERENCES CIT_BASE.TS_ESTADO (ID_ESTADO)
  ENABLE VALIDATE);


-- 
-- Foreign Key Constraints for Table TC_GENERICO 
-- 
ALTER TABLE CIT_BASE.TC_GENERICO ADD (
  CONSTRAINT FK_TC_GENERICO_REF_TC_USUARIO 
  FOREIGN KEY (ID_USUARIO_REGISTRO) 
  REFERENCES CIT_BASE.TC_USUARIO (ID_USUARIO)
  ENABLE VALIDATE);

ALTER TABLE CIT_BASE.TC_GENERICO ADD (
  CONSTRAINT FK_TC_GENERICO_REF_TS_ESTADO 
  FOREIGN KEY (ID_ESTADO) 
  REFERENCES CIT_BASE.TS_ESTADO (ID_ESTADO)
  ENABLE VALIDATE);

ALTER TABLE CIT_BASE.TC_GENERICO ADD (
  CONSTRAINT FK_TC_GENERICO_REF_TS_SOURCE 
  FOREIGN KEY (ID_SOURCE) 
  REFERENCES CIT_BASE.TS_SOURCE (ID_SOURCE)
  ENABLE VALIDATE);

ALTER TABLE CIT_BASE.TC_GENERICO ADD (
  CONSTRAINT FK_TC_GENERICO_REF_TT_TRAZABIL 
  FOREIGN KEY (ID_TRAZABILIDAD) 
  REFERENCES CIT_BASE.TT_TRAZABILIDAD (ID_TRAZABILIDAD)
  ENABLE VALIDATE);


GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO AEBARRERA;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO AUCELO;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO BTR_CONSULTAWS;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO BTR_USUARIO WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY RMAN_LOGDIR TO CTRL_DDLS;

GRANT EXECUTE, READ, WRITE ON DIRECTORY BDUMP TO DATUM WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY SPACE_LOG_DIR TO DATUM WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO DROMERO;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO EHURTARTE;

GRANT READ, WRITE ON DIRECTORY DATA_PUMP_DIR TO EXP_FULL_DATABASE;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO F56E WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY DATA_PUMP_DIR TO IMP_FULL_DATABASE;

GRANT EXECUTE, READ, WRITE ON DIRECTORY ADMIN_DIR TO JBARREDA WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY BCK_RRHH TO JBARREDA WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY BOLETAS_PDF TO JBARREDA WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY QUEST_SOO_ADUMP_DIR TO JBARREDA WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY QUEST_SOO_BDUMP_DIR TO JBARREDA WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY QUEST_SOO_CDUMP_DIR TO JBARREDA WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY QUEST_SOO_UDUMP_DIR TO JBARREDA WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY SALIDA TO JBARREDA WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY WORK_DIR TO JBARREDA WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO JCARRILLO;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO LOVALLE;

GRANT EXECUTE, READ, WRITE ON DIRECTORY BDUMP TO MALOPEZ WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY DIR_ACTIVE_DIRECTORY TO MALOPEZ WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY EXPDP_DIR TO MALOPEZ WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY IMPDIR TO MALOPEZ WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY RMAN_LOGDIR TO MALOPEZ WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY SPACE_LOG_DIR TO MALOPEZ WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY SS_OE_XMLDIR TO OE WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY SUBDIR TO OE WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY EXPDP_DIR TO ORACLEDMPBK WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY EXPDP_LOGDIR TO ORACLEDMPBK;

GRANT READ ON DIRECTORY QUEST_SOO_ADUMP_DIR TO ORACLEDMPBK;

GRANT READ ON DIRECTORY QUEST_SOO_BDUMP_DIR TO ORACLEDMPBK;

GRANT READ ON DIRECTORY QUEST_SOO_CDUMP_DIR TO ORACLEDMPBK;

GRANT READ ON DIRECTORY QUEST_SOO_UDUMP_DIR TO ORACLEDMPBK;

GRANT READ, WRITE ON DIRECTORY ORACLE_OCM_CONFIG_DIR TO ORACLE_OCM;

GRANT READ ON DIRECTORY MEDIA_DIR TO PM;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO PRUEBA;

GRANT READ ON DIRECTORY QUEST_SOO_ADUMP_DIR TO QUEST;

GRANT READ ON DIRECTORY QUEST_SOO_BDUMP_DIR TO QUEST;

GRANT READ ON DIRECTORY QUEST_SOO_CDUMP_DIR TO QUEST;

GRANT READ ON DIRECTORY QUEST_SOO_UDUMP_DIR TO QUEST;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO RAMERIDA;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO ROLE_RRHH;

GRANT READ, WRITE ON DIRECTORY DIR_ACTIVE_DIRECTORY TO ROLE_RRHH;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO ROL_BANTRAB;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO RRHH WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY DIR_ACTIVE_DIRECTORY TO RRHH WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY EXPDP_DIR TO RRHH;

GRANT READ, WRITE ON DIRECTORY EXPDP_LOGDIR TO RRHH;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO RRHHREC WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY DIR_ACTIVE_DIRECTORY TO RRHHREC WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY EXPDP_DIR TO RRHHREC;

GRANT READ, WRITE ON DIRECTORY EXPDP_LOGDIR TO RRHHREC;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO RRHHTEMP WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY DIR_ACTIVE_DIRECTORY TO RRHHTEMP WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY EXPDP_DIR TO RRHHTEMP;

GRANT READ, WRITE ON DIRECTORY EXPDP_LOGDIR TO RRHHTEMP;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO RRHH_029 WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY DIR_ACTIVE_DIRECTORY TO RRHH_029 WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY EXPDP_DIR TO RRHH_029;

GRANT READ, WRITE ON DIRECTORY EXPDP_LOGDIR TO RRHH_029;

GRANT EXECUTE, DEBUG ON CIT_BASE.PKG_APOYO_INSERTS TO SALOJ;

GRANT EXECUTE, READ, WRITE ON DIRECTORY BOLETAS_PDF TO SCHOC WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY DIR_ACTIVE_DIRECTORY TO SCHOC WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY EXPDP_DIR TO SCHOC WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY EXPDP_LOGDIR TO SCHOC WITH GRANT OPTION;

GRANT READ ON DIRECTORY DATA_FILE_DIR TO SH;

GRANT READ, WRITE ON DIRECTORY LOG_FILE_DIR TO SH;

GRANT EXECUTE, READ, WRITE ON DIRECTORY BCK_RRHH TO SYSTEM WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY BOLETAS_PDF TO SYSTEM WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY DIR_ACTIVE_DIRECTORY TO SYSTEM WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY EXPDP_DIR TO SYSTEM WITH GRANT OPTION;
GRANT EXECUTE ON DIRECTORY EXPDP_DIR TO SYSTEM;

GRANT EXECUTE, READ, WRITE ON DIRECTORY EXPDP_LOGDIR TO SYSTEM WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY IMPDIR TO SYSTEM WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY QUEST_SOO_ADUMP_DIR TO SYSTEM WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY QUEST_SOO_BDUMP_DIR TO SYSTEM WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY QUEST_SOO_CDUMP_DIR TO SYSTEM WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY QUEST_SOO_UDUMP_DIR TO SYSTEM WITH GRANT OPTION;

GRANT EXECUTE, READ, WRITE ON DIRECTORY SPACE_LOG_DIR TO SYSTEM WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO TEST;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO VREYES;

GRANT READ, WRITE ON DIRECTORY EXPDP_DIR TO VREYES WITH GRANT OPTION;

GRANT READ, WRITE ON DIRECTORY BOLETAS_PDF TO WSUSUARIOCOMPRAS WITH GRANT OPTION;