package gt.gob.oj.SIDEP.manager;

import gt.gob.oj.SIDEP.model.Archivo;
import gt.gob.oj.SIDEP.model.TtDependencia;
import gt.gob.oj.utils.Config;
import gt.gob.oj.utils.ConnectionsPool;
import gt.gob.oj.utils.CustomException;
import gt.gob.oj.utils.jsonResult;
import oracle.jdbc.OracleTypes;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.CallableStatement;
import java.sql.Connection;

public class BajaDependenciaManager {
  String SCHEMA = (new Config()).getDBSchema();
  
  Archivo archivo = new Archivo();
  
  String RUTA_ARCHIVO = "RUTA_ARCHIVO";
  
  String ARCHIVO = "ARCHIVO";
  
  public jsonResult insSolitudBajaDependencia(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      ttDependencia.RUTA = this.archivo.getRutaArchivo(ttDependencia);
      ttDependencia.ID_TIPO_GESTION = (new Config()).getParamBaja();
      salida = insSolitudBajaDependencia(ttDependencia, conn);
      if (salida.id > 0) {
        ttDependencia.ID_SOLICITUD = (new StringBuilder(String.valueOf(salida.id))).toString();
        boolean cargaArchivo = this.archivo.guardarArchivo(ttDependencia).booleanValue();
        if (cargaArchivo) {
          salida.result = "OK";
          conn.commit();
        } else {
          salida.msj = "Error - No se puedo cargar el archivo";
          conn.rollback();
          throw new CustomException(salida.msj);
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
  
  public jsonResult insSolitudBajaDependencia(TtDependencia ttDependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_BAJA_TT_GEST_DEPENDENCIA (?,?,?,?,?,?,?,?,?,?,?)");
    call.setString("p_codigo_dependencia", ttDependencia.CODIGO_DEPENDENCIA);
    call.setString("p_codigo_presupuestario", ttDependencia.CODIGO_PRESUPUESTARIO);
    call.setString("p_nombre_dependencia", ttDependencia.NOMBRE_DEPENDENCIA);
    call.setString("p_fecha_anulacion", ttDependencia.FECHA_ANULACION);
    call.setString("p_referencia", ttDependencia.REFERENCIA);
    call.setString("p_id_usuario_registro", ttDependencia.ID_USUARIO_REGISTRO);
    call.setString("p_nombre_archivo", ttDependencia.NOMBRE_ARCHIVO);
    call.setString("p_ruta_archivo", ttDependencia.RUTA);
    call.setString("p_ip", ttDependencia.IP);
    call.registerOutParameter("p_id_salida",OracleTypes.VARCHAR);
    call.registerOutParameter("p_msj", OracleTypes.VARCHAR);
    call.execute();
    salida.id = call.getInt("p_id_salida");
    salida.msj = call.getString("p_msj");
    if (salida.id > 0)
      salida.result = "OK"; 
    call.close();
    return salida;
  }
  
  public jsonResult modSolitudBajaDependencia(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      ttDependencia.RUTA = this.archivo.getRutaArchivo(ttDependencia);
      ttDependencia.ID_TIPO_GESTION = (new Config()).getParamBaja();
      salida = modSolitudBajaDependencia(ttDependencia, conn);
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
  
  public jsonResult modSolitudBajaDependencia(TtDependencia ttDependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_MOD_BAJA_GEST_DEPENDENCIA (?,?,?,?,?,?,?,?,?,?,?,?)");
    call.setString("p_id_gestion_dependencia", ttDependencia.ID_GESTION_DEPENDENCIA);
    call.setString("p_codigo_dependencia", ttDependencia.CODIGO_DEPENDENCIA);
    call.setString("p_codigo_presupuestario", ttDependencia.CODIGO_PRESUPUESTARIO);
    call.setString("p_nombre_dependencia", ttDependencia.NOMBRE_DEPENDENCIA);
    call.setString("p_fecha_anulacion", ttDependencia.FECHA_ANULACION);
    call.setString("p_referencia", ttDependencia.REFERENCIA);
    call.setString("p_id_usuario_registro", ttDependencia.ID_USUARIO_REGISTRO);
    call.setString("p_nombre_archivo", ttDependencia.NOMBRE_ARCHIVO);
    call.setString("p_ruta_archivo", ttDependencia.RUTA);
    call.setString("p_ip", ttDependencia.IP);
    call.registerOutParameter("p_id_salida", OracleTypes.VARCHAR);
    call.registerOutParameter("p_msj", OracleTypes.VARCHAR);
    call.execute();
    salida.id = call.getInt("p_id_salida");
    salida.msj = call.getString("p_msj");
    if (salida.id > 0)
      salida.result = "OK"; 
    call.close();
    return salida;
  }
  
  public jsonResult procBajaDependencia(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      salida = procBajaDependencia(ttDependencia, conn);
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
  
  public jsonResult procBajaDependencia(TtDependencia ttDependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_BAJA_DEPENDENCIA (?,?,?,?,?,?,?)");
    call.setString("p_id_gestion_dependencia", ttDependencia.ID_GESTION_DEPENDENCIA);
    call.setString("p_observaciones", ttDependencia.OBSERVACIONES);
    call.setString("p_ip", ttDependencia.IP);
    call.setString("p_id_usuario_registro", ttDependencia.ID_USUARIO_REGISTRO);
    call.setString("p_usuario", ttDependencia.USUARIO);
    call.registerOutParameter("p_id_salida", OracleTypes.VARCHAR);
    call.registerOutParameter("p_msj", OracleTypes.VARCHAR);
    call.execute();
    salida.id = call.getInt("p_id_salida");
    salida.msj = call.getString("p_msj");
    if (salida.id > 0)
      salida.result = "OK"; 
    call.close();
    return salida;
  }
  
  public jsonResult getPlazaDependencia(int p_codigo_dependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_GET_PLAZAS_DEPENDENCIA(?,?,?)");
    call.setInt("p_codigo_dependencia", p_codigo_dependencia);
    call.registerOutParameter("p_id_salida", OracleTypes.NUMBER);
    call.registerOutParameter("p_msj", OracleTypes.VARCHAR);
    call.execute();
    salida.id = call.getInt("p_id_salida");
    salida.msj = call.getString("p_msj");
    if (salida.id >= 0)
      salida.result = "ok"; 
    call.close();
    conn.close();
    return salida;
  }
}
