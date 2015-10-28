/* 
 * Copyright (c) 2015
 */

package ua.com.currencyexchange.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

import javax.inject.Inject;

import ua.com.currencyexchange.domain.Property;
import ua.com.currencyexchange.service.PropertyService;
import ua.com.currencyexchange.dao.PropertyDao;

/**
 * @author Irochka 
 */
@Service
@Transactional(readOnly = true)
public class PropertyServiceImpl  implements PropertyService{
	
	@Inject private PropertyDao propertyDao;	
	
	public List<Property> getPropertyListBySectionAndCode(Long section){
		return propertyDao.getPropertyListBySectionAndCode(section);
	}
}
