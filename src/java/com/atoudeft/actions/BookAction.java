package com.atoudeft.actions;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.atoudeft.dao.LivreDAO;
import com.atoudeft.entites.Book;
import com.opensymphony.xwork2.ActionSupport;
import com.samnangalex.jpa.Livre;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class BookAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;
	private List<Book> bookList ;//= LivreDAO.getBookList();
	private Book livre ;//= new Book();
	private List<String> commentaires;
	private String unCommentaire;
        private int uneNote;
        private List<Livre> maListeDesLivres;    
        private Livre monLivre;    
	  
	@Override
	public void setSession(Map<String, Object> s) {
		// TODO Auto-generated method stub
		session = s;
	}

	public String list()
	{
     //   if (!session.containsKey("connecte"))
     //   	return INPUT;
            bookList = LivreDAO.getBookList();                
            
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("Struts2AndJPAPU");
            EntityManager em = emf.createEntityManager();
            /*
            Query requete = em.createNativeQuery("UPDATE livre SET livre.note = (SELECT AVG(evaluation.note) FROM evaluation WHERE evaluation.idLivre = livre.isbn)");
            int nbrLignesAffectees = requete.executeUpdate();
            */
            Query requete = em.createNamedQuery("Livre.findAll");            
            maListeDesLivres = requete.getResultList();
            
            return SUCCESS;                        
	}
	public String add()
	{
            if (livre!=null)
            {
                if( livre.getAuteur().matches(".*\\d+.*") ) {
                    this.addFieldError("livre.auteur", "Erreur ! Le nom de l'auteur ne devrait pas contenir de chiffres.");
                } else {
                    if (livre.getIsbn().trim().equals(""))
                    {
                            this.addFieldError("livre.isbn", "L'ISBN est obligatoire");
                            return SUCCESS;
                    }
                    if (LivreDAO.addBook(livre))
                    {
                            this.addActionMessage("Livre ajoute avec succes.");
                    }
                    else
                    {
                            this.addActionMessage("L'ISBN existe deja.");
                    }
                }
            }
            return SUCCESS;
	}
        public String addBookCopy() {
            return SUCCESS;
        }
	public String comment()
	{                            
            if (unCommentaire != null)
            {
                    LivreDAO.addComment(livre.getIsbn(), unCommentaire);
            }
            livre = LivreDAO.getBook(livre.getIsbn());
            commentaires = LivreDAO.getComments(livre.getIsbn());
            return SUCCESS;
	}

        public String addBookEvaluation() {
            return SUCCESS;
        }
        
        @Override
        public void validate()
        {
            if (!session.containsKey("connecte")) {
                this.addActionError("Vous devez vous connecter pour accéder aux infos sur les livres");
            }
            if(!( (this.uneNote >= 0) && (this.uneNote <= 10) ) ) {
                this.addFieldError("uneNote", "Erreur ! La note doit être compris entre 0 et 10.");
                //Source de :  https://struts.apache.org/docs/form-validation.html
            }
            /*
            if( this.livre.getAuteur().matches(".*\\d+.*") ) {
                this.addFieldError("livre.auteur", "Attention ! Le nom de l'auteur ne doit pas contenir de chiffres.");
            }
            */
        }

	public List<Book> getBookList() {
		return bookList;
	}
	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}
	public Book getLivre() {
		return livre;
	}
	public void setLivre(Book livre) {
		this.livre = livre;
	}
	public List<String> getCommentaires() {
		return commentaires;
	}
	public void setCommentaires(List<String> commentaires) {
		this.commentaires = commentaires;
	}
	public String getUnCommentaire() {
		return unCommentaire;
	}
	public void setUnCommentaire(String unCommentaire) {
		this.unCommentaire = unCommentaire;
	}	
        public int getUneNote() {
            return uneNote;
        }
        public void setUneNote(int uneNote) {
            this.uneNote = uneNote;
        }        
        public List<Livre> getMaListeDesLivres() {
            return maListeDesLivres;
        }
        public void setMaListeDesLivres(List<Livre> maListeDesLivres) {
            this.maListeDesLivres = maListeDesLivres;
        }
        public Livre getMonLivre() {
            return monLivre;
        }
        public void setMonLivre(Livre monLivre) {
            this.monLivre = monLivre;
        }
}