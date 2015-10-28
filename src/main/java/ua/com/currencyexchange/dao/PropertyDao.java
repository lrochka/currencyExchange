/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.dao;

import ua.com.currencyexchange.domain.Property;

import java.util.List;

import ua.com.currencyexchange.dao.Dao;

/**
 * @author Irochka
 */
public interface PropertyDao extends Dao<Property> {
	
	public List<Property> getPropertyListBySectionAndCode(Long section);
	
}
