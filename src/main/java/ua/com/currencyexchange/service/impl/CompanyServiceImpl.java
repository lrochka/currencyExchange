/* 
 * Copyright (c) 2015
 */

package ua.com.currencyexchange.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import java.util.List;

import javax.inject.Inject;

import ua.com.currencyexchange.domain.Company;
import ua.com.currencyexchange.service.CompanyService;
import ua.com.currencyexchange.dao.CompanyDao;

/**
 * @author Irochka 
 */
@Service
@Transactional(readOnly = true)
public class CompanyServiceImpl implements CompanyService  {
	
	@Inject private CompanyDao companyDao;
	
	public List<Company> getCompanyList() {
        return companyDao.getCompanyList();
    }
	
	public Company getCompanyById(Long id){
		Company company = companyDao.findById(id);
		return company;	
	}
}
