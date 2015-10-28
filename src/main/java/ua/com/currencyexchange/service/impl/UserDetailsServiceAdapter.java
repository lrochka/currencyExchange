/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.service.impl;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ua.com.currencyexchange.dao.UserDetailsDao;
import ua.com.currencyexchange.domain.Account;
import ua.com.currencyexchange.domain.UserDetailsAdapter;
import ua.com.currencyexchange.service.AccountService;

/**
 * Adapts the <code>AccountService</code> and <code>UserDetailsDao</code> to the <code>UserDetailsService</code>
 * interface so Spring Security can use them as an authentication source.
 * 
 * @author Irochka 
 */
@Service("userDetailsService")
@Transactional(readOnly = true)
public class UserDetailsServiceAdapter implements UserDetailsService {
	@Inject AccountService accountService;
	@Inject UserDetailsDao userDetailsDao;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {
		
		Account account = accountService.getAccountByUsername(username);
		
		// The UserDetailsService contract requires this.
		if (account == null) {
			throw new UsernameNotFoundException("No such user: " + username);
		} else if (account.getRoles().isEmpty()) {
			throw new UsernameNotFoundException("User " + username + " has no authorities");
		}
		
		UserDetailsAdapter user = new UserDetailsAdapter(account);
		user.setPassword(userDetailsDao.findPasswordByUsername(username));
		return user;
	}
}
