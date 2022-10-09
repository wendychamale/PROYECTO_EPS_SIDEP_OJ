package gt.gob.oj.SIDEP.controller;

import gt.gob.oj.SIDEP.manager.DependenciaManager;
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

@Path("Dependencia")
public class DependenciaController {
	DependenciaManager manager = new DependenciaManager();

	@GET
	@Path("/getProceso/{id_estado_proceso}/getTipo/{id_tipo_gestion}")
	@Produces({ "application/json" })
	public Response getGestDependencia(@PathParam("id_estado_proceso") int ID_ESTADO_PROCESO,
			@PathParam("id_tipo_gestion") int ID_TIPO_GESTION) {
		try {
			return Response.ok(this.manager.getGestDependencia(ID_ESTADO_PROCESO, ID_TIPO_GESTION)).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
		}
	}
	
	//se crea nuevo servicio para consultar dependencias por estado de area
	@GET
	@Path("/getProcesoArea/{id_estado_proceso}/getTipo/{id_tipo_gestion}/getArea/{estado_area}")
	@Produces({ "application/json" })
	public Response getGestDependenciaArea(@PathParam("id_estado_proceso") int ID_ESTADO_PROCESO,
			@PathParam("id_tipo_gestion") int ID_TIPO_GESTION, @PathParam("estado_area") String ESTADO_AREA) {
		try {
			return Response.ok(this.manager.getGestDependenciaArea(ID_ESTADO_PROCESO, ID_TIPO_GESTION,ESTADO_AREA)).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
		}
	}

	@GET
	@Path("/getGestDependencia/{id_gestion_dependencia}/getGestion")
	@Produces({ "application/json" })
	public Response getGestion(@PathParam("id_gestion_dependencia") int ID_GESTION_DEPENDENCIA) {
		try {
			return Response.ok(this.manager.getGestion(ID_GESTION_DEPENDENCIA)).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
		}
	}

	@GET
	@Path("/catalogoDependencias/{p_dependencia}/getDependencia")
	@Produces({ "application/json" })
	public Response getDependencia(@PathParam("p_dependencia") int ID_DEPENDENCIA) {
		try {
			return Response.ok(this.manager.getDependencia(ID_DEPENDENCIA)).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
		}
	}

	@GET
	@Path("/{p_id_gest_dependencia}/visualizarDocumento")
	@Produces({ "application/octet-stream" })
	public Response visualizarDocumento(@Context HttpServletRequest req,
			@PathParam("p_id_gest_dependencia") String p_id_gest_dependencia) {
		try {
			return this.manager.visualizarDocumento(p_id_gest_dependencia);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@GET
	@Path("/{p_dependencia}/visualizarDocumentoDep")
	@Produces({ "application/octet-stream" })
	public Response visualizarDocumentoDep(@Context HttpServletRequest req,
			@PathParam("p_dependencia") String p_dependencia) {
		try {
			return this.manager.visualizarDocumentoDep(p_dependencia);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@POST
	@Path("/rechazaSolicitud")
	@Produces({ "application/json" })
	public Response rechazaSolicitud(@Context HttpServletRequest req, TtDependencia ttDependencia) {
		try {
			ttDependencia.IP = req.getRemoteAddr();
			return Response.ok(this.manager.rechazaSolicitud(ttDependencia)).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
		}
	}
	
	@POST
	@Path("/rechazaSolicitudArea")
	@Produces({ "application/json" })
	public Response rechazaSolicitudArea(@Context HttpServletRequest req, TtDependencia ttDependencia) {
		try {
			ttDependencia.IP = req.getRemoteAddr();
			return Response.ok(this.manager.rechazaSolicitudArea(ttDependencia)).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
		}
	}
	@GET
	@Path("/{p_codigo_dependencia}/validaDependenciaPlaza")
	@Produces({ "application/json" })
	public Response validaDependenciaPlaza(@PathParam("p_codigo_dependencia") int p_codigo_dependencia) {
		try {
			return Response.ok(this.manager.validaDependenciaPlaza(p_codigo_dependencia)).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
		}
	}

	@GET
	@Path("/{p_id_despacho}/validaDespacho")
	@Produces({ "application/json" })
	public Response validaDespacho(@PathParam("p_id_despacho") int p_id_despacho) {
		try {
			return Response.ok(this.manager.validaDespacho(p_id_despacho)).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
		}
	}

	@POST
	@Path("/eliminarSolicitud")
	@Produces({ "application/json" })
	public Response eliminarSolicitud(@Context HttpServletRequest req, TtDependencia ttDependencia) {
		try {
			ttDependencia.IP = req.getRemoteAddr();
			return Response.ok(this.manager.eliminarSolicitud(ttDependencia)).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.ok(new jsonResult(-1, "Error", FiltroErrores.filtraMensaje(e.getMessage()))).build();
		}
	}

	@GET
	@Path("/{p_codigo_presupuestario}/getNombreDependencia")
	@Produces({ "application/json" })
	public Response getNombreDependencia(@PathParam("p_codigo_presupuestario") int p_codigo_presupuestario) {
		try {
			return Response.ok(this.manager.getNombreDependencia(p_codigo_presupuestario)).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.ok(new jsonResult(-1, "Error", e.getMessage())).build();
		}
	}
}
