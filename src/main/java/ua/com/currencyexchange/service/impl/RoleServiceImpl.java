/* 
 * Copyright (c) 2015
 */

package ua.com.currencyexchange.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import java.util.List;

import javax.inject.Inject;

import ua.com.currencyexchange.domain.Role;
import ua.com.currencyexchange.service.RoleService;
import ua.com.currencyexchange.dao.RoleDao;

/**
 * @author Irochka 
 */
@Service
@Transactional(readOnly = true)
public class RoleServiceImpl implements RoleService  {
@Inject private RoleDao roleDao;
	
	public List<Role> getRoleList() {
        return roleDao.getRoleList();
    }
}
