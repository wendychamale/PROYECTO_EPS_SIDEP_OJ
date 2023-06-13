package gt.gob.oj.SIDEP.controller;

import gt.gob.oj.SIDEP.manager.OrganigramaManager;
import gt.gob.oj.SIDEP.model.TtOrganigrama;
import gt.gob.oj.utils.FiltroErrores;
import gt.gob.oj.utils.jsonResult;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
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
	  
	  
	  @GET
	  @Path("/deleteHijos/{codigo_area}")
	  @Produces({"application/json"})
	  public Response getGestionDelete(@PathParam("codigo_area") int codigo_area) {

    	  System. out. println("INICIO DELETE AREA ORGANIGRAMA\n");
    	  try {
  			return Response.ok(this.manager.deleteHijosOrganigrama(codigo_area)).build();
  		} catch (Exception e) {
  			e.printStackTrace();
  			return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
  		}
	  }

	  

	  @POST
	  @Path("/addChild")
	  @Produces({"application/json"})
	  public Response addChild(@Context HttpServletRequest req, TtOrganigrama ttDependencia) {
		  System. out. println("INICIO INSERT AREA ORGANIGRAMA\n");
	    try {
	      return Response.ok(this.manager.addChild(ttDependencia)).build();
	    } catch (Exception e) {
	      e.printStackTrace();
	      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
	    } 
	  }
	  
}
