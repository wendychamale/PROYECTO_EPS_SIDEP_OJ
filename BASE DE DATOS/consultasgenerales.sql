--consultas generales
select * from TT_GEST_DEPENDENCIA;

SELECT * FROM TS_ESTADO_PROCESO;

select * from RH_TIPO_AREA;

SELECT * FROM TS_TIPO_GESTION;

SELECT * FROM TC_USUARIO;
--delete  from DEPENDENCIAS_AREA_ATENDIDA where  id_gestion_dependencia=1;
select * from DEPENDENCIAS_AREA_ATENDIDA;
/
Insert into RH_TIPO_AREA (NOMBRE_AREA,ID_AREA) values ('ÁREA JURIDICCIONAL','1');
Insert into RH_TIPO_AREA (NOMBRE_AREA,ID_AREA) values ('ÁREA ADMINISTRATIVA','2');

--proceso de insertar dependencia
PROC_INS_TT_GEST_DEPENDENCIA

       p_proceso_estado_area tt_gest_dependencia.proceso_estado_area%type DEFAULT '',

update TT_GEST_DEPENDENCIA set proceso_estado_area='PRESIDENCIA' WHERE FECHA_PUBLICACION= '12/08/22'

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
                AND B.ID_ESTADO_PROCESO = DECODE(:P_ID_ESTADO_PROCESO,0, B.ID_ESTADO_PROCESO,:P_ID_ESTADO_PROCESO) 
                AND C.ID_TIPO_GESTION = DECODE(0, 0, C.ID_TIPO_GESTION, 0) 
                AND ((:P_ID_ESTADO_PROCESO=1 AND (A.PROCESO_ESTADO_AREA LIKE DECODE(:p_proceso_estado_area,'%%',A.PROCESO_ESTADO_AREA,:p_proceso_estado_area ) OR A.PROCESO_ESTADO_AREA IS NULL))
                    OR (:P_ID_ESTADO_PROCESO!=1))
                AND ((:P_ID_ESTADO_PROCESO=2 AND F.AREA_ATENDIO LIKE DECODE(:p_proceso_estado_area,'%%',F.AREA_ATENDIO,:p_proceso_estado_area))OR (:P_ID_ESTADO_PROCESO!=2))
                AND ((:P_ID_ESTADO_PROCESO=0 AND F.AREA_ATENDIO LIKE DECODE(:p_proceso_estado_area,'%%',F.AREA_ATENDIO,:p_proceso_estado_area ))OR (:P_ID_ESTADO_PROCESO!=0))
                
            ORDER BY FECHA_REGISTRO DESC; 
            
