/**
 * 
 */
/**
 * @author Irochka
 *
 */
package ua.com.currencyexchange.filter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
 
public class CharsetFilter implements Filter
{
 private String encoding;
 
 public void init(FilterConfig config) throws ServletException
 {
  encoding = config.getInitParameter("requestEncoding");
 
  if( encoding==null ) encoding="UTF-8";
 }
 
 public void doFilter(ServletRequest request,
 	ServletResponse response, FilterChain next)
 throws IOException, ServletException
 {
  request.setCharacterEncoding(encoding);
  next.doFilter(request, response);
 }
 
 public void destroy(){}
}