package com.atoudeft.actions;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.atoudeft.dao.UserDAO;
import com.opensymphony.xwork2.ActionSupport;
import com.samnangalex.jpa.User;
import java.util.List;
import java.util.ListIterator;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class Authentification extends ActionSupport implements SessionAware {

	private Map<String, Object> session;
	private String username, password;
	  
	@Override
	public void setSession(Map<String, Object> s) {
		// TODO Auto-generated method stub
		session = s;
	}

	public String login()
	{
            /*
		if (UserDAO.checkLogin(username, password))
		{
			session.put("connecte", true);
			return SUCCESS;
		}
                return INPUT;
            */
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("Struts2AndJPAPU");
            //EntityManagerFactory emf = Persistence.createEntityManagerFactory("jdbc:mysql://localhost:3306/livres;user=root;password=root");            
            EntityManager em = emf.createEntityManager();            
            try {
                Query requete = em.createNamedQuery("User.findByUsername");
                requete.setParameter("username", this.username);
                List<User> uneListeUtilisateurs = requete.getResultList();
                if( uneListeUtilisateurs.isEmpty() ) {
                    //System.out.println("<h2>la variable unUser est nulle...</h2>");                
                    this.addFieldError("username", "ERREUR ! Il n'y a aucun utilisateur { " + this.username + " }");
                    return INPUT;
                } else {
                    ListIterator iterateur = uneListeUtilisateurs.listIterator();
                    while( iterateur.hasNext() ) {
                        User temp = (User)iterateur.next();
                        if(!temp.getPassword().equals(this.password)){
                            this.addFieldError("password", "ERREUR ! Le mot de passe saisi est incorrect.");
                            return INPUT;
                        } else {
                            session.put("connecte", true);
                            session.put("idProf", temp );
                            return SUCCESS;
                        }
                    }
                }              
                return INPUT;
            } finally {
                em.close();
            }
	}
	public String logout()
	{
		session.remove("connecte");
		session.clear();
		return SUCCESS;
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
