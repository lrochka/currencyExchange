/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.dao.hbn;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import ua.com.currencyexchange.dao.RoleDao;
import ua.com.currencyexchange.domain.Role;

/**
 * @author Irochka (afanasievaiv@ya.ru)
 */
@Repository
public class HbnRoleDao extends AbstractHbnDao<Role> implements RoleDao {

	public Role findByCode(String code) {
		Query q = getSession().getNamedQuery("role.byCode");
		q.setParameter("code", code);
		return (Role) q.uniqueResult();
	}
	
	public List<Role> getRoleList(){
		return this.getAll();
	}
}
