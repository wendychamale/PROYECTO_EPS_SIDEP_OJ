package gt.gob.oj.SIDEP.controller;

import gt.gob.oj.SIDEP.manager.ActualizaDependenciaManager;
import gt.gob.oj.SIDEP.model.TtDependencia;
import gt.gob.oj.utils.FiltroErrores;
import gt.gob.oj.utils.jsonResult;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;

@Path("ActualizaDependencia")
public class ActualizaDependenciaController {
  ActualizaDependenciaManager manager = new ActualizaDependenciaManager();
  
  @POST
  @Path("/insSolitudActDependencia")
  @Produces({"application/json"})
  public Response insSolitudActDependencia(@Context HttpServletRequest req, TtDependencia ttDependencia) {
    try {
      ttDependencia.IP = req.getRemoteAddr();
      return Response.ok(this.manager.insSolitudActDependencia(ttDependencia)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
  
  @POST
  @Path("/modSolitudActDependencia")
  @Produces({"application/json"})
  public Response modSolitudActDependencia(@Context HttpServletRequest req, TtDependencia ttDependencia) {
    try {
      ttDependencia.IP = req.getRemoteAddr();
      return Response.ok(this.manager.modSolitudActDependencia(ttDependencia)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
  
  @POST
  @Path("/procActDependencia")
  @Produces({"application/json"})
  public Response procActDependencia(@Context HttpServletRequest req, TtDependencia ttDependencia) {
    try {
      ttDependencia.IP = req.getRemoteAddr();
      return Response.ok(this.manager.procActDependencia(ttDependencia)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
}
