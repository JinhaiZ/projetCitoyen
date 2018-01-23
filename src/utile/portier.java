package utile;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class portier implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	throws IOException, ServletException { 
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response;
	    HttpSession session = hrequest.getSession(true);
	    
		  chain.doFilter(request, response); 
	
	}		
}
