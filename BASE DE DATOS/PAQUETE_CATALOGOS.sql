--ALTER TABLE TT_GEST_DEPENDENCIA ADD  PROCESO_ESTADO_AREA VARCHAR2(100 BYTE); 
--ALTER TABLE RH_DEPENDENCIA ADD  PROCESO_ESTADO_AREA VARCHAR2(100 BYTE);  
CREATE OR REPLACE PACKAGE RRHH."PKG_CATALOGOS"
AS
    PROCEDURE PROC_GET_DEPARTAMENTO (p_cur_dataset OUT SYS_REFCURSOR,p_msj OUT VARCHAR2 );
    PROCEDURE PROC_GET_MUNICIPIO (P_ID_DEPARTAMENTO IN RRHH.RH_MUNICIPIO.DEPARTAMENTO%TYPE, P_CUR_DATASET OUT SYS_REFCURSOR,P_MSJ OUT VARCHAR2);
    PROCEDURE PROC_GET_DEP_AREA (P_CUR_DATASET OUT SYS_REFCURSOR,P_MSJ OUT VARCHAR2);
    PROCEDURE PROC_GET_DEPENDENCIAS (P_CUR_DATASET OUT SYS_REFCURSOR,P_MSJ OUT VARCHAR2);
    PROCEDURE PROC_GET_DEPENDENCIAS_AREA (P_PROCESO_ESTADO_AREA  RRHH.RH_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,P_CUR_DATASET OUT SYS_REFCURSOR,P_MSJ OUT VARCHAR2);
    PROCEDURE PROC_GET_DEP_SIN_CORREO (P_CUR_DATASET OUT SYS_REFCURSOR,P_MSJ OUT VARCHAR2);
    PROCEDURE PROC_GET_DEP_SIN_DESPACHO (P_CUR_DATASET OUT SYS_REFCURSOR, P_MSJ OUT VARCHAR2);
    PROCEDURE PROC_GET_CORREOCIDEJ (P_CUR_DATASET OUT SYS_REFCURSOR, P_MSJ OUT VARCHAR2);	
