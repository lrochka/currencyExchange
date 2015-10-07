/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Collection;

import javax.inject.Inject;

import org.hibernate.Hibernate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PostFilter;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.acls.domain.BasePermission;
import org.springframework.security.acls.domain.ObjectIdentityImpl;
import org.springframework.security.acls.domain.PrincipalSid;
import org.springframework.security.acls.model.MutableAcl;
import org.springframework.security.acls.model.MutableAclService;
import org.springframework.security.acls.model.ObjectIdentity;
import org.springframework.security.acls.model.Sid;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;

import ua.com.currencyexchange.dao.ClientDao;
import ua.com.currencyexchange.domain.Account;
import ua.com.currencyexchange.domain.Client;
import ua.com.currencyexchange.domain.ClientContact;
import ua.com.currencyexchange.domain.ClientTypeContact;
import ua.com.currencyexchange.service.ClientService;

/**
 * @author Irochka (afanasievaiv@ya.ru)
 */
@Service
@Transactional(readOnly = true)
public class ClientServiceImpl implements ClientService {
private static final Logger log = LoggerFactory.getLogger(AccountServiceImpl.class);

	@Inject private ClientDao clientDao;

	@Override
	@Transactional(readOnly = false)
	public boolean createClient(Client client, Errors errors) {
		//public boolean createClient(Client client, String[] clnContactStr, Errors errors)
		
		validatePhone(client.getPhone(), errors);
		boolean valid = !errors.hasErrors();
		
		if (valid) {
			/*Collection<ClientContact> clnContacts = new HashSet<ClientContact>();
			for(String c : clnContactStr) {
				ClientContact clnContact = new ClientContact();
				clnContact.setClnTypeContact(clientDao.findByIdClientTypeContact(Integer.toUnsignedLong(Integer.getInteger(c.split(";")[0]))));
				clnContact.setValue(c.split(";")[1]);
				clnContacts.add(clnContact);
				}
			
			client.setClnContacts(clnContacts);*/
			clientDao.register(client);
		}
		
		return valid;
	}

	@Override
	public List<Client> getClientList() {
		return clientDao.getClientList();
	}

	@Override
	public List<Client> getClientListByCompany(Long id) {
		return clientDao.getClientListByCompany(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public void updateClient(Client client, Errors errors) {
		/*Collection<ClientContact> clnContacts = new HashSet<ClientContact>();
		for(String c : clnContactStr) 
			{
			ClientContact clnContact = new ClientContact();
			clnContact.setClnTypeContact(clientDao.findByIdClientTypeContact(Integer.toUnsignedLong(Integer.getInteger(c.split(";")[0]))));
			clnContact.setValue(c.split(";")[1]);
			clnContacts.add(clnContact);
			}
		
		client.setClnContacts(clnContacts);*/
		clientDao.updating(client);
	}

	@Override
	public Client getClientByPhone(String phone) {
		Client client = clientDao.findByPhone(phone);
		return client;
	}
	
	private void validatePhone(String phone, Errors errors) {
		if (clientDao.findByPhone(phone) != null) {
			log.debug("Validation failed: duplicate username");
			errors.rejectValue("phone", "error.duplicate", new String[] { phone }, "Этот телефон уже используется!");
		}
	}

}
