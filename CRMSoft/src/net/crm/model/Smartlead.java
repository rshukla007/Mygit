package net.crm.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="smartlead")
public class Smartlead {
	
	@Id
	@GeneratedValue
	private Integer id;
	
	private String leadType;
	
	private String leadName;
	
	private String leadDate;
	
	
	public Smartlead()
	{
		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLeadType() {
		return leadType;
	}

	public void setLeadType(String leadType) {
		this.leadType = leadType;
	}

	public String getLeadName() {
		return leadName;
	}

	public void setLeadName(String leadName) {
		this.leadName = leadName;
	}

	public String getLeadDate() {
		return leadDate;
	}

	public void setLeadDate(String leadDate) {
		this.leadDate = leadDate;
	}

	public Smartlead update(Smartlead sp) {
		// TODO Auto-generated method stub
		this.leadType = sp.leadType;
		this.leadName = sp.leadName;
		this.leadType = sp.leadDate;
		return this;
	}
	
}
