package gt.gob.oj.SIDEP.controller;

import gt.gob.oj.SIDEP.manager.CreaDependenciaManager;
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

@Path("CreaDependencia")
public class CreaDependenciaController {
  CreaDependenciaManager manager = new CreaDependenciaManager();
  
  @POST
  @Path("/insDependencia")
  @Produces({"application/json"})
  public Response insDependencia(@Context HttpServletRequest req, TtDependencia ttDependencia) {
    try {
      ttDependencia.IP = req.getRemoteAddr();
      return Response.ok(this.manager.insDependencia(ttDependencia)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
  
  @POST
  @Path("/modSolicitudDependencia")
  @Produces({"application/json"})
  public Response modSolicitudDependencia(@Context HttpServletRequest req, TtDependencia ttDependencia) {
    try {
      ttDependencia.IP = req.getRemoteAddr();
      return Response.ok(this.manager.modSolicitudDependencia(ttDependencia)).build();
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
  @Path("/getGestDependencia/{id_gestion_dependencia}/getGestion")
  @Produces({"application/json"})
  public Response getGestion(@PathParam("id_gestion_dependencia") int ID_GESTION_DEPENDENCIA) {
    try {
      return Response.ok(this.manager.getGestion(ID_GESTION_DEPENDENCIA)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
    } 
  }
}
