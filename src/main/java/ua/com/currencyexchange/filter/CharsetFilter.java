/**
 * 
 */
/**
 * @author Irochka
 *
 */
package ua.com.currencyexchange.filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class CharsetFilter implements Filter
{
 private String encoding;
 
 public void init(FilterConfig config) throws ServletException
 {
  encoding = config.getInitParameter("encoding");
 
  if( encoding==null ) encoding="UTF-8";
 }
 
 @Override
 public void doFilterInternal(ServletRequest request,
 	ServletResponse response, FilterChain next)
 throws IOException, ServletException
 {
  
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html; charset=UTF-8");
  response.setCharacterEncoding("UTF-8");
  next.doFilter(request, response);
 }
 
 public void destroy(){}
}