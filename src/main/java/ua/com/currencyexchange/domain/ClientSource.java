/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * @author Irochka 
 */
@Entity
@Table(name = "clninsrc")
@NamedQuery(name = "clninsrc.byCode",
	query = "from ClientSource c where c.code = :code")
public class ClientSource {
	private short id;
	private String code;
	private String name;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public short getId() { return id; }
	
	@SuppressWarnings("unused")
	private void setId(short id) { this.id = id; }
	
	@Column(name = "scode")
	public String getCode() { return code; }
	
	public void setCode(String code) { this.code = code; }

	@Column(name = "sname")
	public String getName() { return name; }
	
	public void setName(String name) { this.name = name; }

}
