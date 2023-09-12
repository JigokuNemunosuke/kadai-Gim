package model;

import java.io.Serializable;

public class Login implements Serializable {
	private String code;
	private String pass;

	public Login() {}
	
	public Login(String code, String pass) {
		this.code = code;
		this.pass = pass;
	}
	
	public String getCode() { return code; }
	public void setCode(String code) { this.code = code; }
	public String getPass() { return pass; }
	public void setPass(String pass) { this.pass = pass; }
	
}