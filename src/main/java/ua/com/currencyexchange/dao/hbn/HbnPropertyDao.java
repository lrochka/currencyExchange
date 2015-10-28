/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.dao.hbn;

import java.util.List;

import org.springframework.stereotype.Repository;

import ua.com.currencyexchange.dao.PropertyDao;
import ua.com.currencyexchange.domain.Property;

/**
 * @author Irochka 
 */
@Repository
public class HbnPropertyDao extends AbstractHbnDao<Property> implements PropertyDao {
	@SuppressWarnings("unchecked")
	public List<Property> getPropertyListBySectionAndCode(Long section){
		return (List<Property>) getSession()
				.getNamedQuery("properties.bySectionAndCode")
				.setParameter("section", section).list();
	}
}
