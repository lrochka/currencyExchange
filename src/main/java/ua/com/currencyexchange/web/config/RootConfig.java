package ua.com.currencyexchange.web.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @Configuration classes =~ <beans/> xml documents
 * @author <a href="http://rockhoppertech.com/blog/">Gene De Lisa</a>
 * 
 */
@Configuration
@ComponentScan(basePackages = { "ua.com.currencyexchange.web"})
public class RootConfig {

	// @Bean methods ~= <bean/> elements

}