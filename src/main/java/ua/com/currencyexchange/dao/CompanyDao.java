/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.dao;

import ua.com.currencyexchange.domain.Company;
import java.util.List;

/**
 * @author Irochka (afanasievaiv@ya.ru)
 */

public interface CompanyDao {

	public Company findById(Long id);
	
	public List<Company> getCompanyList();
}
