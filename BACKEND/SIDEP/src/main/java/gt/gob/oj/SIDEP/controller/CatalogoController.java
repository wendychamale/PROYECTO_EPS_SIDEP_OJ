package gt.gob.oj.SIDEP.controller;

import gt.gob.oj.SIDEP.manager.CatalogoManager;
import gt.gob.oj.utils.jsonResult;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

@Path("Catalogo")
public class CatalogoController {
  CatalogoManager manager = new CatalogoManager();
  
  @GET
  @Path("/getDepartamentos")
  @Produces({"application/json"})
  public Response getDepartamentos() {
    try {
      return Response.ok(this.manager.getDepartamentos()).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
    } 
  }
  
  @GET
  @Path("/Departamento/{p_id_departamento}/getMunicipios")
  @Produces({"application/json"})
  public Response getMunicipios(@PathParam("p_id_departamento") int ID_DEPARTAMENTO) {
    try {
      return Response.ok(this.manager.getMunicipios(ID_DEPARTAMENTO)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
    } 
  }
  
  @GET
  @Path("/getDependenciaArea")
  @Produces({"application/json"})
  public Response getDependenciaArea() {
    try {
      return Response.ok(this.manager.getDependenciaArea()).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
    } 
  }
  
  @GET
  @Path("/Dependencia/{p_id_depenencia}/Valor/{p_valor}/validaCodigoDependencia")
  @Produces({"application/json"})
  public Response validaCodigoDependencia(@PathParam("p_id_depenencia") int ID_DEPENDENCIA, @PathParam("p_valor") int P_VALOR) {
    try {
      return Response.ok(this.manager.validaCodigoDependencia(ID_DEPENDENCIA, P_VALOR)).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
    } 
  }
  
  @GET
  @Path("/catalogoDependencias")
  @Produces({"application/json"})
  public Response getDependencia(@PathParam("p_dependencia") int ID_DEPENDENCIA) {
    try {
      return Response.ok(this.manager.catalogoDependencias()).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
    } 
  }
  
  @GET
  @Path("/depCorreoCidej")
  @Produces({"application/json"})
  public Response depCorreoCidej() {
    try {
      return Response.ok(this.manager.depCorreoCidej()).build();
    } catch (Exception e) {
      e.printStackTrace();
      return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
    } 
  }
}
