package gt.gob.oj.SIDEP.manager;

import gt.gob.oj.SIDEP.model.Archivo;
import gt.gob.oj.SIDEP.model.TtDependencia;
import gt.gob.oj.utils.Config;
import gt.gob.oj.utils.ConnectionsPool;
import gt.gob.oj.utils.jsonResult;
import oracle.jdbc.OracleTypes;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.file.Files;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import javax.ws.rs.core.Response;

public class DependenciaManager {
  String SCHEMA = (new Config()).getDBSchema();
  
  Archivo archivo = new Archivo();
  
  String RUTA_ARCHIVO = "RUTA_ARCHIVO";
  
  String ARCHIVO = "ARCHIVO";
  
  public List<Map<String, Object>> getGestDependencia(int P_ID_ESTADO_PROCESO, int P_ID_TIPO_GESTION) throws Exception {
    List<Map<String, Object>> salida = new ArrayList<>();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_GET_GEST_DEPENDENCIA(?,?,?,?)");
    call.setInt("p_id_estado_proceso", P_ID_ESTADO_PROCESO);
    call.setInt("p_id_tipo_gestion", P_ID_TIPO_GESTION);
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
  
  public List<Map<String, Object>> getDependencia(int ID_DEPENDENCIA) throws Exception {
    List<Map<String, Object>> salida = new ArrayList<>();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_GET_DEPENDENCIA_NOMINAL(?,?,?)");
    call.setInt("P_DEPENDENCIA", ID_DEPENDENCIA);
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
  
  public Response visualizarDocumento(String p_id_gest_dependencia) throws Exception {
    Response response = null;
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    Config cf = new Config();
    String disco = cf.getArchivoRuta();
    String carpeta = cf.getArchivoCarpeta();
    conn.setAutoCommit(false);
    jsonResult salida = new jsonResult();
    InputStream file = null;
    try {
      salida = visualizarDocumento(p_id_gest_dependencia, conn);
      String path_archivo = String.valueOf(disco) + carpeta + salida.msj;
      System.out.println(path_archivo);
      if (salida.id > 0) {
        File archivo = new File(path_archivo);
        file = new FileInputStream(archivo);
        Response.ResponseBuilder builder = Response.ok(file);
        String fileName = archivo.getName().replace(",", "");
        builder.header("Content-type", Files.probeContentType(archivo.toPath()));
        builder.header("Content-Disposition", "filename=" + fileName);
        response = builder.build();
      } else {
        response = Response.status(404).entity("Documento no Encontrado").type("text/plain").build();
      } 
    } catch (Exception ex) {
      response = Response.status(404).entity("Problemas en busqueda de documento ").type("text/plain").build();
      ex.printStackTrace();
      System.out.println(String.valueOf(ex.getMessage()) + " ");
    } 
    conn.close();
    return response;
  }
  
  public jsonResult visualizarDocumento(String p_id_gest_dependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    String SCHEMA = (new Config()).getDBSchema();
    CallableStatement call = conn.prepareCall("call " + SCHEMA + ".PKG_DEPENDENCIA.PROC_VISUALIZAR_ARCHIVO(?,?,?)");
    call.setString("p_id_gest_dependencia", p_id_gest_dependencia);
    call.registerOutParameter("p_id_salida", OracleTypes.NUMBER);
    call.registerOutParameter("p_msj", OracleTypes.VARCHAR);
    call.execute();
    salida.id = call.getInt("p_id_salida");
    salida.msj = call.getString("p_msj");
    salida.result = "ok";
    call.close();
    return salida;
  }
  
  public Response visualizarDocumentoDep(String p_dependencia) throws Exception {
    Response response = null;
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    Config cf = new Config();
    String disco = cf.getArchivoRuta();
    String carpeta = cf.getArchivoCarpeta();
    conn.setAutoCommit(false);
    jsonResult salida = new jsonResult();
    InputStream file = null;
    try {
      salida = visualizarDocumentoDep(p_dependencia, conn);
      String path_archivo = String.valueOf(disco) + carpeta + salida.msj;
      System.out.println(path_archivo);
      if (salida.id > 0) {
        File archivo = new File(path_archivo);
        file = new FileInputStream(archivo);
        Response.ResponseBuilder builder = Response.ok(file);
        String fileName = archivo.getName().replace(",", "");
        builder.header("Content-type", Files.probeContentType(archivo.toPath()));
        builder.header("Content-Disposition", "filename=" + fileName);
        response = builder.build();
      } else {
        response = Response.status(404).entity("Documento no Encontrado").type("text/plain").build();
      } 
    } catch (Exception ex) {
      response = Response.status(404).entity("Problemas en busqueda de documento ").type("text/plain").build();
      ex.printStackTrace();
      System.out.println(String.valueOf(ex.getMessage()) + " ");
    } 
    conn.close();
    return response;
  }
  
  public jsonResult visualizarDocumentoDep(String p_dependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    String SCHEMA = (new Config()).getDBSchema();
    CallableStatement call = conn.prepareCall("call " + SCHEMA + ".PKG_DEPENDENCIA.PROC_VISUALIZAR_ARCHIVO_DEP(?,?,?)");
    call.setString("P_DEPENDENCIA", p_dependencia);
    call.registerOutParameter("p_id_salida", OracleTypes.NUMBER);
    call.registerOutParameter("p_msj", OracleTypes.VARCHAR);
    call.execute();
    salida.id = call.getInt("p_id_salida");
    salida.msj = call.getString("p_msj");
    salida.result = "ok";
    call.close();
    return salida;
  }
  
  public jsonResult rechazaSolicitud(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      salida = rechazaSolicitud(ttDependencia, conn);
      if (salida.id > 0) {
        salida.result = "ok";
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
  
  public jsonResult rechazaSolicitud(TtDependencia ttDependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    System.out.println(ttDependencia.ID_GESTION_DEPENDENCIA);
    System.out.println(ttDependencia.OBSERVACIONES);
    System.out.println(ttDependencia.IP);
    System.out.println(ttDependencia.ID_USUARIO_REGISTRO);
    System.out.println(ttDependencia.USUARIO);
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_RECHAZA_SOLOLICITUD(?,?,?,?,?,?)");
    call.setString("p_id_gestion_dependencia", ttDependencia.ID_GESTION_DEPENDENCIA);
    call.setString("p_observaciones", ttDependencia.OBSERVACIONES);
    call.setString("p_ip", ttDependencia.IP);
    call.setString("p_id_usuario_registro", ttDependencia.ID_USUARIO_REGISTRO);
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
  
  public jsonResult validaDependenciaPlaza(int p_codigo_dependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_VERIFICA_DEPEN_PLAZA(?,?,?)");
    call.setInt("p_codig_dependencia", p_codigo_dependencia);
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
  
  public jsonResult validaDespacho(int p_id_despacho) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_VALIDA_DESPACHO(?,?,?)");
    call.setInt("P_ID_DESPACHO", p_id_despacho);
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
  
  public jsonResult eliminarSolicitud(TtDependencia ttDependencia) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    conn.setAutoCommit(false);
    try {
      salida = eliminarSolicitud(ttDependencia, conn);
      if (salida.id > 0) {
        salida.result = "ok";
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
  
  public jsonResult eliminarSolicitud(TtDependencia ttDependencia, Connection conn) throws Exception {
    jsonResult salida = new jsonResult();
    System.out.println(ttDependencia.ID_GESTION_DEPENDENCIA);
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_ELIMINAR_RECHAZO(?,?,?,?,?,?)");
    call.setString("p_id_gestion_dependencia", ttDependencia.ID_GESTION_DEPENDENCIA);
    call.setString("p_observaciones", ttDependencia.OBSERVACIONES);
    call.setString("p_id_usuario_registro", ttDependencia.ID_USUARIO_REGISTRO);
    call.setString("p_ip", ttDependencia.IP);
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
  
  public List<Map<String, Object>> getNombreDependencia(int P_CODIGO_PRESUPUESTARIO) throws Exception {
    List<Map<String, Object>> salida = new ArrayList<>();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_GET_NOMBRE_DEPENDENCIA(?,?,?)");
    call.setInt("P_CODIGO_PRESUPUESTARIO", P_CODIGO_PRESUPUESTARIO);
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
