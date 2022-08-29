package gt.gob.oj.utils;

import org.apache.commons.configuration2.XMLConfiguration;
import org.apache.commons.configuration2.builder.fluent.Configurations;
import org.apache.commons.configuration2.ex.ConfigurationException;

public final class Config {
	Configurations configs ;
	XMLConfiguration config;
	public Config() {
		this.configs = new Configurations();
	    try {
	      this.config = this.configs.xml("config.xml");
	    } catch (ConfigurationException e) {
	      e.printStackTrace();
	    } 
	  }
	  
	  public String getDBHost() {
	    return this.config.getString("db.host");
	  }
	  
	  public String getDBPort() {
	    return this.config.getString("db.port");
	  }
	  
	  public String getDBService() {
	    return this.config.getString("db.service");
	  }
	  
	  public String getDBUser() {
	    return this.config.getString("db.user");
	  }
	  
	  public String getDBPass() {
	    return this.config.getString("db.pass");
	  }
	  
	  public String getDBSchema() {
	    return this.config.getString("db.schema");
	  }
	  
	  public String getSistemaNombre() {
	    return this.config.getString("sistema.nombre");
	  }
	  
	  public String getArchivoRuta() {
	    return this.config.getString("archivo.ruta");
	  }
	  
	  public String getArchivoTipo() {
	    return this.config.getString("archivo.tipo");
	  }
	  
	  public String getArchivoCarpeta() {
	    return this.config.getString("archivo.carpeta");
	  }
	  
	  public String getparametrosMensajeDebug() {
	    return this.config.getString("configuracionAmbiente.mensajesDebug");
	  }
	  
	  public String getParamCrear() {
	    return this.config.getString("tipo_proceso.creacion");
	  }
	  
	  public String getParamModificar() {
	    return this.config.getString("tipo_proceso.modificacion");
	  }
	  
	  public String getParamRegularizacion() {
	    return this.config.getString("tipo_proceso.regularizacion");
	  }
	  
	  public String getParamBaja() {
	    return this.config.getString("tipo_proceso.baja");
	  }
	
	
}
