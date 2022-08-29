package gt.gob.oj.SIDEP.controller;

import gt.gob.oj.SIDEP.manager.BajaDependenciaManager;
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

@Path("BajaDependencia")
public class BajaDependenciaController {
  BajaDependenciaManager manager = new BajaDependenciaManager();
  
  @POST
  @Path("/insSolitudBajaDependencia")
  @Produces({"application/json"})
  public Response insSolitudBajaDependencia(@Context HttpServletRequest req, TtDependencia ttDependencia) {
    try {
      ttDependencia.IP = req.getRemoteAddr();
      return Response.ok(this.manager.insSolitudBajaDependencia(ttDependencia)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
  
  @POST
  @Path("/modSolitudBajaDependencia")
  @Produces({"application/json"})
  public Response modSolitudBajaDependencia(@Context HttpServletRequest req, TtDependencia ttDependencia) {
    try {
      ttDependencia.IP = req.getRemoteAddr();
      return Response.ok(this.manager.modSolitudBajaDependencia(ttDependencia)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
  
  @POST
  @Path("/procBajaDependencia")
  @Produces({"application/json"})
  public Response procBajaDependencia(@Context HttpServletRequest req, TtDependencia ttDependencia) {
    try {
      ttDependencia.IP = req.getRemoteAddr();
      return Response.ok(this.manager.procBajaDependencia(ttDependencia)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
  
  @GET
  @Path("{p_codigo_dependencia}/getPlazaDependencia")
  @Produces({"application/json"})
  public Response getPlazaDependencia(@PathParam("p_codigo_dependencia") int p_codigo_dependencia) {
    try {
      return Response.ok(this.manager.getPlazaDependencia(p_codigo_dependencia)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
    } 
  }
}
