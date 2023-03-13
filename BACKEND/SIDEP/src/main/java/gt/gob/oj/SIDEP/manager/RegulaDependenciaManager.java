package gt.gob.oj.SIDEP.manager;

import gt.gob.oj.SIDEP.manager.CreaDependenciaManager;
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

public class RegulaDependenciaManager {
  CreaDependenciaManager creaSolicitud = new CreaDependenciaManager();
  
  String SCHEMA = (new Config()).getDBSchema();
  
  Archivo archivo = new Archivo();
  
  String RUTA_ARCHIVO = "RUTA_ARCHIVO";
  
  String ARCHIVO = "ARCHIVO";
  
  public jsonResult insSolicitudRegularizacion(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      ttDependencia.RUTA = this.archivo.getRutaArchivo(ttDependencia);
      ttDependencia.ID_TIPO_GESTION = (new Config()).getParamRegularizacion();
      salida = this.creaSolicitud.insDependencia(ttDependencia, conn);
      if (salida.id > 0) {
        ttDependencia.ID_SOLICITUD = (new StringBuilder(String.valueOf(salida.id))).toString();
        boolean cargaArchivo = true;//this.archivo.guardarArchivo(ttDependencia).booleanValue();
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
  
  public jsonResult modSolicitudRegularizacion(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      ttDependencia.RUTA = this.archivo.getRutaArchivo(ttDependencia);
      salida = this.creaSolicitud.modSolicitudDependencia(ttDependencia, conn);
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
  
  public jsonResult insDependenciaNominal(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      salida = this.creaSolicitud.insDependenciaNominal(ttDependencia, conn);
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
  
  
  public jsonResult getbajaRegulaNominal(int CODIGO_PRESUPUESTARIO) throws Exception {
	  jsonResult salida = new jsonResult();
	    ConnectionsPool c = new ConnectionsPool();
	    Connection conn = c.conectar();
	    System.out.print("estamos en nuevo metodo "+ this.SCHEMA );
	    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_GET_NOMINAL_BAJA(?,?,?)");
	    call.setInt("p_codigo_presupuestario", CODIGO_PRESUPUESTARIO);
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
