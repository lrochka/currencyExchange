/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.dao.jdbc;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import ua.com.currencyexchange.dao.UserDetailsDao;

/**
 * @author Irochka (afanasievaiv@ya.ru)
 */
@Repository
public class JdbcUserDetailsDao implements UserDetailsDao {
	@Inject private JdbcTemplate jdbcTemplate;
	
	private static final String FIND_PASSWORD_SQL =
		"select spassword from userlist where slogin = ?";

	@Override
	public String findPasswordByUsername(String username) {
		return jdbcTemplate.queryForObject(
			FIND_PASSWORD_SQL, new Object[] { username }, String.class);
	}
}
