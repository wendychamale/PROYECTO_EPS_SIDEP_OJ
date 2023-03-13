package gt.gob.oj.SIDEP.controller;

import gt.gob.oj.SIDEP.manager.RegulaDependenciaManager;
import gt.gob.oj.SIDEP.model.TtDependencia;
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

@Path("RegulaDependencia")
public class RegulaDependenciaController {
  RegulaDependenciaManager manager = new RegulaDependenciaManager();
  
  @POST
  @Path("/insSolicitudRegularizacion")
  @Produces({"application/json"})
  public Response insSolicitudRegularizacion(@Context HttpServletRequest req, TtDependencia ttDependencia) {
    try {
      ttDependencia.IP = req.getRemoteAddr();
      return Response.ok(this.manager.insSolicitudRegularizacion(ttDependencia)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
  
  @POST
  @Path("/modSolicitudRegularizacion")
  @Produces({"application/json"})
  public Response modSolicitudRegularizacion(@Context HttpServletRequest req, TtDependencia ttDependencia) {
    try {
      ttDependencia.IP = req.getRemoteAddr();
      return Response.ok(this.manager.modSolicitudRegularizacion(ttDependencia)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
  
  @POST
  @Path("/insDependenciaNominal")
  @Produces({"application/json"})
  public Response insDependenciaNominal(@Context HttpServletRequest req, TtDependencia ttDependencia) {
    try {
      ttDependencia.IP = req.getRemoteAddr();
      return Response.ok(this.manager.insDependenciaNominal(ttDependencia)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
  
  @GET
	@Path("/getbajaRegulaNominal/{codigo_presupuestario}")
	@Produces({ "application/json" })
	public Response getGestDependencia(@PathParam("codigo_presupuestario") int CODIGO_PRESUPUESTARIO) {
		try {
			return Response.ok(this.manager.getbajaRegulaNominal(CODIGO_PRESUPUESTARIO)).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
		}
	}
	
}
