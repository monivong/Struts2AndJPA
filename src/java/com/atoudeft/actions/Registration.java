package com.atoudeft.actions;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.atoudeft.dao.UserDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Registration extends ActionSupport implements SessionAware {

	UserDAO userDAO = new UserDAO();
	private Map<String, Object> session;
	private String username, password;
	  
	@Override
	public void setSession(Map<String, Object> s) {
		// TODO Auto-generated method stub
		session = s;
	}

	public String execute()
	{
		if (username==null)
			return INPUT;
		if (UserDAO.addUser(username, password))
			return SUCCESS;
		return INPUT;
	}


        public void validate()
        {
            if (username!=null && username.indexOf('@')==-1)
                    this.addFieldError("username", "[Exemple de validation] Le username doit contenir le caractere @.");
            if (password!=null && password.length()<3)
                    this.addFieldError("password", "Le mot de passe doit avoir au moins 3 caracteres.");
        }
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
