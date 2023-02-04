 --- Area Principal
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Corte Suprema de Justicia','Area principal',0);
  
   -- Hijos de Area principal 1
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Area Administrativa','Area principal',1);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Area Juridiccional','Area principal',1);
  
  --Hijos del area administrativa 2
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Secretaria de la Corte Suprema de Justicia','Area Administrativa',2);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Presidencia del Organismo Judicial','Area Administrativa',2);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Consejo de la carrera Judicional','Area Administrativa',2);
  
  
    --Hijos del area Juridiccional 3
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Camara Penal','Area Juridiccional',3);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Camara Civil','Area Juridiccional',3);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Camara de Amparos y Antejuicios','Area Juridiccional',3);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Salas Penales','Area Juridiccional',3);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Salas Civiles','Area Juridiccional',3);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Salas Mixtas Departamentales','Area Juridiccional',3);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Salas de Familia','Area Juridiccional',3);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Salas de Trabajo y Prevencion Social','Area Juridiccional',3);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Salas de la Ninez y Adolecencia','Area Juridiccional',3);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Tribunal de Segunda Instancia de Cuentas y de Conflictos de Juridiccion','Area Juridiccional',3);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Salas del Tribunal de lo Contencioso Administrativo','Area Juridiccional',3);
  
  
  -- Hijos de Secretaria de la Corte Suprema de Justicia 4
  -- No tiene
  
    
  --Hijos- Presidencia del Organismo Judicial 5
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Consejo Consultor del Sistema de Integridad Institucional','Presidencia del Organismo Judicial',5);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Asesoria Juridica','Presidencia del Organismo Judicial',5);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Secretaria de Planificacion y Desarrollo Institucional','Presidencia del Organismo Judicial',5);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Secretaria General de la Presidencia','Presidencia del Organismo Judicial',5);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Auditoria Interna','Presidencia del Organismo Judicial',5);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Secretaria de la Mujer y Analisis de Genero','Presidencia del Organismo Judicial',5);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Archivo General de Protocolos','Presidencia del Organismo Judicial',5);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Secretaria de Fortalecimiento Judicial Y Cooperacion','Presidencia del Organismo Judicial',5);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Direccion de Seguridad Institucional','Presidencia del Organismo Judicial',5);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Secretaria de Comunicacion Social y Protocolo','Presidencia del Organismo Judicial',5);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Secretaria de Pueblos Indigenas','Presidencia del Organismo Judicial',5);
  /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Secretaria de Proteccion para la Ninez y Adolecencia y Justicia Penal Juvenil','Presidencia del Organismo Judicial',5);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Direccion de Metodos Administrativos de Solucion de Conflictos','Presidencia del Organismo Judicial',5);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Direccion de Servicios de Gestion Tributaria','Presidencia del Organismo Judicial',5); 
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Direccion de Gestion Laboral','Presidencia del Organismo Judicial',5);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Direccion de Gestion  de Familiar','Presidencia del Organismo Judicial',5);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Centro de Servicios Auxiliares de la Administracion de Justicia Penal','Presidencia del Organismo Judicial',5);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Centro de Informacion, Desarrollo y Estadistica Judicial','Presidencia del Organismo Judicial',5);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Centro Nacional de Analisis y Documentacion Judicial','Presidencia del Organismo Judicial',5);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Gerencia General','Presidencia del Organismo Judicial',5);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Unidad de control','Presidencia del Organismo Judicial',5);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Unidad de Antecedentes Penales','Presidencia del Organismo Judicial',5);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Unidad de Informacion Publica','Presidencia del Organismo Judicial',5);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Unidad Especial de Ejecucion de Control de Prestamos Para la Ejecucion del Programa UEEA','Presidencia del Organismo Judicial',5);
  
  
  
  -- HIJOS DE Consejo de la carrera Judicional 6
  -- NO TIENE
  
  --HIJOS DE CAMARA PENAL 7
  -- NO TIENE
  
    --HIJOS DE Camara Civil 8
  -- NO TIENE
  
  --HIJOS DE Camara de Amparos y Antejuicios 9
  --NO TIENE
  
   --HIJOS DE Salas Penales 10
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Juzgados de Primera Instancia de Juridiccion Penal','Salas Penales',10);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Juzgado de primera Instancia Penal Narcoactividad y Delitos','Salas Penales',10);
   /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Juzgado de Primera Instancia Mayor','Salas Penales',10);
  /
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Juzgado de Primera Instancia Extencion de Dominio','Salas Penales',10);
  /
   insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Instancia de Sentencia Penal de Narcoactividad','Salas Penales',10);
 
  --HIJOS DE Salas Civiles 11
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Juzgado de Primera Instancia Civil','Salas Civiles',11);
   
    --HIJOS DE Salas Mixtas Departamentales 12
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Tribunales de Sentencia Penal, Narcoactividad y Delitos contra el Ambiente','Salas Mixtas Departamentales',12);

