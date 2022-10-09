
--ALTER TABLE TT_GEST_DEPENDENCIA ADD  PROCESO_ESTADO_AREA VARCHAR2(100 BYTE); 

--/*
/*CREATE TABLE SIDEP.DEPENDENCIAS_AREA_ATENDIDA
(
  ID_GESTION NUMBER      NOT NULL,
  ID_USUARIO_ATENDIO     NUMBER   NOT NULL,
  AREA_ATENDIO           VARCHAR2(30 BYTE)      NOT NULL,
  ID_GESTION_DEPENDENCIA NUMBER     NOT NULL
)
/
CREATE UNIQUE INDEX SIDEP.PK_DEPENDENCIAS_AREA_ATENDIDA ON SIDEP.DEPENDENCIAS_AREA_ATENDIDA
(ID_USUARIO_ATENDIO,AREA_ATENDIO,ID_GESTION_DEPENDENCIA)
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
ALTER TABLE SIDEP.DEPENDENCIAS_AREA_ATENDIDA ADD (
CONSTRAINT PK_DEPENDENCIAS_AREA_ATENDIDA
  PRIMARY KEY
  (ID_USUARIO_ATENDIO,AREA_ATENDIO,ID_GESTION_DEPENDENCIA)
  USING INDEX SIDEP.PK_DEPENDENCIAS_AREA_ATENDIDA
  ENABLE VALIDATE);
/
CREATE SEQUENCE SIDEP.SQ_DEP_ATENDIDAS
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  CACHE 20
  NOORDER;
/
COMMENT ON TABLE SIDEP.DEPENDENCIAS_AREA_ATENDIDA.ID_GESTION IS 'Codigo de gestion';
COMMENT ON COLUMN SIDEP.DEPENDENCIAS_AREA_ATENDIDA.ID_USUARIO_ATENDIO IS 'Usuario que atendio la gestion';
COMMENT ON COLUMN SIDEP.DEPENDENCIAS_AREA_ATENDIDA.AREA_ATENDIO IS 'area que atendio la gestion';
COMMENT ON COLUMN SIDEP.DEPENDENCIAS_AREA_ATENDIDA.ID_GESTION_DEPENDENCIA IS 'Numero de gestion de la dependencia atendida';
/
*/
--paqutee de creacion 


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
   P_obs_fecha_vigencia        TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
   p_proceso_estado_area       TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE
   );
   
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
    P_obs_fecha_vigencia        TT_GEST_DEPENDENCIA.OBS_FECHA_VIGENCIA%TYPE,
     p_proceso_estado_area       TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE)
   
