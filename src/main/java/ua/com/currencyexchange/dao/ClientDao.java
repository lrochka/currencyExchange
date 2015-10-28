/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.dao;

import java.util.List;

import ua.com.currencyexchange.domain.Client;
import ua.com.currencyexchange.dao.Dao;

/**
 * @author Irochka 
 */
public interface ClientDao extends Dao<Client> {
	
	void register(Client client);
	
	void updating(Client client);
	
	public Client findByPhone(String phone);
	
	//public ClientTypeContact findByIdClientTypeContact(long id);
	
	public List<Client> getClientList();
	
	public List<Client> getClientListByCompany(Long id);
}