--HIJOS DE Salas de Familia 13
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Juzgado de Primera Instancia de Familia','Salas de Familia',13);
   
   --HIJOS DE Salas de Trabajo y Prevencion Social Departamentales 14
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Juzgado de Primera Instancia de Trabajo y Prevencion Social','Salas de Trabajo y Prevencion Social',14);

--HIJOS DE Salas de la Ninez y Adolesencia 15
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Juzgado de Primera Instancia de la Ninez y Adolesencia','Salas de la Ninez y Adolesencia',15);

--HIJOS DE Tribunal de Segunda Instancia de Cuentas y de Conflictos de Juridiccion 16
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Tribunal de Segunda Instancia de Cuentas','Tribunal de Segunda Instancia de Cuentas y de Conflictos de Juridiccion',16);
 /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Tribunal de Segunda Instancia de Lo Economico Coactivo','Tribunal de Segunda Instancia de Cuentas y de Conflictos de Juridiccion',16);
 /
  --HIJOS DE  Salas del Tribunal de lo Contencioso Administrativo 17
 -- No tiene
 
   --HIJOS DE  Consejo Consultor del Sistema de Integridad Institucional 18
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Unidad Ejecutora del Sistema de Integridad Institucional','Consejo Consultor del Sistema de Integridad Institucional',18);
 
 --HIJOS DE  Asesoria Juridica 19
  -- No tiene
  
    --HIJOS DE  Secretaria de Planificacion y Desarrollo  20
  -- No tiene
  
   --HIJOS DE  Secretaria General de la Presidencia 21
  -- No tiene
  
    --HIJOS DE  Auditoria Interna  22
  -- No tiene
  
     --HIJOS DE Secretaria de la Mujer y Analisis de Genero  23
  -- No tiene
  
   --HIJOS DE  Archivo General de Protocolos 24
  -- No tiene
  
    --HIJOS DE Secretaria de Fortalecimiento Judicial Y Cooperacion 25
  -- No tiene
  
  --HIJOS DE Direccion de Seguridad Institucional  26
  -- No tiene
  
     --HIJOS DE Secretaria de Comunicacion Social y Protocolo  27
  -- No tiene
  
   --HIJOS DE Secretaria de Pueblos Indigenas 28
  -- No tiene
  
    --HIJOS DE Secretaria de Proteccion para la Ninez y Adolecencia y Justicia 29
  -- No tiene
   
  --HIJOS DE Direccion de Metodos Administrativos de Solucion de Conflictos 30
  -- No tiene 
  
  --HIJOS DE Direccion de Servicios de Gestion Tributaria 31
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Almacen Judicial','Direccion de Servicios de Gestion Tributaria',31);
 /
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Archivo General de Tribunales','Direccion de Servicios de Gestion Tributaria',31);
 /
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Centro de Servicios Auxiliares','Direccion de Servicios de Gestion Tributaria',31);
   --HIJOS DE Direccion de Gestion Laboral 32
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Centro de Servicios Auxiliares de la Administracion de Justicia Laboral','Direccion de Gestion Laboral',32);
 
 --HIJOS DE Direccion de Gestion  de Familia 33
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Centro de Servicios Auxiliares de la Administracion de Justicia Familiar','Direccion de Gestion  de Familia',33);


