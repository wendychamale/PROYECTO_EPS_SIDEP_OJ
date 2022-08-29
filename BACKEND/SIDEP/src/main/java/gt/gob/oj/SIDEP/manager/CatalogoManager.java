package gt.gob.oj.SIDEP.manager;

import gt.gob.oj.utils.Config;
import gt.gob.oj.utils.ConnectionsPool;
import gt.gob.oj.utils.jsonResult;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class CatalogoManager {
  String SCHEMA = (new Config()).getDBSchema();
  
  public List<Map<String, Object>> getDepartamentos() throws Exception {
	  System. out. println("vamos a consultar el esquema......"+this.SCHEMA+"\n");
    List<Map<String, Object>> salida = new ArrayList<>();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
   
    CallableStatement call = conn.prepareCall("call " +"RRHH.PKG_CATALOGOS.PROC_GET_DEPARTAMENTO(?,?)");
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
  
  public List<Map<String, Object>> getMunicipios(int ID_DEPARTAMENTO) throws Exception {
    List<Map<String, Object>> salida = new ArrayList<>();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " + "RRHH.PKG_CATALOGOS.PROC_GET_MUNICIPIO(?,?,?)");
    call.setInt("P_ID_DEPARTAMENTO", ID_DEPARTAMENTO);
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
  
  public List<Map<String, Object>> getDependenciaArea() throws Exception {
    List<Map<String, Object>> salida = new ArrayList<>();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " +"RRHH.PKG_CATALOGOS.PROC_GET_DEP_AREA (?,?)");
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
  
  public jsonResult validaCodigoDependencia(int p_codigo_dependencia, int p_valor) throws Exception {
    jsonResult salida = new jsonResult();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_DEPENDENCIA.PROC_VALIDA_DEPENDENCIA(?,?,?,?)");
    call.setInt("P_DEPENDENCIA", p_codigo_dependencia);
    call.setInt("P_VALOR", p_valor);
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
  
  public List<Map<String, Object>> catalogoDependencias() throws Exception {
    List<Map<String, Object>> salida = new ArrayList<>();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_CATALOGOS.PROC_GET_DEPENDENCIAS(?,?)");
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
  
  public List<Map<String, Object>> depCorreoCidej() throws Exception {
    List<Map<String, Object>> salida = new ArrayList<>();
    ConnectionsPool c = new ConnectionsPool();
    Connection conn = c.conectar();
    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_CATALOGOS.PROC_GET_CORREOCIDEJ(?,?)");
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
