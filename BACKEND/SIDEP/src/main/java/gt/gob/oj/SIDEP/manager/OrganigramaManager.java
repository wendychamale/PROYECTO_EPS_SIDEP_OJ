package gt.gob.oj.SIDEP.manager;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import gt.gob.oj.utils.Config;
import gt.gob.oj.utils.ConnectionsPool;
import gt.gob.oj.utils.jsonResult;
import oracle.jdbc.OracleTypes;

public class OrganigramaManager {
	String SCHEMA = (new Config()).getDBSchema();
	
	public List<Map<String, Object>> getPadrePrincipal() throws Exception {
		List<Map<String, Object>> salida = new ArrayList<>();
	    ConnectionsPool c = new ConnectionsPool();
	    Connection conn = c.conectar();
		  System. out. println("PADRE ORGANIGRAMA......\n");
	    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_ORGANIGRAMA.PROC_INS_RH_PADRE (?,?)");
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
	
	public List<Map<String, Object>> getHijosOrganigrama(int codigo_padre) throws Exception {
		List<Map<String, Object>> salida = new ArrayList<>();
	    ConnectionsPool c = new ConnectionsPool();
	    Connection conn = c.conectar();
		  System. out. println("ORGANIGRAMA......\n");
	    CallableStatement call = conn.prepareCall("call " + this.SCHEMA + ".PKG_ORGANIGRAMA.PROC_INS_RH_AREA_DEPARTAMENTO (?,?,?)");
	    call.setInt("p_area_padre", codigo_padre);
	    call.registerOutParameter("P_CUR_DATASET", OracleTypes.CURSOR);
	    call.registerOutParameter("P_MSJ", OracleTypes.VARCHAR);
	    call.execute();
	    ResultSet rset = (ResultSet)call.getObject("P_CUR_DATASET");
		System. out. println("dentro ver organigrama......"+this.SCHEMA+"\n");
	    ResultSetMetaData meta = rset.getMetaData();
		System. out. println("tam......"+rset.getFetchSize()+"\n");
		System. out. println("tam1......"+meta.getColumnCount()+"\n");
	    while (rset.next()) {
	      Map<String, Object> map = new HashMap<>();
	      for (int i = 1; i <= meta.getColumnCount(); i++) {
	        String key = meta.getColumnName(i).toString();
	        String value = Objects.toString(rset.getString(key), "");
	        map.put(key, value);
	      } 
		  System. out. println("p1......"+map.toString()+"\n");
	      salida.add(map);
	    } 
	    rset.close();
	    call.close();
	    conn.close();
	    
	    return salida;
	  }
}
