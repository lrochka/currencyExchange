/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.security.core.GrantedAuthority;

/**
 * @author Irochka 
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "permission")
public class Permission implements GrantedAuthority {
	private Long id;
	private String code;
	private String name;
	
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
	/* (non-Javadoc)
	 * @see org.springframework.security.core.GrantedAuthority#getAuthority()
	 */
	@Transient
	public String getAuthority() { return code; }
	
	@Override
	public boolean equals(Object o) {
		GrantedAuthority ga = (GrantedAuthority) o;
		return (getAuthority().equals(ga.getAuthority()));
	}
	
	@Override
	public int hashCode() {
		return getAuthority().hashCode();
	}
}
