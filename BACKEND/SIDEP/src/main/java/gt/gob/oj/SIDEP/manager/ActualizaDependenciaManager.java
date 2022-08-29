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

public class ActualizaDependenciaManager {
  String SCHEMA = (new Config()).getDBSchema();
  
  Archivo archivo = new Archivo();
  
  String RUTA_ARCHIVO = "RUTA_ARCHIVO";
  
  String ARCHIVO = "ARCHIVO";
  
  public jsonResult insSolitudActDependencia(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      ttDependencia.RUTA = this.archivo.getRutaArchivo(ttDependencia);
      ttDependencia.ID_TIPO_GESTION = (new Config()).getParamBaja();
      salida = insSolitudActDependencia(ttDependencia, conn);
      if (salida.id > 0) {
        ttDependencia.ID_SOLICITUD = (new StringBuilder(String.valueOf(salida.id))).toString();
        boolean cargaArchivo = this.archivo.guardarArchivo(ttDependencia).booleanValue();
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
  
  public jsonResult insSolitudActDependencia(TtDependencia ttDependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_ACT_TT_GEST_DEPENDENCIA (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    call.setString("p_codigo_dependencia", ttDependencia.CODIGO_DEPENDENCIA);
    call.setString("p_conector_dependencia", ttDependencia.CONECTOR);
    call.setString("p_funcion_unidad", ttDependencia.FUNCION_UNIDAD);
    call.setString("p_referencia", ttDependencia.REFERENCIA);
    call.setString("p_id_area", ttDependencia.TIPO_AREA);
    call.setString("p_fecha_creacion_dependencia", ttDependencia.FECHA_DEL_ACUERDO);
    call.setString("p_fecha_entra_vigencia", ttDependencia.FECHA_ENTRA_VIGENCIA);
    call.setString("p_id_usuario_registro", ttDependencia.ID_USUARIO_REGISTRO);
    call.setString("p_nombre_archivo", ttDependencia.NOMBRE_ARCHIVO);
    call.setString("p_ruta_archivo", ttDependencia.RUTA);
    call.setString("p_ip", ttDependencia.IP);
    call.setString("p_fecha_publicacion", ttDependencia.FECHA_PUBLICACION);
    call.setString("p_obs_fecha_vigencia", ttDependencia.OBS_FECHA_VIGENCIA);
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
  
  public jsonResult modSolitudActDependencia(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      ttDependencia.RUTA = this.archivo.getRutaArchivo(ttDependencia);
      ttDependencia.ID_TIPO_GESTION = (new Config()).getParamBaja();
      salida = modSolitudActDependencia(ttDependencia, conn);
      if (salida.id > 0) {
        ttDependencia.ID_SOLICITUD = (new StringBuilder(String.valueOf(salida.id))).toString();
        boolean cargaArchivo = this.archivo.guardarArchivo(ttDependencia).booleanValue();
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
      conn.commit();
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
  
  public jsonResult modSolitudActDependencia(TtDependencia ttDependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_MOD_ACT_GEST_DEPENDENCIA (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    call.setString("p_id_gestion_dependencia", ttDependencia.ID_GESTION_DEPENDENCIA);
    call.setString("p_conector_dependencia", ttDependencia.CONECTOR);
    call.setString("p_funcion_unidad", ttDependencia.FUNCION_UNIDAD);
    call.setString("p_referencia", ttDependencia.REFERENCIA);
    call.setString("p_id_area", ttDependencia.TIPO_AREA);
    call.setString("p_fecha_creacion_dependencia", ttDependencia.FECHA_DEL_ACUERDO);
    call.setString("p_fecha_entra_vigencia", ttDependencia.FECHA_ENTRA_VIGENCIA);
    call.setString("p_id_usuario_registro", ttDependencia.ID_USUARIO_REGISTRO);
    call.setString("p_nombre_archivo", ttDependencia.NOMBRE_ARCHIVO);
    call.setString("p_ruta_archivo", ttDependencia.RUTA);
    call.setString("p_ip", ttDependencia.IP);
    call.setString("p_fecha_publicacion", ttDependencia.FECHA_PUBLICACION);
    call.setString("p_obs_fecha_vigencia", ttDependencia.OBS_FECHA_VIGENCIA);
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
  
  public jsonResult procActDependencia(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      salida = procActDependencia(ttDependencia, conn);
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
  
  public jsonResult procActDependencia(TtDependencia ttDependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_ACTUALIZA_DEPENNOMINAL (?,?,?,?,?,?,?)");
    call.setString("p_id_gest_dependencia", ttDependencia.ID_GESTION_DEPENDENCIA);
    call.setString("p_observaciones", ttDependencia.OBSERVACIONES);
    call.setString("p_id_usuario_registro", ttDependencia.ID_USUARIO_REGISTRO);
    call.setString("p_ip", ttDependencia.IP);
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
}

