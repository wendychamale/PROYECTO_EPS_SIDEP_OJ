package gt.gob.oj.CITBASE;

import javax.ws.rs.ext.Provider;
import javax.ws.rs.ext.WriterInterceptor;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;

import gt.gob.oj.utils.Config;
import gt.gob.oj.utils.Hash;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Priority;
import javax.ws.rs.NotAuthorizedException;
import javax.ws.rs.Priorities;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.Response;

@Authorize
@Provider
@Priority(Priorities.AUTHENTICATION)
public class CheckAuthorize implements ContainerRequestFilter
{

    @Override
    public void filter(ContainerRequestContext requestContext) throws IOException {

        // Get the HTTP Authorization header from the request
        String authorizationHeader = requestContext.getHeaderString(HttpHeaders.AUTHORIZATION);
      //  System.out.println("#### authorizationHeader : " + authorizationHeader);

        // Check if the HTTP Authorization header is present and formatted correctly
        if (authorizationHeader == null || !authorizationHeader.startsWith("Bearer ")) {
        	//System.out.println("#### invalid authorizationHeader : " + authorizationHeader);
            throw new NotAuthorizedException("Authorization header must be provided");
        }

        // Extract the token from the HTTP Authorization header
        String token = authorizationHeader.substring("Bearer".length()).trim();

        try {

            // Validate the token
        	Calendar calendar = Calendar.getInstance();

			//para provar el token en cambio de dia
        	////calendar.add(Calendar.DATE, +1);
			
			String secret="CIT-"+new Config().getSistemaNombre()+"-D"+calendar.get(Calendar.DAY_OF_MONTH)+"-M"+calendar.get(Calendar.MONTH)+"-Y"+calendar.get(Calendar.YEAR);
			//System.out.println("Desifrando con:"+secret+"=>"+token);
			secret=Hash.SHA256(secret);
			Algorithm algorithm = Algorithm.HMAC256(secret);
			
	
			
		    JWTVerifier verifier = JWT.require(algorithm)
		        .build(); //Reusable verifier instance
		    DecodedJWT jwt = verifier.verify(token);

			/*Date expiresAt = jwt.getExpiresAt();
			System.out.println(expiresAt);*/
			
			
        } catch (Exception e) {
        	//System.out.println("#### invalid token : " + token);
            requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
        }
    }
}
