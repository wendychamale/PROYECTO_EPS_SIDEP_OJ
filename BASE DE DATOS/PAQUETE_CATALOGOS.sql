CREATE OR REPLACE PACKAGE RRHH."PKG_CATALOGOS"
AS
    PROCEDURE PROC_GET_DEPARTAMENTO (p_cur_dataset OUT SYS_REFCURSOR,p_msj OUT VARCHAR2 );
    PROCEDURE PROC_GET_MUNICIPIO (P_ID_DEPARTAMENTO IN RRHH.RH_MUNICIPIO.DEPARTAMENTO%TYPE, P_CUR_DATASET OUT SYS_REFCURSOR,P_MSJ OUT VARCHAR2);
    PROCEDURE PROC_GET_DEP_AREA (P_CUR_DATASET OUT SYS_REFCURSOR,P_MSJ OUT VARCHAR2);
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
    
    
    
END "PKG_CATALOGOS";
/
