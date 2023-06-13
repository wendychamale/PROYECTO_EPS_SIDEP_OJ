package gt.gob.oj.SIDEP.manager;

import gt.gob.oj.SIDEP.model.Archivo;
import gt.gob.oj.SIDEP.model.TtDependencia;
import gt.gob.oj.utils.Config;
import gt.gob.oj.utils.ConnectionsPool;
import gt.gob.oj.utils.jsonResult;
import oracle.jdbc.OracleTypes;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class CreaDependenciaManager {
  String SCHEMA = (new Config()).getDBSchema();
  
  Archivo archivo = new Archivo();
  
  String RUTA_ARCHIVO = "RUTA_ARCHIVO";
  
  String ARCHIVO = "ARCHIVO";
  
  public jsonResult insDependencia(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
     //Resultado de subida 
      ttDependencia.RUTA = this.archivo.getRutaArchivo(ttDependencia);
      System.out.print( "la ruta del archivo es "+ttDependencia.RUTA);
      ttDependencia.ID_TIPO_GESTION = (new Config()).getParamCrear();
      salida = insDependencia(ttDependencia, conn);
      if (salida.id > 0) {
        ttDependencia.ID_SOLICITUD = (new StringBuilder(String.valueOf(salida.id))).toString();
         boolean cargaArchivo = this.archivo.guardarArchivo(ttDependencia).booleanValue();
         System.out.print( "archivo subido "+cargaArchivo);
        //esto hay que regresarlo para validar el archivo
        //boolean cargaArchivo=true;
        if (cargaArchivo) {
          salida.result = "OK";
          conn.commit();
        } else {
          conn.rollback();
        } 
      } else {
        conn.rollback();
        salida.result = "ERROR";
        salida.id = -1;
      } 
    } catch (Exception ex) {
      StringWriter sw = new StringWriter();
      ex.printStackTrace(new PrintWriter(sw));
      String exceptionAsString = sw.toString();
      ex.printStackTrace();
      conn.rollback();
      salida.id = -1;
      salida.msj = "@" + ex.getMessage() + "@" + exceptionAsString;
      salida.result = "ERROR";
    } 
    return salida;
  }
  
  public jsonResult insDependencia(TtDependencia ttDependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
	  System. out. println("dentro de llamra a insertar......"+this.SCHEMA+"\n");
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_INS_TT_GEST_DEPENDENCIA (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    call.setString("p_codigo_dependencia", ttDependencia.CODIGO_DEPENDENCIA);
    call.setString("p_codigo_presupuestario", ttDependencia.CODIGO_PRESUPUESTARIO);
    call.setString("p_nombre_dependencia", ttDependencia.NOMBRE_DEPENDENCIA);
    call.setString("p_nombre_gafete", ttDependencia.NOMBRE_GAFETE);
    call.setString("p_nombre_abreviado", ttDependencia.NOMBRE_ABREVIADO);
    call.setString("p_nombre_documento", ttDependencia.NOMBRE_DOCUMENTO);
    call.setString("p_conector", ttDependencia.CONECTOR);
    call.setString("p_fecha_del_acuerdo", ttDependencia.FECHA_DEL_ACUERDO);
    call.setString("p_fecha_entra_vigencia", ttDependencia.FECHA_ENTRA_VIGENCIA);
    call.setString("p_fecha_anulacion", ttDependencia.FECHA_ANULACION);
    call.setString("p_referencia", ttDependencia.REFERENCIA);
    call.setString("p_funcion_unidad", ttDependencia.FUNCION_UNIDAD);
    call.setString("p_departamento", ttDependencia.DEPARTAMENTO);
    call.setString("p_municipio", ttDependencia.MUNICIPIO);
    call.setString("p_tipo_area", ttDependencia.TIPO_AREA);
    call.setString("p_ip", ttDependencia.IP);
    call.setString("p_id_usuario_registro", ttDependencia.ID_USUARIO_REGISTRO);
    call.setString("p_nombre_archivo", ttDependencia.NOMBRE_ARCHIVO);
    call.setString("p_ruta_archivo", ttDependencia.RUTA);
    call.setString("p_id_tipo_gestion", ttDependencia.ID_TIPO_GESTION);
    call.setString("p_fecha_publicacion", ttDependencia.FECHA_PUBLICACION);
    call.setString("p_obs_fecha_vigencia", ttDependencia.OBS_FECHA_VIGENCIA);
    call.setString("p_proceso_estado_area", ttDependencia.PROCESO_ESTADO_AREA);
    call.registerOutParameter("p_id_salida", OracleTypes.NUMBER);
    call.registerOutParameter("p_msj", OracleTypes.VARCHAR);
    call.execute();
    salida.id = call.getInt("p_id_salida");
    salida.msj = call.getString("p_msj");
    if (salida.id > 0)
      salida.result = "OK"; 
	  System. out. println("todo ok......"+this.SCHEMA+"\n");
    call.close();
    return salida;
  }
  
  public jsonResult modSolicitudDependencia(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
     // ttDependencia.RUTA = this.archivo.getRutaArchivo(ttDependencia);
      salida = modSolicitudDependencia(ttDependencia, conn);
      if (salida.id > 0) {
        ttDependencia.ID_SOLICITUD = (new StringBuilder(String.valueOf(salida.id))).toString();
       //Esto hay que regrearslo boolean cargaArchivo = this.archivo.guardarArchivo(ttDependencia).booleanValue();
        boolean cargaArchivo=true;
        if (cargaArchivo) {
          salida.result = "OK";
          conn.commit();
        } else {
          conn.rollback();
        } 
      } else {
        conn.rollback();
        salida.result = "ERROR";
        salida.id = -1;
      } 
    } catch (Exception ex) {
      StringWriter sw = new StringWriter();
      ex.printStackTrace(new PrintWriter(sw));
      String exceptionAsString = sw.toString();
      ex.printStackTrace();
      conn.rollback();
      salida.id = -1;
      salida.msj = "@" + ex.getMessage() + "@" + exceptionAsString;
      salida.result = "ERROR";
    } 
    return salida;
  }
  
  public jsonResult modSolicitudDependencia(TtDependencia ttDependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_MOD_TT_GEST_DEPENDENCIA(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    call.setString("p_id_gestion_dependencia", ttDependencia.ID_GESTION_DEPENDENCIA);
    call.setString("p_codigo_dependencia", ttDependencia.CODIGO_DEPENDENCIA);
    call.setString("p_codigo_presupuestario", ttDependencia.CODIGO_PRESUPUESTARIO);
    call.setString("p_nombre_dependencia", ttDependencia.NOMBRE_DEPENDENCIA);
    call.setString("p_nombre_gafete", ttDependencia.NOMBRE_GAFETE);
    call.setString("p_nombre_abreviado", ttDependencia.NOMBRE_ABREVIADO);
    call.setString("p_nombre_documento", ttDependencia.NOMBRE_DOCUMENTO);
    call.setString("p_conector", ttDependencia.CONECTOR);
    call.setString("p_fecha_del_acuerdo", ttDependencia.FECHA_DEL_ACUERDO);
    call.setString("p_fecha_entra_vigencia", ttDependencia.FECHA_ENTRA_VIGENCIA);
    call.setString("p_fecha_anulacion", ttDependencia.FECHA_ANULACION);
    call.setString("p_referencia", ttDependencia.REFERENCIA);
    call.setString("p_funcion_unidad", ttDependencia.FUNCION_UNIDAD);
    call.setString("p_departamento", ttDependencia.DEPARTAMENTO);
    call.setString("p_municipio", ttDependencia.MUNICIPIO);
    call.setString("p_tipo_area", ttDependencia.TIPO_AREA);
    call.setString("p_ip", ttDependencia.IP);
    call.setString("p_id_usuario_registro", ttDependencia.ID_USUARIO_REGISTRO);
    call.setString("p_nombre_archivo", ttDependencia.NOMBRE_ARCHIVO);
    call.setString("p_ruta_archivo", ttDependencia.RUTA);
    call.setString("p_fecha_publicacion", ttDependencia.FECHA_PUBLICACION);
    call.setString("p_obs_fecha_vigencia", ttDependencia.OBS_FECHA_VIGENCIA);
    call.setString("p_proceso_estado_area", ttDependencia.PROCESO_ESTADO_AREA);
    call.registerOutParameter("p_id_salida", OracleTypes.NUMBER);
    call.registerOutParameter("p_msj", OracleTypes.VARCHAR);
    call.execute();
    salida.id = call.getInt("p_id_salida");
    salida.msj = call.getString("p_msj");
    if (salida.id > 0)
      salida.result = "OK"; 
    call.close();
    return salida;
  }
  
  public jsonResult insDependenciaNominal(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      salida = insDependenciaNominal(ttDependencia, conn);
      if (salida.id > 0) {
        salida.result = "OK";
        conn.commit();
      } 
    } catch (Exception ex) {
      StringWriter sw = new StringWriter();
      ex.printStackTrace(new PrintWriter(sw));
      String exceptionAsString = sw.toString();
      ex.printStackTrace();
      conn.rollback();
      salida.id = -1;
      salida.msj = "@" + ex.getMessage() + "@" + exceptionAsString;
      salida.result = "ERROR";
    } 
    return salida;
  }
  
  public jsonResult insDependenciaNominal(TtDependencia ttDependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_PROCESA_SOL_CREACION(?,?,?,?,?,?,?)");
    call.setString("p_id_gestion_dependencia", ttDependencia.ID_GESTION_DEPENDENCIA);
    call.setString("p_observaciones", ttDependencia.OBSERVACIONES);
    call.setString("p_ip", ttDependencia.IP);
    call.setString("p_id_usuario_registro", ttDependencia.ID_USUARIO_REGISTRO);
    call.setString("p_usuario", ttDependencia.USUARIO);
    call.registerOutParameter("p_id_salida", OracleTypes.NUMBER);
    call.registerOutParameter("p_msj", OracleTypes.VARCHAR);
    call.execute();
    salida.id = call.getInt("p_id_salida");
    salida.msj = call.getString("p_msj");
    if (salida.id > 0)
      salida.result = "OK"; 
    call.close();
    return salida;
  }
  
  public List<Map<String, Object>> getGestion(int P_ID_GESTION_DEPENDENCIA) throws Exception {
    List<Map<String, Object>> salida = new ArrayList<>();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_GET_GESTION(?,?,?)");
    call.setInt("P_ID_GESTION", P_ID_GESTION_DEPENDENCIA);
    call.registerOutParameter("P_CUR_DATASET", OracleTypes.CURSOR);
    call.registerOutParameter("P_MSJ", OracleTypes.VARCHAR);
    call.execute();
    ResultSet rset = (ResultSet)call.getObject("P_CUR_DATASET");
    ResultSetMetaData meta = rset.getMetaData();
    while (rset.next()) {
      Map<String, Object> map = new HashMap<>();
      for (int i = 1; i <= meta.getColumnCount(); i++) {
        String key = meta.getColumnName(i).toString();
        String value = Objects.toString(rset.getString(key), "");
        map.put(key, value);
      } 
      salida.add(map);
    } 
    rset.close();
    call.close();
    conn.close();
    return salida;
  }
}
