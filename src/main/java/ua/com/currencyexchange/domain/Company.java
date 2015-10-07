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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * @author Irochka (afanasievaiv@ya.ru)
 */
@Entity
@Table(name = "companies")
@NamedQuery(name = "companies.byId", query = "from Company c where c.id= :id")
public class Company {
	private Long id;
	private String code;
	private String name;
	private String city;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() { return id; }
	
	@SuppressWarnings("unused")
	private void setId(Long id) { this.id = id; }
	
	@NotNull
	@Size(min = 1, max = 50)
	@Column(name = "scode")
	public String getCode() { return code; }

	public void setCode(String code) { this.code = code; }
	
	@NotNull
	@Size(min = 1, max = 50)
	@Column(name = "sname")
	public String getName() { return name; }

	public void setName(String name) { this.name = name; }
		
	@Column(name = "scity")
	public String getCity() { return city; }

	public void setCity(String city) { this.city = city; }
}
