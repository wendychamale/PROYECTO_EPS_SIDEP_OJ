package gt.gob.oj.SIDEP.manager;

import gt.gob.oj.SIDEP.model.Archivo;
import gt.gob.oj.SIDEP.model.TtDepenDespacho;
import gt.gob.oj.utils.Config;
import gt.gob.oj.utils.ConnectionsPool;
import gt.gob.oj.utils.jsonResult;
import oracle.jdbc.OracleTypes;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.CallableStatement;
import java.sql.Connection;

public class DepenDespachoManager {
  String SCHEMA = (new Config()).getDBSchema();
  
  Archivo archivo = new Archivo();
  
  String RUTA_ARCHIVO = "RUTA_ARCHIVO";
  
  String ARCHIVO = "ARCHIVO";
  
  public jsonResult insDependenciaDespacho(TtDepenDespacho ttDepenDespacho) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      salida = insDependenciaDespacho(ttDepenDespacho, conn);
      if (salida.id > 0) {
        salida.result = "OK";
        conn.commit();
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
  
  public jsonResult insDependenciaDespacho(TtDepenDespacho ttDepenDespacho, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_INS_TT_DEP_RH_CIDEJ (?,?,?,?,?,?,?)");
    call.setString("p_id_depen_RH_CIDEJ", ttDepenDespacho.ID_DEP_RH_CIDEJ);
    call.setString("p_dependencia", ttDepenDespacho.DEPENDENCIA);
    call.setString("p_id_despacho", ttDepenDespacho.ID_DESPACHO);
    call.setString("p_id_usuario_registro", ttDepenDespacho.ID_USUARIO_REGISTRO);
    call.setString("p_ip", ttDepenDespacho.IP);
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
}