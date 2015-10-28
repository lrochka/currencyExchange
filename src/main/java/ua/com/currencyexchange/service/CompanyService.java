/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.service;

import java.util.List;

import ua.com.currencyexchange.domain.Company;

/**
 * @author Irochka 
 */

public interface CompanyService {
	
	public List<Company> getCompanyList();
	/**
	 * Returns the requested company or <code>null</code> if no such company exists.
	 * 
	 * @param id
	 *            id data
	 * @return the requested company, or <code>null</code> if it doesn't exist
	 */
	public Company getCompanyById(Long id);
}
