/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.dao.hbn;

import java.util.List;

import org.springframework.stereotype.Repository;

import ua.com.currencyexchange.dao.CompanyDao;
import ua.com.currencyexchange.domain.Company;
// import ua.com.currencyexchange.domain.UserDetailsAdapter;

/**
 * @author Irochka (afanasievaiv@ya.ru)
 */
@Repository
public class HbnCompanyDao extends AbstractHbnDao<Company> implements CompanyDao {
	
	public List<Company> getCompanyList(){
		return this.getAll();
	}

	public Company findById(Long id) {
		return (Company) getSession()
				.getNamedQuery("companies.byId")
				.setParameter("id", id)
				.uniqueResult();
	}
}