package gt.gob.oj.OAUTH.controller;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import gt.gob.oj.OAUTH.manager.LoginManager;
import gt.gob.oj.utils.jsonResult;

@Path("Login")
public class LoginController {
	LoginManager manager = new LoginManager();
	
	@GET
	//@Authorize
	@Path("/validarUsuarioInterno")
	@Produces(MediaType.APPLICATION_JSON)
	public Response validarUsuarioInterno() {	
		try {
			return Response.ok(manager.validarUsuarioInterno()).build();
		} catch (Exception e) {
			e.printStackTrace(); 
			return Response.ok(new jsonResult(-1,"Error",e.getMessage())).build();
		}
	}
	
	@GET
	//@Authorize
	@Path("Sistema/{p_id_sistema}/getSessionUsuario")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getSessionUsuario() {	
		try {
			return Response.ok(manager.getSessionUsuario()).build();
		} catch (Exception e) {
			e.printStackTrace(); 
			return Response.ok(new jsonResult(-1,"Error",e.getMessage())).build();
		}
	}


}
