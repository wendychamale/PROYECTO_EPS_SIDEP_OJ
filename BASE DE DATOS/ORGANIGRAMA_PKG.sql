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
   
   PROCEDURE PROC_DELETE_RH_AREA_DEPARTAMENTO (
   p_codigo_area        RH_AREA_DEPARTAMENTO.codigo_Area%TYPE DEFAULT 0,
    P_CUR_DATASET OUT SYS_REFCURSOR,
   P_MSJ OUT VARCHAR2
   ); 
    PROCEDURE PROC_INSERT_RH_AREA_DEPARTAMENTO (
       p_area_padre        RH_AREA_DEPARTAMENTO.area_padre%TYPE ,
       p_nombre_area       RH_AREA_DEPARTAMENTO.nombre_area%TYPE,
         p_id_salida OUT NUMBER,
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
            (select count (1) from SIDEP.RH_AREA_DEPARTAMENTO where area_padre=a.codigo_area and estado='S') as HIJOS
            from(
            SELECT codigo_area,nombre_area,descripcion_area,area_padre
            FROM SIDEP.RH_AREA_DEPARTAMENTO 
            WHERE area_padre = 0
            and estado='S'
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
            (select count (*) from SIDEP.RH_AREA_DEPARTAMENTO where area_padre=a.codigo_area AND ESTADO='S') as HIJOS
            
            from(
            SELECT codigo_area,nombre_area,descripcion_area,area_padre
            FROM SIDEP.RH_AREA_DEPARTAMENTO 
            WHERE area_padre = p_area_padre
            and estado='S'
            ORDER BY CODIGO_AREA asc 
            ) a;
            
            
    END PROC_INS_RH_AREA_DEPARTAMENTO;   --fin de procedure PROC_INS_TC_USUARIO   4

 PROCEDURE PROC_DELETE_RH_AREA_DEPARTAMENTO (
       p_codigo_area        RH_AREA_DEPARTAMENTO.codigo_Area%TYPE DEFAULT 0,
       P_CUR_DATASET OUT SYS_REFCURSOR,
       P_MSJ OUT VARCHAR2
     )
        IS
   /*  PROCESO CREADO PARA CONSULTAR HIJOS DE AREAS PADRES 
  */ 
   padre number;
    BEGIN
            UPDATE SIDEP.RH_AREA_DEPARTAMENTO set estado='N'
            WHERE CODIGO_AREA = p_codigo_area;
           
            select  to_char(area_padre) into padre from SIDEP.RH_AREA_DEPARTAMENTO 
            WHERE CODIGO_AREA = p_codigo_area;
            
                OPEN P_CUR_DATASET FOR 
            /* Formatted on 05/09/2022  */
            select a.codigo_area,a.nombre_area,a.descripcion_area,area_padre,
            (select count (*) from SIDEP.RH_AREA_DEPARTAMENTO where area_padre=a.codigo_area AND ESTADO='S') as HIJOS
            
            from(
            SELECT codigo_area,nombre_area,descripcion_area,area_padre
            FROM SIDEP.RH_AREA_DEPARTAMENTO 
            WHERE codigo_area = padre
            and estado='S'
            ORDER BY CODIGO_AREA asc 
            ) a;
             p_msj:='OK';
           EXCEPTION
        WHEN OTHERS THEN
            p_msj := '@error al eliminar la dependencia del organigrama'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;          
            
    END PROC_DELETE_RH_AREA_DEPARTAMENTO;   --fin de procedure PROC_INS_TC_USUARIO   4

 PROCEDURE PROC_INSERT_RH_AREA_DEPARTAMENTO (
       p_area_padre        RH_AREA_DEPARTAMENTO.area_padre%TYPE ,
       p_nombre_area       RH_AREA_DEPARTAMENTO.nombre_area%TYPE,
       p_id_salida OUT NUMBER,
       P_MSJ OUT VARCHAR2
     )
        IS
   /*  PROCESO CREADO PARA CONSULTAR HIJOS DE AREAS PADRES 
  */ 
    BEGIN    
              insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
              values (SQ_RH_AREA_DEPARTAMENTO.nextval,p_nombre_area,'Nueva area creada por '|| user,p_area_padre);
             p_id_salida:=1;
             p_msj:='OK';
           EXCEPTION
        WHEN OTHERS THEN
          p_id_salida:=-1;
            p_msj := '@error al insertar la dependencia del organigrama'
            || ' -CODE-'
            || sqlcode
            || ' -ERROR- '
            || sqlerrm
            || '-ERROR_STACK-'
            || dbms_utility.format_error_stack
            || '-ERROR_BACKTRACE-'
            || dbms_utility.format_error_backtrace;          
            
    END PROC_INSERT_RH_AREA_DEPARTAMENTO;   --fin de procedure PROC_INS_TC_USUARIO   4



END PKG_ORGANIGRAMA;
/
