/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.dao;

import java.util.List;

import ua.com.currencyexchange.domain.Role;


/**
 * @author Irochka 
 */
public interface RoleDao extends Dao<Role> {
	
	Role findByCode(String code);
	
	public List<Role> getRoleList();
}