--hijos de Centro de Servicios Auxiliares de la Administracion de Justicia Penal 34
-- no tiene

--hijos de entro de Informacion, Desarrollo y Estadistica Judicial 35
-- no tiene

--hijos de Centro Nacional de Analisis y Documentacion Judicial 36
-- no tiene

--hijos de Gerencia General 37 
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Centro de Informatica y Telecomunicaciones','Gerencia General',37);
 /
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Gerencia de Recursos Humanos','Gerencia General',37);
 /
  insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Gerencia de Bienes y Suministros','Gerencia General',37);
 /
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Gerencia Administrativa','Gerencia General',37);
 /
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Gerencia de Infraestructura','Gerencia General',37);
 /
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Coordinaciones Regionales','Gerencia General',37);
  
 --hijos de Unidad de control 38
-- no tiene

 --hijos de Unidad de Antecedentes Penales 39
-- no tiene

 --hijos de Unidad de Informacion Publica 40
-- no tiene

 --hijos de Unidad Especial de Ejecucion de Control de Prestamos Para la Ejecucion del Programa UEEA 41
-- no tiene
--hijos de Juzgados de Primera Instancia de Juridiccion Penal 42 
-- no tiene

--hijos de Juzgado de primera Instancia Penal Interoactividad y Delitos 43
-- no tiene

--hijos de Juzgado de Primera Instancia Mayor 44
-- no tiene

--hijos Juzgado de Primera Instancia Extencion de Dominio 45
-- no tiene

--hijos de Instancia de Sentencia Penal de Narcoactividad 46
-- no tiene

--hijos Asociado de Primera Instancia Civil 47
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Juzgado de Paz Civil','Asociado de Primera Instancia Civil',47);
 
--hijos Tribunales de Sentencia Penal, Narcoactividad y Delitos contra el Ambiente 48
-- no tiene
 insert into RH_AREA_DEPARTAMENTO (CODIGO_AREA,NOMBRE_AREA,DESCRIPCION_AREA,AREA_PADRE)
  values (SQ_RH_AREA_DEPARTAMENTO.nextval,'Juzgado de Paz Mixto','Tribunales de Sentencia Penal, Narcoactividad y Delitos contra el Ambiente',48);
 
 
--hijos de Juzgado de Primera Instancia de Familia 49
-- no tiene

 --hijos de Juzgado de Primera Instancia de Trabajo y Prevencion Social 50
-- no tiene
 
  --hijos de Juzgado de Primera Instancia de la Ninez y Adolesencia 51
-- no tiene

  --hijos de Tribunal de Segunda Instancia de Cuentas 52
-- no tiene

  --hijos de Tribunal de Segunda Instancia de Lo Economico Coactivo 53
-- no tiene
 
--hijos de Unidad Ejecutora del Sistema de Integridad Institucional 54
-- no tiene

--hijos de Almacen Judicial 55
-- no tiene

--hijos Archivo General de Tribunales 56
-- no tiene


--hijos Centro de Servicios Auxiliares 57
-- no tiene

--hijos Centro de Servicios Auxiliares de la Administracion de Justicia 58
-- no tiene

--hijos Centro de Servicios Auxiliares de la Administracion de Justicia Familiar 59
-- no tiene

--hijos de Centro de Informatica y Telecomunicaciones 60
-- no tiene

--hijos de Gerencia de Recursos Humanos 61
-- no tiene

--hijos de Gerencia de Bienes y Suministros 62
-- no tiene

--hijos de Gerencia Administrativa 63
-- no tiene

--hijos de Gerencia de Infraestructura 64
-- no tiene

--hijos de Coordinaciones Regionales 65
-- no tiene

--hijos de Juzgado de Paz Civil 66
-- no tiene

--hijos de Juzgado de Paz Mixto 67
-- no tiene