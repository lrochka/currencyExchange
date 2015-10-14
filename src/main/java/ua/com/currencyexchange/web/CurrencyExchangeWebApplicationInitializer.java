/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.web;

import java.util.Set;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import ua.com.currencyexchange.filter.CharsetFilter;

public class CurrencyExchangeWebApplicationInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
    	
        FilterRegistration.Dynamic charsetFilter = servletContext.addFilter("setCharacterEncodingFilter",
				new CharsetFilter());
		charsetFilter.setInitParameter("encoding", "UTF-8");
		charsetFilter.addMappingForUrlPatterns(null, false, "/*");
		
    }
}