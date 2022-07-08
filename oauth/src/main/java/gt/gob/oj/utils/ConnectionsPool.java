package gt.gob.oj.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class ConnectionsPool {
	Connection conn;
	//private String HOST;
	public Connection conectar() throws SQLException{
		
			Config cf = new Config();
			String HOST = cf.getDBHost();
			String PORT = cf.getDBPort();
			String SERVICE =  cf.getDBService();
			String USR =  cf.getDBUser();
			String PASS =  cf.getDBPass();

		  DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		  
		  this.conn = DriverManager.getConnection ("jdbc:oracle:thin:@(description=(address_list=(address=(protocol=tcp)(port="+PORT+")(host="+HOST+")))(connect_data=(SERVICE_NAME="+SERVICE+")))", USR, PASS);	 
	return conn;
	}

	
	
}
