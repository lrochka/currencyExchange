/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.dao;

import java.util.List;

import ua.com.currencyexchange.domain.Account;
import ua.com.currencyexchange.dao.Dao;

/**
 * @author Irochka 
 */
public interface AccountDao extends Dao<Account> {
	
	void create(Account account, String password);
	
	void update(Account account, String password);
	
	Account findByUsername(String username);
	
	public List<Account> getAccountList();
}
