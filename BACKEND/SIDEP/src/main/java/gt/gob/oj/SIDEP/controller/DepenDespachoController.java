package gt.gob.oj.SIDEP.controller;

import gt.gob.oj.SIDEP.manager.DepenDespachoManager;
import gt.gob.oj.SIDEP.model.TtDepenDespacho;
import gt.gob.oj.utils.FiltroErrores;
import gt.gob.oj.utils.jsonResult;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;

@Path("DependeciaDespacho")
public class DepenDespachoController {
  DepenDespachoManager manager = new DepenDespachoManager();
  
  @POST
  @Path("/insDependenciaDespacho")
  @Produces({"application/json"})
  public Response insDependenciaDespacho(@Context HttpServletRequest req, TtDepenDespacho ttDepenDespacho) {
    try {
      ttDepenDespacho.IP = req.getRemoteAddr();
      return Response.ok(this.manager.insDependenciaDespacho(ttDepenDespacho)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
}
