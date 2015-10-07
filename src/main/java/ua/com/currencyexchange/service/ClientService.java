/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.service;

import java.util.List;

import org.springframework.validation.Errors;

import ua.com.currencyexchange.domain.Client;

/**
 * @author Irochka (afanasievaiv@ya.ru)
 */
public interface ClientService {
	boolean createClient(Client client, Errors errors);
	//boolean createClient(Client client, String[] clnContactStr, Errors errors);
	
	public List<Client> getClientList();
	
	public List<Client> getClientListByCompany(Long id);
	
	public void updateClient(Client client, Errors errors);
	//public void updateClient(Client client, String[] clnContactStr, Errors errors);
	
	Client getClientByPhone(String phone);
}
