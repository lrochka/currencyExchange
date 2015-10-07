/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.domain;

import java.util.Collection;
import java.util.HashSet;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Irochka (afanasievaiv@ya.ru)
 */
public class ClientTypeContact {
	
}
/*
@Entity
@Table(name = "clntypecontact")
@NamedQueries({
@NamedQuery(name = "clntypecontact.byCode",
	query = "from ClientTypeContact c where c.code = :code"),
@NamedQuery(name = "clntypecontact.byId",
query = "from ClientTypeContact c where c.id = :id")
})
public class ClientTypeContact {
	private Long id;
	private String code;
	private String name;
	
	private Collection<ClientContact> clnContacts = new HashSet<ClientContact>();
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() { return id; }
	
	@SuppressWarnings("unused")
	private void setId(Long id) { this.id = id; }
	
	@Column(name = "scode")
	public String getCode() { return code; }
	
	public void setCode(String code) { this.code = code; }

	@Column(name = "sname")
	public String getName() { return name; }
	
	public void setName(String name) { this.name = name; }
	
	@OneToMany(mappedBy = "clnTypeContact", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	public Collection<ClientContact> getClnContacts() { return clnContacts; }
	
	public void setClnContacts(Collection<ClientContact> clnContacts) { this.clnContacts = clnContacts; }

}*/