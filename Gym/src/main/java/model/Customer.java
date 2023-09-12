package model;

import java.io.Serializable;

public class Customer implements Serializable {
	private String code;
	private String name;
	private String pass;
	private String telno;
	private String postalcode;
	private String address;
	private String startdate;
	private String rank;
	private String status;
	private boolean delete_flag;
	
	public Customer() { }
	
	public Customer(String code, String pass) {
		this.code = code;
		this.pass = pass;
	}
	
	public Customer(String code, String name, String telno, String postalcode, String address, String rank) {
		this.code = code;
		this.name = name;
		this.telno = telno;
		this.postalcode = postalcode;
		this.address = address;
		this.rank = rank;
	}
	
	public Customer(String code, String name, String pass, String telno, String postalcode, String address, String startdate, String rank, String status, boolean delete_flag) {
		this.code = code;
		this.name = name;
		this.pass = pass;
		this.telno = telno;
		this.postalcode = postalcode;
		this.address = address;
		this.startdate = startdate;
		this.rank = rank;
		this.status = status;
		this.delete_flag = delete_flag;
	}

	public String getCode() { return code; }
	public void setCode(String code) { this.code = code; }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	public String getPass() { return pass; }
	public void setPass(String pass) { this.pass = pass; }

	public String getTelno() { return telno; }
	public void setTelno(String telno) { this.telno = telno; }

	public String getPostalcode() { return postalcode; }
	public void setPostalcode(String postalcode) { this.postalcode = postalcode; }

	public String getAddress() { return address; }
	public void setAddress(String address) { this.address = address; }

	public String getStartdate() { return startdate; }
	public void setStartdate(String startdate) { this.startdate = startdate; }

	public String getRank() { return rank; }
	public void setRank(String rank) { this.rank = rank; }

	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }

	public boolean isDelete_flag() { return delete_flag;}
	public void setDelete_flag(boolean delete_flag) { this.delete_flag = delete_flag;}

}
