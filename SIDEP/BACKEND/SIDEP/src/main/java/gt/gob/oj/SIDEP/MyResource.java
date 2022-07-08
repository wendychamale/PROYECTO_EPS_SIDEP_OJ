package gt.gob.oj.CITBASE;



import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import gt.gob.oj.utils.jsonResult;





/**
 * Root resource (exposed at "myresource" path)
 */
@Path("myresource")
public class MyResource {

    /**
     * Method handling HTTP GET requests. The returned object will be sent
     * to the client as "text/plain" media type.
     *
     * @return String that will be returned as a text/plain response.
     */
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getIt() {
        return "Got it!";
    }
	
    
    @GET
    @Path("/json")
    @Produces("application/json")
    public Response json() {
		try {
			jsonResult salida = new jsonResult();
			salida.id=1;
			salida.result="OK";
			salida.msj="Centro de Informatica y Telecomunicaciones CIT";
			return Response.ok(salida).build();
		} catch (Exception e) {
			e.printStackTrace(); 
			return Response.ok(new jsonResult(-1,"Error",e.getMessage())).build();
		}
    }
    
    
    
    
    @GET
    @Authorize
    @Path("/jsonAuth")
    @Produces("application/json")
    public Response jsonAuth() {
		try {
			jsonResult salida = new jsonResult();
			salida.id=1;
			salida.result="OK";
			salida.msj="Centro de Informatica y Telecomunicaciones CIT";
			return Response.ok(salida).build();
		} catch (Exception e) {
			e.printStackTrace(); 
			return Response.ok(new jsonResult(-1,"Error",e.getMessage())).build();
		}
    }
	
}
