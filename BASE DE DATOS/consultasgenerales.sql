--consultas generales
select * from TT_GEST_DEPENDENCIA;

SELECT * FROM TS_ESTADO_PROCESO;

select * from RH_TIPO_AREA;

/
Insert into RH_TIPO_AREA (NOMBRE_AREA,ID_AREA) values ('ÁREA JURIDICCIONAL','1');
Insert into RH_TIPO_AREA (NOMBRE_AREA,ID_AREA) values ('ÁREA ADMINISTRATIVA','2');

--proceso de insertar dependencia
PROC_INS_TT_GEST_DEPENDENCIA

       p_proceso_estado_area tt_gest_dependencia.proceso_estado_area%type DEFAULT '',

update TT_GEST_DEPENDENCIA set proceso_estado_area='PRESIDENCIA' WHERE FECHA_PUBLICACION= '12/08/22'