END "PKG_CATALOGOS";
/
CREATE OR REPLACE PACKAGE BODY RRHH."PKG_CATALOGOS" AS
    /*Devuelve lista de departamentos*/
    PROCEDURE PROC_GET_DEPARTAMENTO (
        P_CUR_DATASET   OUT SYS_REFCURSOR,
        P_MSJ           OUT VARCHAR2
    )
        AS
    BEGIN
        OPEN P_CUR_DATASET FOR 
            SELECT
                DEPARTAMENTO,
                NOMBRE_DEPARTAMENTO
            FROM
                RRHH.RH_DEPARTAMENTO
            WHERE
                PAIS = 1 AND
                DEPARTAMENTO <> 300
            ORDER BY DEPARTAMENTO;    
    END PROC_GET_DEPARTAMENTO;
      
    /*Devuelve llista de municipios*/
    PROCEDURE PROC_GET_MUNICIPIO (
        P_ID_DEPARTAMENTO   IN RRHH.RH_MUNICIPIO.DEPARTAMENTO%TYPE, 
        P_CUR_DATASET       OUT SYS_REFCURSOR,
        P_MSJ               OUT VARCHAR2
    )
        AS
    BEGIN
        OPEN P_CUR_DATASET FOR 
            SELECT
                MUNICIPIO,
                NOMBRE_MUNICIPIO
            FROM
                RRHH.RH_MUNICIPIO
            WHERE
                PAIS = 1 AND
                DEPARTAMENTO = P_ID_DEPARTAMENTO
            ORDER BY MUNICIPIO;                   
    END PROC_GET_MUNICIPIO;

    /*Devuelve los tipos de ares*/
    PROCEDURE PROC_GET_DEP_AREA (
        P_CUR_DATASET   OUT SYS_REFCURSOR,
        P_MSJ           OUT VARCHAR2
    )
        AS
    BEGIN
        OPEN P_CUR_DATASET FOR 
            SELECT 
                ID_AREA,
                NOMBRE_AREA 
            FROM 
                RRHH.RH_TIPO_AREA 
            ORDER BY ID_AREA;    
    END PROC_GET_DEP_AREA; 
    
    /*Devuelve el listado completo de  dependencias nominales*/
    PROCEDURE PROC_GET_DEPENDENCIAS (
        P_CUR_DATASET   OUT SYS_REFCURSOR,
        P_MSJ           OUT VARCHAR2
    )
        AS
    BEGIN
        OPEN P_CUR_DATASET FOR 
            SELECT 
                A.DEPENDENCIA,
                A.CODIGO_PRESUPUESTARIO,
                A.NOMBRE_DEPENDENCIA,
                A.NOMBRE_GAFETE,
                B.NOMBRE_AREA,
                C.ID_TIPO_GESTION,
                D.TIPO_GESTION
            FROM 
                RRHH.RH_DEPENDENCIA A
                    LEFT JOIN RRHH.RH_TIPO_AREA B ON A.ID_AREA = B.ID_AREA
                    LEFT JOIN RRHH.TT_GEST_DEPENDENCIA C ON C.CODIGO_PRESUPUESTARIO = A.CODIGO_PRESUPUESTARIO AND C.ID_ESTADO = 1 AND C.ID_ESTADO_PROCESO <> 2
                    LEFT JOIN RRHH.TS_TIPO_GESTION D ON C.ID_TIPO_GESTION = D.ID_TIPO_GESTION
            WHERE
                A.UNIDAD_PRESUPUESTARIA = 'S' AND
                A.DEPENDENCIA_VIGENTE = 'S';   
    END PROC_GET_DEPENDENCIAS; 
    
     
    /*Devuelve el listado completo de  dependencias nominales por areas*/
    PROCEDURE PROC_GET_DEPENDENCIAS_AREA (
        P_PROCESO_ESTADO_AREA  RRHH.RH_DEPENDENCIA.PROCESO_ESTADO_AREA%TYPE,
        P_CUR_DATASET   OUT SYS_REFCURSOR,
        P_MSJ           OUT VARCHAR2
    )
        AS
    BEGIN
        OPEN P_CUR_DATASET FOR 
            SELECT 
                A.DEPENDENCIA,
                A.CODIGO_PRESUPUESTARIO,
                A.NOMBRE_DEPENDENCIA,
                A.NOMBRE_GAFETE,
                B.NOMBRE_AREA,
                C.ID_TIPO_GESTION,
                D.TIPO_GESTION
            FROM 
                RRHH.RH_DEPENDENCIA A
                    LEFT JOIN RRHH.RH_TIPO_AREA B ON A.ID_AREA = B.ID_AREA
                    LEFT JOIN RRHH.TT_GEST_DEPENDENCIA C ON C.CODIGO_PRESUPUESTARIO = A.CODIGO_PRESUPUESTARIO AND C.ID_ESTADO = 1 AND C.ID_ESTADO_PROCESO <> 2
                    LEFT JOIN RRHH.TS_TIPO_GESTION D ON C.ID_TIPO_GESTION = D.ID_TIPO_GESTION
            WHERE
                A.UNIDAD_PRESUPUESTARIA = 'S' AND
                A.DEPENDENCIA_VIGENTE = 'S' AND
                (A.PROCESO_ESTADO_AREA=P_PROCESO_ESTADO_AREA OR A.PROCESO_ESTADO_AREA is NULL ) ;
    END PROC_GET_DEPENDENCIAS_AREA; 
    
    PROCEDURE PROC_GET_DEP_SIN_CORREO (
        P_CUR_DATASET   OUT SYS_REFCURSOR,
        P_MSJ           OUT VARCHAR2
    )
        AS
    BEGIN
       OPEN P_CUR_DATASET FOR 
            SELECT 
                A.DEPENDENCIA,
                NOMBRE_DEPENDENCIA  
            FROM 
                RRHH.RH_DEPENDENCIA A
                   LEFT JOIN RRHH.TT_DEPENDENCIA_CORREO B ON A.DEPENDENCIA = B.DEPENDENCIA 
            WHERE
                DEPENDENCIA_VIGENTE = 'S' AND UNIDAD_PRESUPUESTARIA = 'S'
                AND B.DEPENDENCIA IS NULL
            ORDER BY A.FECHA_CREACION_DEPENDENCIA DESC;       
    END PROC_GET_DEP_SIN_CORREO;

     PROCEDURE PROC_GET_DEP_SIN_DESPACHO (
        P_CUR_DATASET   OUT SYS_REFCURSOR,
        P_MSJ           OUT VARCHAR2
    )
        AS
    BEGIN
        OPEN P_CUR_DATASET FOR 
            SELECT 
                A.DEPENDENCIA, NOMBRE_DEPENDENCIA--, RH_PKG.DEPARTAMENTO(1, C.DEPARTAMENTO) NOMBRE_DEPARTAMENTO, RH_PKG.MUNICIPIO(1,C.DEPARTAMENTO, C.MUNICIPIO) NOMBRE_MUNICIPIO
            FROM
                RRHH.RH_DEPENDENCIA A  
            --        INNER JOIN RH_DIRECCION_DEPENDENCIA C ON A.ID_DIRECCION = C.ID_DIRECCION 
                    LEFT JOIN RRHH.TT_DEPENDENCIA_RH_CIDEJ B ON A.DEPENDENCIA = B.DEPENDENCIA AND B.ID_ESTADO = 1
            WHERE
                A.DEPENDENCIA_VIGENTE = 'S' AND
                A.UNIDAD_PRESUPUESTARIA = 'S' AND
                B.ID_DEP_RH_CIDEJ IS NULL
            ORDER BY A.FECHA_CREACION_DEPENDENCIA DESC;   
    END PROC_GET_DEP_SIN_DESPACHO; 
    
    /*Devuelve el listado completo de  dependencias nominales*/
    PROCEDURE PROC_GET_CORREOCIDEJ (
        P_CUR_DATASET   OUT SYS_REFCURSOR,
        P_MSJ           OUT VARCHAR2
    )
        AS
    BEGIN
        OPEN P_CUR_DATASET FOR 
           select * from (SELECT
                DEP.DEPENDENCIA,
                DEP.NOMBRE_DEPENDENCIA,
                DCO.ID_DEPENDENCIA_CORREO,
                DCO.CORREO_ELECTRONICO,
                DRC.ID_DEP_RH_CIDEJ,
                DRC.ID_DESPACHO,
                DEP.FECHA_CREACION_DEPENDENCIA
            FROM 
                RRHH.RH_DEPENDENCIA DEP
                    LEFT JOIN RRHH.TT_DEPENDENCIA_CORREO DCO ON DEP.DEPENDENCIA = DCO.DEPENDENCIA AND DCO.ID_ESTADO = 1
                    LEFT JOIN RRHH.TT_DEPENDENCIA_RH_CIDEJ DRC ON DEP.DEPENDENCIA = DRC.DEPENDENCIA AND DRC.ID_ESTADO = 1
            WHERE 
                DEPENDENCIA_VIGENTE = 'S' AND 
                UNIDAD_PRESUPUESTARIA = 'S'
             UNION 
                         SELECT
                DE.CODIGO_DEPENDENCIA DEPENDENCIA,
                DE.NOMBRE_DEPENDENCIA,
                DC.ID_DEPENDENCIA_CORREO,
                DC.CORREO_ELECTRONICO,
                DR.ID_DEP_RH_CIDEJ,
                DR.ID_DESPACHO,
                DE.FECHA_REGISTRO FECHA_CREACION_DEPENDENCIA
            FROM 
                 SIDEP.TT_GEST_DEPENDENCIA DE
                 LEFT JOIN RRHH.TT_DEPENDENCIA_CORREO DC ON DE.CODIGO_DEPENDENCIA = DC.DEPENDENCIA AND DC.ID_ESTADO = 1
                 LEFT JOIN RRHH.TT_DEPENDENCIA_RH_CIDEJ DR ON DE.CODIGO_DEPENDENCIA = DR.DEPENDENCIA AND DR.ID_ESTADO = 1          
            WHERE 
                DE.id_estado_proceso=2) T
          order by t.FECHA_CREACION_DEPENDENCIA;  
    END PROC_GET_CORREOCIDEJ; 
    
    
END "PKG_CATALOGOS";