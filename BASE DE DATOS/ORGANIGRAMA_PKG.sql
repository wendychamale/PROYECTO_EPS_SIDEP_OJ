--
-- PKG_INSERTS  (Package) 
--
CREATE OR REPLACE PACKAGE SIDEP.PKG_ORGANIGRAMA AS 
PROCEDURE PROC_INS_RH_PADRE (
   P_CUR_DATASET OUT SYS_REFCURSOR,
   P_MSJ OUT VARCHAR2
   );         
PROCEDURE PROC_INS_RH_AREA_DEPARTAMENTO (
   p_area_padre         RH_AREA_DEPARTAMENTO.AREA_PADRE%TYPE DEFAULT 0,
   P_CUR_DATASET OUT SYS_REFCURSOR,
   P_MSJ OUT VARCHAR2
   );  
END PKG_ORGANIGRAMA;
/


--
-- PKG_ORGANIGRAMA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY SIDEP.PKG_ORGANIGRAMA AS
     PROCEDURE PROC_INS_RH_PADRE (
       P_CUR_DATASET OUT SYS_REFCURSOR,
       P_MSJ OUT VARCHAR2
     )
        IS
   /*  PROCESO CREADO PARA CONSULTAR HIJOS DE AREAS PADRES 
  */
    BEGIN
        
     OPEN P_CUR_DATASET FOR 
            /* Formatted on 05/09/2022  */
            select a.codigo_area,a.nombre_area,a.descripcion_area,area_padre,
            (select count (1) from SIDEP.RH_AREA_DEPARTAMENTO where area_padre=a.codigo_area) as HIJOS
            from(
            SELECT codigo_area,nombre_area,descripcion_area,area_padre
            FROM SIDEP.RH_AREA_DEPARTAMENTO 
            WHERE area_padre = 0
            ) a ;
            
            
    END PROC_INS_RH_PADRE;   --fin de procedure PROC_INS_TC_USUARIO   4

    PROCEDURE PROC_INS_RH_AREA_DEPARTAMENTO (
       p_area_padre        RH_AREA_DEPARTAMENTO.AREA_PADRE%TYPE DEFAULT 0,
       P_CUR_DATASET OUT SYS_REFCURSOR,
       P_MSJ OUT VARCHAR2
     )
        IS
   /*  PROCESO CREADO PARA CONSULTAR HIJOS DE AREAS PADRES 
  */
    BEGIN
        
     OPEN P_CUR_DATASET FOR 
            /* Formatted on 05/09/2022  */
            select a.codigo_area,a.nombre_area,a.descripcion_area,area_padre,
            (select count (*) from SIDEP.RH_AREA_DEPARTAMENTO where area_padre=a.codigo_area) as HIJOS
            
            from(
            SELECT codigo_area,nombre_area,descripcion_area,area_padre
            FROM SIDEP.RH_AREA_DEPARTAMENTO 
            WHERE area_padre = p_area_padre
            ORDER BY CODIGO_AREA asc 
            ) a;
            
            
    END PROC_INS_RH_AREA_DEPARTAMENTO;   --fin de procedure PROC_INS_TC_USUARIO   4



END PKG_ORGANIGRAMA;
/