IS
 /*  PROCESO CREADO PARA INSERT EN LA TABLA= RRHH.TT_GEST_DEPENDENCIA
     CREADO POR EL USUARIO= RRHH
     FECHA DE CREACION= 21/09/2020 13:30:26
     FECHA ULTIMA MODIFICACION=
*/
BEGIN
declare 
area varchar(30):='';
begin 
   if((UPPER(p_proceso_estado_area)='PRESIDENCIA') or (UPPER(p_proceso_estado_area)='SECRETARIA'))
   then
     area:='UCPAS';
   end if;
    if(UPPER(p_proceso_estado_area)='UCPAS')
    then
     area:='NOMINAS';
   end if;
   
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
                                    OBS_FECHA_VIGENCIA,
                                    PROCESO_ESTADO_AREA )
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
                p_obs_fecha_vigencia,
                area );
          
          --Inserta en las areas que atienden la dependencia 
             INSERT INTO SIDEP.DEPENDENCIAS_AREA_ATENDIDA(
                                                          ID_GESTION,
                                                          ID_USUARIO_ATENDIO,
                                                          AREA_ATENDIO,
                                                          ID_GESTION_DEPENDENCIA
                                                          )
                                                          values(
                                                          SIDEP.SQ_DEP_ATENDIDAS.nextval,
                                                          p_id_usuario_registro,
                                                          p_proceso_estado_area,
                                                          p_id_gestion_dependencia
                                                          );
                                                           
                                                          
 end;               
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
-- PKG_DEPENDENCIA  (Package) 
--
CREATE OR REPLACE PACKAGE SIDEP.PKG_DEPENDENCIA AS
    PROCEDURE PROC_VALIDA_DEPENDENCIA(P_DEPENDENCIA RH_DEPENDENCIA.DEPENDENCIA%TYPE, P_VALOR NUMBER, p_id_salida OUT NUMBER, p_msj OUT VARCHAR2);
    PROCEDURE PROC_GET_GEST_DEPENDENCIA (
        p_id_estado_proceso   tt_gest_dependencia.id_estado_proceso%type DEFAULT 0,
        p_id_tipo_gestion     tt_gest_dependencia.id_tipo_gestion%type DEFAULT 0,
        P_CUR_DATASET OUT SYS_REFCURSOR,
        P_MSJ OUT VARCHAR2);
  --Este es un nuevo procedimiento que busca las dependencias por estado en que area se encuentra      
    PROCEDURE PROC_GET_GEST_DEPENDENCIA_AREA (
        p_id_estado_proceso   tt_gest_dependencia.id_estado_proceso%type DEFAULT 0,
        p_id_tipo_gestion     tt_gest_dependencia.id_tipo_gestion%type DEFAULT 0,
        p_proceso_estado_area tt_gest_dependencia.proceso_estado_area%type DEFAULT '',
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
        p_proceso_estado_area       TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,
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
        p_proceso_estado_area       TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,
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
        p_proceso_estado_area       TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,
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
        p_proceso_estado_area      TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                       OUT VARCHAR2);        
 PROCEDURE PROC_RECHAZA_SOLOLICITUD_AREA(
        p_id_gestion_dependencia    TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_observaciones             TT_GEST_DEPENDENCIA.OBSERVACIONES%TYPE,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_proceso_estado_area      TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,
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
        p_proceso_estado_area           TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,
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
                INNER JOIN RRHH.RH_TIPO_AREA E ON A.TIPO_AREA = E.ID_AREA
            WHERE
                A.ID_ESTADO = 1 AND
                B.ID_ESTADO_PROCESO = DECODE(P_ID_ESTADO_PROCESO,0, B.ID_ESTADO_PROCESO,P_ID_ESTADO_PROCESO) AND
                C.ID_TIPO_GESTION = DECODE(P_ID_TIPO_GESTION, 0, C.ID_TIPO_GESTION, P_ID_TIPO_GESTION)
            ORDER BY FECHA_REGISTRO DESC; 
    END PROC_GET_GEST_DEPENDENCIA;
    
      /* Obitne la lista de todas las gestiones por area especifica*/
    PROCEDURE PROC_GET_GEST_DEPENDENCIA_AREA (
        p_id_estado_proceso   tt_gest_dependencia.id_estado_proceso%type DEFAULT 0,
        p_id_tipo_gestion     tt_gest_dependencia.id_tipo_gestion%type DEFAULT 0,
        p_proceso_estado_area tt_gest_dependencia.proceso_estado_area%type DEFAULT '',
        P_CUR_DATASET   OUT SYS_REFCURSOR,
        P_MSJ           OUT VARCHAR2
    )
        AS
    BEGIN
       if (p_id_estado_proceso =1)
       then
        OPEN P_CUR_DATASET FOR 
            /* Formatted on 05/09/2022  */
            SELECT A.ID_GESTION_DEPENDENCIA,
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
                a.obs_fecha_vigencia,
                A.PROCESO_ESTADO_AREA
            FROM SIDEP.TT_GEST_DEPENDENCIA A
                INNER JOIN TS_ESTADO_PROCESO B ON A.ID_ESTADO_PROCESO = B.ID_ESTADO_PROCESO 
                INNER JOIN TS_TIPO_GESTION C ON A.ID_TIPO_GESTION = C.ID_TIPO_GESTION 
                INNER JOIN TC_USUARIO D ON A.ID_USUARIO_REGISTRO = D.ID_USUARIO
                INNER JOIN RRHH.RH_TIPO_AREA E ON A.TIPO_AREA = E.ID_AREA
                WHERE
                A.ID_ESTADO = 1 
                AND B.ID_ESTADO_PROCESO = DECODE(P_ID_ESTADO_PROCESO,0, B.ID_ESTADO_PROCESO,P_ID_ESTADO_PROCESO) 
                AND C.ID_TIPO_GESTION = DECODE(p_id_tipo_gestion, 0, C.ID_TIPO_GESTION, p_id_tipo_gestion) 
                AND ((P_ID_ESTADO_PROCESO=1 AND (A.PROCESO_ESTADO_AREA LIKE DECODE(p_proceso_estado_area,'%%',A.PROCESO_ESTADO_AREA,p_proceso_estado_area ) OR A.PROCESO_ESTADO_AREA IS NULL))
                OR (P_ID_ESTADO_PROCESO!=1))
            ORDER BY FECHA_REGISTRO DESC; 
      else 
       OPEN P_CUR_DATASET FOR 
            /* Formatted on 05/09/2022  */
            SELECT A.ID_GESTION_DEPENDENCIA,
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
                a.obs_fecha_vigencia,
                A.PROCESO_ESTADO_AREA
            FROM SIDEP.TT_GEST_DEPENDENCIA A
                INNER JOIN TS_ESTADO_PROCESO B ON A.ID_ESTADO_PROCESO = B.ID_ESTADO_PROCESO 
                INNER JOIN TS_TIPO_GESTION C ON A.ID_TIPO_GESTION = C.ID_TIPO_GESTION 
                INNER JOIN TC_USUARIO D ON A.ID_USUARIO_REGISTRO = D.ID_USUARIO
                INNER JOIN RRHH.RH_TIPO_AREA E ON A.TIPO_AREA = E.ID_AREA
                INNER JOIN SIDEP.DEPENDENCIAS_AREA_ATENDIDA F ON F.ID_GESTION_DEPENDENCIA = A.ID_GESTION_DEPENDENCIA
           
            WHERE
                A.ID_ESTADO = 1 
                AND B.ID_ESTADO_PROCESO = DECODE(P_ID_ESTADO_PROCESO,0, B.ID_ESTADO_PROCESO,P_ID_ESTADO_PROCESO) 
                AND C.ID_TIPO_GESTION = DECODE(p_id_tipo_gestion, 0, C.ID_TIPO_GESTION, p_id_tipo_gestion) 
                AND ((P_ID_ESTADO_PROCESO=2 AND F.AREA_ATENDIO LIKE DECODE(p_proceso_estado_area,'%%',F.AREA_ATENDIO,p_proceso_estado_area))OR (P_ID_ESTADO_PROCESO!=2))
                AND ((P_ID_ESTADO_PROCESO=0 AND F.AREA_ATENDIO LIKE DECODE(p_proceso_estado_area,'%%',F.AREA_ATENDIO,p_proceso_estado_area ))OR (P_ID_ESTADO_PROCESO!=0))
                AND ((P_ID_ESTADO_PROCESO=3 AND F.AREA_ATENDIO LIKE DECODE(p_proceso_estado_area,'%%',F.AREA_ATENDIO,p_proceso_estado_area))OR (P_ID_ESTADO_PROCESO!=3))
            
            ORDER BY FECHA_REGISTRO DESC; 
    end if;
      
    END PROC_GET_GEST_DEPENDENCIA_AREA;
    
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
        p_proceso_estado_area       TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,
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
            p_obs_fecha_vigencia => p_obs_fecha_vigencia,
            p_proceso_estado_area => p_proceso_estado_area
            );
            
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
        p_proceso_estado_area       TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                        OUT VARCHAR2)
    AS 
        ruta TT_GEST_DEPENDENCIA.ACUERDO_DIGITAL%TYPE;
        p_estadop   number;
        area varchar(30):='';
    BEGIN
        ruta := p_ruta_archivo || TO_CHAR(p_id_gestion_dependencia) || chr(47)  ||p_nombre_archivo;
           if((UPPER(p_proceso_estado_area)='PRESIDENCIA') or (UPPER(p_proceso_estado_area)='SECRETARIA'))
           then
             area:='UCPAS';
           end if;
            if(UPPER(p_proceso_estado_area)='UCPAS')
            then
             area:='NOMINAS';
           end if;
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
               OBS_FECHA_VIGENCIA     = p_obs_fecha_vigencia,
               PROCESO_ESTADO_AREA    = area
        WHERE  ID_GESTION_DEPENDENCIA = p_id_gestion_dependencia;
        begin
        INSERT INTO SIDEP.DEPENDENCIAS_AREA_ATENDIDA(ID_GESTION,ID_USUARIO_ATENDIO, AREA_ATENDIO,ID_GESTION_DEPENDENCIA )
               values( SIDEP.SQ_DEP_ATENDIDAS.nextval, p_id_usuario_registro, p_proceso_estado_area, p_id_gestion_dependencia);
       EXCEPTION
        WHEN OTHERS THEN
           p_id_salida := p_id_gestion_dependencia;    
        end;
        
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
        p_proceso_estado_area varchar2(100);
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
                p_obs_fecha_vigencia => p_obs_fecha_vigencia,
                p_proceso_estado_area => p_proceso_estado_area);         
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
        p_proceso_estado_area       TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,
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
                p_obs_fecha_vigencia => p_obs_fecha_vigencia,
                p_proceso_estado_area => p_proceso_estado_area);
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
        p_proceso_estado_area               TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%type;
    BEGIN
        SELECT 
            CODIGO_DEPENDENCIA, CODIGO_PRESUPUESTARIO, NOMBRE_DEPENDENCIA, NOMBRE_GAFETE, NOMBRE_ABREVIADO,
            NOMBRE_DOCUMENTO, CONECTOR, FECHA_DEL_ACUERDO, FECHA_ENTRA_VIGENCIA, REFERENCIA,
            FUNCION_UNIDAD, DEPARTAMENTO, MUNICIPIO, TIPO_AREA, ACUERDO_DIGITAL, FECHA_PUBLICACION, OBS_FECHA_VIGENCIA,PROCESO_ESTADO_AREA
        INTO
            p_codigo_dependencia, p_codigo_presupuestario, p_nombre_dependencia, p_nombre_gafete, p_nombre_abreviado,
            p_nombre_documento, p_conector, p_fecha_del_acuerdo, p_fecha_entra_vigencia, p_referencia, 
            p_funcion_unidad, p_departamento, p_municipio, p_tipo_area, p_acuerdo_digital, p_fecha_publicacion, p_obs_fecha_vigencia,p_proceso_estado_area
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
        
          begin
        INSERT INTO SIDEP.DEPENDENCIAS_AREA_ATENDIDA(ID_GESTION,ID_USUARIO_ATENDIO, AREA_ATENDIO,ID_GESTION_DEPENDENCIA )
               values( SIDEP.SQ_DEP_ATENDIDAS.nextval, p_id_usuario_registro, p_proceso_estado_area, p_id_gestion_dependencia);
       EXCEPTION
        WHEN OTHERS THEN
           p_id_salida := p_codigo_dependencia;    
        end;
        
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
        p_proceso_estado_area       TT_GEST_DEPENDENCIA.proceso_estado_area%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                       OUT VARCHAR2) 
        AS
    BEGIN
  
        
        UPDATE TT_GEST_DEPENDENCIA
        SET
            ID_ESTADO_PROCESO = PKG_CONSTANTES.RECHAZADA,
            OBSERVACIONES = p_observaciones,
            IP = P_IP,
            ID_USUARIO_REGISTRO = p_id_usuario_registro,
            FECHA_REGISTRO = SYSDATE,
            PROCESO_ESTADO_AREA= p_proceso_estado_area
        WHERE
            ID_GESTION_DEPENDENCIA = p_id_gestion_dependencia;
       begin
        INSERT INTO SIDEP.DEPENDENCIAS_AREA_ATENDIDA(ID_GESTION,ID_USUARIO_ATENDIO, AREA_ATENDIO,ID_GESTION_DEPENDENCIA )
               values( SIDEP.SQ_DEP_ATENDIDAS.nextval, p_id_usuario_registro, 'NOMINAS', p_id_gestion_dependencia);
       EXCEPTION
        WHEN OTHERS THEN
           p_id_salida := p_id_gestion_dependencia;    
        end;
            
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

 PROCEDURE PROC_RECHAZA_SOLOLICITUD_AREA(
        p_id_gestion_dependencia    TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_observaciones             TT_GEST_DEPENDENCIA.OBSERVACIONES%TYPE,
        p_ip                        TT_GEST_DEPENDENCIA.IP%TYPE,
        p_id_usuario_registro       TT_GEST_DEPENDENCIA.ID_USUARIO_REGISTRO%TYPE,
        p_proceso_estado_area       TT_GEST_DEPENDENCIA.proceso_estado_area%TYPE,
        p_id_salida                 OUT TT_GEST_DEPENDENCIA.ID_GESTION_DEPENDENCIA%TYPE,
        p_msj                       OUT VARCHAR2) 
        AS
    BEGIN    
        UPDATE TT_GEST_DEPENDENCIA
        SET
            OBSERVACIONES = p_observaciones,
            IP = P_IP,
            ID_USUARIO_REGISTRO = p_id_usuario_registro,
            FECHA_REGISTRO = SYSDATE,
            PROCESO_ESTADO_AREA= p_proceso_estado_area
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
    
    END PROC_RECHAZA_SOLOLICITUD_AREA;
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
        p_proceso_estado_area           TT_GEST_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,
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
            p_obs_fecha_vigencia => p_obs_fecha_vigencia,
            p_proceso_estado_area => p_proceso_estado_area);         
        
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