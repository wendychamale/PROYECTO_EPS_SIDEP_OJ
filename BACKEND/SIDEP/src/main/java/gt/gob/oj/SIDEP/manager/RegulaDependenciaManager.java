package gt.gob.oj.SIDEP.manager;

import gt.gob.oj.SIDEP.manager.CreaDependenciaManager;
import gt.gob.oj.SIDEP.model.Archivo;
import gt.gob.oj.SIDEP.model.TtDependencia;
import gt.gob.oj.utils.Config;
import gt.gob.oj.utils.ConnectionsPool;
import gt.gob.oj.utils.jsonResult;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;

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
}
