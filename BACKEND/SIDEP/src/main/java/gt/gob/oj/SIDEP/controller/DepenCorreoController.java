package gt.gob.oj.SIDEP.controller;

import gt.gob.oj.SIDEP.manager.DepenCorreoManager;
import gt.gob.oj.SIDEP.model.TtDependenciaCorreo;
import gt.gob.oj.utils.FiltroErrores;
import gt.gob.oj.utils.jsonResult;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;

@Path("DependeciaCorreo")
public class DepenCorreoController {
  DepenCorreoManager manager = new DepenCorreoManager();
  
  @POST
  @Path("/insDependenciaCorreo")
  @Produces({"application/json"})
  public Response insDependenciaCorreo(@Context HttpServletRequest req, TtDependenciaCorreo ttDependenciaCorreo) {
    try {
      ttDependenciaCorreo.IP = req.getRemoteAddr();
      return Response.ok(this.manager.insDependenciaCorreo(ttDependenciaCorreo)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
    } 
  }
}
