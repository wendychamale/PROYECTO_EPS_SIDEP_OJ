package gt.gob.oj.SIDEP.controller;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;

import gt.gob.oj.SIDEP.Authorize;
import gt.gob.oj.SIDEP.manager.LoginManager;
import gt.gob.oj.SIDEP.model.Usuario;
import gt.gob.oj.utils.jsonResult;

@Path("Login")
public class LoginController {
	LoginManager manager = new LoginManager();
	
	@GET
	//@Authorize
    @Path("/getConstantes")
    @Produces("application/json")
    public Response getConstantes() {
		try {
			return Response.ok(manager.getConstantes()).build();
		} catch (Exception e) {
			e.printStackTrace(); 
			return Response.ok(new jsonResult(-1,"Error",e.getMessage())).build();
		}
    }
	
	@GET
    @Path("/getVersionSistema")
    @Produces("application/json")
    public Response getVersionSistema() {
		try {
			return Response.ok(manager.getVersionSistema()).build();
		} catch (Exception e) {
			e.printStackTrace(); 
			return Response.ok(new jsonResult(-1,"Error",e.getMessage())).build();
		}
    }
	
	@GET
    @Path("/Carencia/{p_numero}/getCarencia")
    @Produces("application/json")
    public Response getCarencia(@PathParam("p_numero")String NUMERO) {
		try {
			return Response.ok(manager.getCarencia(NUMERO)).build();
		} catch (Exception e) {
			e.printStackTrace(); 
			return Response.ok(new jsonResult(-1,"Error",e.getMessage())).build();
		}
    }
	
	
	@POST
	//@Authorize
	@Path("/insUsuario")
	@Consumes("application/json")
	@Produces("application/json")
	public Response insUsuario(@Context HttpServletRequest req,Usuario item) {	
		try {
			item.IP=req.getRemoteAddr();
			return Response.ok(manager.insUsuario(item)).build();
		} catch (Exception e) {
			e.printStackTrace(); 
			return Response.ok(new jsonResult(-1,"Error",e.getMessage())).build();
		}
	}


}
