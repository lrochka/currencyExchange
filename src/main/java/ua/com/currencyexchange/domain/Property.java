/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * @author Irochka (afanaseivaiv@ya.ru)
 *
 */
@Entity
@Table(name = "properties")
@NamedQuery(name = "properties.bySectionAndCode",
	query = "from Property p where p.section = :section")
@SuppressWarnings("serial")
public class Property{ // implements Serializable{
	
	private Long id;
	private Long section;
	private String propCode, propNameEN, propNameUA, propNameRU;
	
	public Property() { }
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() { return id; }
	
	@SuppressWarnings("unused")
	private void setId(Long id) { this.id = id; }

	@NotNull
	@Size(min = 1, max = 255)
	@Column(name = "spropCode")
	public String getPropCode() { return propCode; }

	public void setPropCode(String propCode) { this.propCode = propCode; }

	@NotNull
	@Size(min = 1, max = 255)
	@Column(name = "spropNameEN")
	public String getPropNameEN() { return propNameEN; }

	public void setPropNameEN(String propNameEN) { this.propNameEN = propNameEN; }

	@NotNull
	@Size(min = 1, max = 255)
	@Column(name = "spropNameUA")
	public String getPropNameUA() { return propNameUA; }

	public void setPropNameUA(String propNameUA) { this.propNameUA = propNameUA; }

	@NotNull
	@Size(min = 1, max = 255)
	@Column(name = "spropNameRU")
	public String getPropNameRU() { return propNameRU; }

	public void setPropNameRU(String propNameRU) { this.propNameRU = propNameRU; }
	
	@Column(name = "nsection")
	public Long getSection() { return section; }

	public void setSection(Long section) { this.section = section; }
	
	public String getNamedProperty(String propCode, String lang){
		String res = "NA";
		
			if ((this.getPropCode()==propCode)&&(lang == "UA")) res=this.getPropNameUA();
			if ((this.getPropCode()==propCode)&&(lang == "RU")) res=this.getPropNameRU();
			if ((this.getPropCode()==propCode)&&(lang == "EN")) res=this.getPropNameEN();
		
		return res;
	}
	/*
	class Property{
	private String propCode, propNameEN, propNameUA, propNameRU;
	
	public Property(){
	}
	
	/**
	 * Add the given property.
	 * 
	 * @param propCode
	 *            properties code
	 * @param propNameEN
	 *            properties english name
	 * @param propNameUA
	 *            properties ukrainian name
	 * @param propNameRU
	 *            properties russian name
	 */
	
	/*
	public Property(String propCode, String propNameEN, String propNameUA, String propNameRU){
		this.propCode = propCode; 
		this.propNameEN = propNameEN;
		this.propNameUA = propNameUA;
		this.propNameRU = propNameRU;
	}
	
	public void updateProp(String propCode, String propNameEN, String propNameUA, String propNameRU){
		this.setPropCode(propCode);
		this.setPropNameEN(propNameEN);
		this.setPropNameUA(propNameUA);
		this.setPropNameRU(propNameRU);
	}
	
	public void setPropCode(String propCode){
		this.propCode = propCode;
	}
	
	public String getPropCode(){
		return this.propCode;
	}
	
	public void setPropNameEN(String propNameEN){
		this.propNameEN = propNameEN;
	}
	
	public String getPropNameEN(){
		return this.propNameEN;
	}
	
	public void setPropNameUA(String propNameUA){
		this.propNameUA = propNameUA;
	}
	
	public String getPropNameUA(){
		return this.propNameUA;
	}

	public void setPropNameRU(String propNameRU){
		this.propNameRU = propNameRU;
	}
	
	public String getPropNameRU(){
		return this.propNameRU;
	}
	}
	
	private Set<Property> props;
	private String lang;
	
	public Properties(){
		 this.props = new HashSet<Property>();
		 uploadSetProperties();
		 this.lang = "RU";
	}
	
	public Properties(String lang){
		 this.props = new HashSet<Property>();
		 uploadSetProperties();
		 this.lang = lang;
	}
	
	public void setLang(String lang){
		this.lang = lang;
		if ((this.lang!="RU")&&(this.lang!="UA")&&(this.lang!="EN")) this.lang = "RU";
	}
	
	public String getLang(){
		return this.lang;
	}
	
	public void setProps(Set<Property> props){
		this.props = props;
	}
	
	public Set<Property> getProps(){
		return this.props;
	}
	
	public void addProperty(Property prop){
		this.props.add(prop);
	}
	
	public void uploadSetProperties(){
		
		Property prop = new Property("rregister", "Register","Зареєструвати","Зарегистрировать");
		this.addProperty(prop);
		//prop.updateProp("rusername","UserName","Логін","Логин");
		Property prop1 = new Property("rusername","UserName","Логін","Логин");
		this.addProperty(prop1);

	}
	

	public String getNameProperty(String propCode){
		
		return getNamedProperty(propCode, this.lang);
	}
	
	public String getNamedProperty(String propCode, String lang){
		String res = "NA";
		
		for(Property prop : this.props)
		{
			if ((prop.getPropCode()==propCode)&&(lang == "UA")) res=prop.getPropNameUA();
			if ((prop.getPropCode()==propCode)&&(lang == "RU")) res=prop.getPropNameRU();
			if ((prop.getPropCode()==propCode)&&(lang == "EN")) res=prop.getPropNameEN();
		}
		
		return res;
	}*/
}