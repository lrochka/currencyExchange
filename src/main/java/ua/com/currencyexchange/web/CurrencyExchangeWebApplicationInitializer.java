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
import org.springframework.web.filter.CharacterEncodingFilter;

public class CurrencyExchangeWebApplicationInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
    	
		charsetFilter = servletContext.addFilter("setCharacterEncodingFilter",
				new CharacterEncodingFilter());
		charsetFilter.setInitParameter("encoding", "UTF-8");
		charsetFilter.setInitParameter("forceEncoding", "true");
		charsetFilter.addMappingForUrlPatterns(null, false, "/*");
		
        super.onStartup(servletContext);
    }
}