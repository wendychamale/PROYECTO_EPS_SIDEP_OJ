package gt.gob.oj.SIDEP.controller;

import gt.gob.oj.SIDEP.manager.OrganigramaManager;
import gt.gob.oj.utils.jsonResult;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

@Path("Organigrama")
public class OrganigramaController {
	OrganigramaManager manager = new OrganigramaManager();
	  
	
	  @GET
	  @Path("/getPadreOrganigrama")
	  @Produces({"application/json"})
	  public Response getGestion() {

    	  System. out. println("INICIO ORGANIGRAMA 	PADRE\n");
	    try {
	      return Response.ok(this.manager.getPadrePrincipal()).build();
	      
	    } catch (Exception e) {
	      e.printStackTrace();
	      return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
	    } 
	  }

	
	  @GET
	  @Path("/getHijosOrganigrama/{codigo_padre}")
	  @Produces({"application/json"})
	  public Response getGestion(@PathParam("codigo_padre") int codigo_padre) {

    	  System. out. println("INICIO ORGANIGRAMA\n");
	    try {
	      return Response.ok(this.manager.getHijosOrganigrama(codigo_padre)).build();
	      
	    } catch (Exception e) {
	      e.printStackTrace();

    	  System. out. println("dentro ver organigrama catch......"+e+"\n");
	      return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
	    } 
	  }

}
