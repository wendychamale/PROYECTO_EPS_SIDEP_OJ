package gt.gob.oj.CITBASE.manager;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import gt.gob.oj.CITBASE.model.Usuario;
//import gt.gob.oj.SIGMA.model.Vinculacion;
import gt.gob.oj.utils.Config;
import gt.gob.oj.utils.ConnectionsPool;
import gt.gob.oj.utils.jsonResult;
import oracle.jdbc.OracleTypes;

public class LoginManager {
	String SCHEMA = new Config().getDBSchema();
	
	public Map<String, Object> getVersionSistema() throws Exception{
		Map<String, Object> salida = new HashMap<String, Object>();
		
		ConnectionsPool c=new ConnectionsPool();
		Connection conn=c.conectar();
		 // Prepare a PL/SQL call
	    CallableStatement call =
	    conn.prepareCall ("{? = call "+SCHEMA+".PKG_CONSTANTES.VERSION_SISTEMA()}");

	    // Parametros
	    call.registerOutParameter (1, OracleTypes.FLOAT);
	    call.execute ();
	    
	    float  id = call.getFloat(1);
	    
	    call.close();
	    conn.close();
	    
	    salida.put("VERSION", id);
	    
	    return salida;
	}
	
	public Map<String, Object> getCarencia(String NUMERO) throws Exception{
		Map<String, Object> salida = new HashMap<String, Object>();
		
		ConnectionsPool c=new ConnectionsPool();
		Connection conn=c.conectarSQLSERVER();
	    
	    Statement stmt = null;  
	    ResultSet rset = null;  
	    stmt = conn.createStatement();  
	    String SQL = "EXECUTE [dbo].[PROC_GET_CARENCIA]"+NUMERO;  
	    rset = stmt.executeQuery(SQL);  

	    // Dump the cursor
	    ResultSetMetaData meta = rset.getMetaData();
	    
	    while (rset.next()) {
            for (int i = 1; i <= meta.getColumnCount(); i++) {
                String key = meta.getColumnName(i).toString();
                String value = Objects.toString(rset.getString(key), "");
                salida.put(key, value);            
            }   
        }
	    
	    return salida;
	}
	
	public Map<String, Object> getConstantes() throws Exception{
		Map<String, Object> salida = new HashMap<String, Object>();
		
		ConnectionsPool c=new ConnectionsPool();
		Connection conn=c.conectar();
		 // Prepare a PL/SQL call
	    CallableStatement call =
	    conn.prepareCall ("call "+SCHEMA+".PKG_UTILS.PROC_GET_CONSTANTES(?)");

	    // Parametros
	    call.registerOutParameter ("p_cur_dataset", OracleTypes.CURSOR);
	    call.execute ();
	    ResultSet rset = (ResultSet)call.getObject ("p_cur_dataset");

	    // Dump the cursor
	    ResultSetMetaData meta = rset.getMetaData();
	    
	    while (rset.next()) {
            salida.put(Objects.toString(rset.getString("CTE"), ""), Objects.toString(rset.getString("VAL"), ""));	   
        } 
	    // Close all the resources
	    rset.close();
	    call.close();
	    conn.close();
	    
	    return salida;
	}
	
	
	
	public jsonResult insUsuario(Usuario item) throws Exception{
		jsonResult salida = new jsonResult();
		
		ConnectionsPool c=new ConnectionsPool();
		Connection conn=c.conectar();
		 // Prepare a PL/SQL call
	    CallableStatement call =
	    conn.prepareCall ("call "+SCHEMA+".PKG_UTILS.PROC_INS_USUARIO (?,?,?,?,?,?,?)");

	    // Parametros
	   
	    call.setString("p_id_usuario", item.ID_USUARIO);
	    call.setString("p_usuario", item.USUARIO);
	    call.setString("p_correo", item.CORREO);
	    call.setString("p_nombre", item.NOMBRE);
	    call.setString("p_ip", item.IP);
	    call.registerOutParameter ("p_id_salida", OracleTypes.NUMBER);
	    call.registerOutParameter ("p_msj", OracleTypes.VARCHAR);
	    call.execute ();
	  
	    int  id = call.getInt("p_id_salida");
	    String  msj = call.getString("p_msj");
	    salida.id=id;
	    salida.msj=msj;
	    if(salida.id!=-1){
	    	salida.result="OK";
	    }
	    // Close all the resources
	    call.close();
	    conn.close();
	    
	    return salida;
	}
	

	
}
