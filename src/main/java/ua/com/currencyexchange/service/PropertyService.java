/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.service;

import java.util.List;

import ua.com.currencyexchange.domain.Property;

/**
 * @author Irochka 
 */
public interface PropertyService {

	public List<Property> getPropertyListBySectionAndCode(Long section);
}
