package com.atoudeft.actions;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.atoudeft.dao.LivreDAO;
import com.atoudeft.entites.Book;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.opensymphony.xwork2.ActionSupport;
import com.samnangalex.jpa.Evaluation;
import com.samnangalex.jpa.Exemplaire;
import com.samnangalex.jpa.ExemplairePK;
import com.samnangalex.jpa.Livre;
import com.samnangalex.jpa.User;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ListIterator;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        private List<Evaluation> maListeDesCommentaires;
        private Exemplaire monExemplaire;        
	  
	@Override
	public void setSession(Map<String, Object> s) {
		// TODO Auto-generated method stub
		session = s;
	}

	public String list()
	{
            
                //   if (!session.containsKey("connecte"))
                //   	return INPUT;
                //bookList = LivreDAO.getBookList();
                
                //Mise à jour de la colonne Note de la table Livre à l'aide du DAO
            try {
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection cnx = null;
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/livres?user=root&password=root");
                java.sql.Statement stm = null;
                stm = cnx.createStatement();
                stm.execute("UPDATE livre SET note = (SELECT AVG(note) FROM evaluation WHERE livre.ISBN = evaluation.idLivre)");
            } catch(SQLException e) {
                
            } catch(Exception ex) {
                
            }
            /* source de : 
                http://www.tutorialspoint.com/jdbc/jdbc-update-records.htm
                http://docs.oracle.com/javase/tutorial/jdbc/basics/prepared.html */
            
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("Struts2AndJPAPU");
            EntityManager em = emf.createEntityManager();
            /*
            Query requete = em.createNativeQuery("UPDATE livre SET livre.note = (SELECT AVG(evaluation.note) FROM evaluation WHERE evaluation.idLivre = livre.isbn)");
            int nbrLignesAffectees = requete.executeUpdate();
            // source de : http://www.objectdb.com/java/jpa/query/jpql/update
            */
            
            Query requete = em.createNamedQuery("Livre.findAll");            
            maListeDesLivres = requete.getResultList();
            
            return SUCCESS;                        
	}
	public String add()
	{
            /*
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
            */
            if( this.monLivre != null ) {
                if( monLivre.getNomAuteur().matches(".*\\d+.*") ) {
                    this.addFieldError("monLivre.nomAuteur", "Erreur ! Le nom de l'auteur ne doit pas contenir de chiffres.");
                    return INPUT;
                } else {
                    EntityManagerFactory emf = Persistence.createEntityManagerFactory("Struts2AndJPAPU");
                    EntityManager em = emf.createEntityManager();
                    try {
                        em.getTransaction().begin();
                        Livre unLivre = new Livre();
                        unLivre.setIsbn( this.monLivre.getIsbn() );
                        unLivre.setTitre( this.monLivre.getTitre() );
                        unLivre.setEdition( this.monLivre.getEdition() );
                        unLivre.setAnnee( this.monLivre.getAnnee() );
                        unLivre.setMotsCles( this.monLivre.getMotsCles() );
                        unLivre.setNomAuteur( this.monLivre.getNomAuteur() );
                        unLivre.setDescription( this.monLivre.getDescription() );
                        unLivre.setNbPages( this.monLivre.getNbPages() );
                        em.persist( unLivre );
                        em.getTransaction().commit();
                        this.addActionMessage("Livre ajoute avec succes.");
                        return SUCCESS;
                    } catch(Exception e) {
                        em.getTransaction().rollback();
                        this.addActionMessage("L'ISBN existe deja.");
                        return INPUT;
                    } finally {
                        em.close();
                    }
                }
            } else {
                return INPUT;
            }
	}
        public String addBookCopy() {            
            return SUCCESS;
        }
        public String submitBookCopy() {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("Struts2AndJPAPU");
            EntityManager em = emf.createEntityManager();
            try {
                em.getTransaction().begin();
                // Chercher le plus grand id selon l'ISBN donné
                Query requete = em.createNamedQuery("Exemplaire.findMaxIdByIsbn");
                requete.setParameter("isbn", this.monLivre.getIsbn() );
                List maxId = requete.getResultList();                
                int nouveauId = Integer.parseInt( maxId.listIterator().next().toString() );
                
                ExemplairePK unExemplairePK = new ExemplairePK();
                unExemplairePK.setIsbn( monLivre.getIsbn() );                
                unExemplairePK.setNumero( (short)++nouveauId );
                Exemplaire unExemplaire = new Exemplaire();
                unExemplaire.setExemplairePK( unExemplairePK );
                unExemplaire.setProprietaire( monExemplaire.getProprietaire() );
                unExemplaire.setDetenteur( monExemplaire.getDetenteur() );
                em.persist( unExemplaire );
                em.getTransaction().commit();
                this.addActionMessage("BRAVO ! Votre exemplaire a bien été ajouté.");
            } catch(Exception e) {
                em.getTransaction().rollback();
                return INPUT;
            } finally {
              em.close();
            }
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
            
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("Struts2AndJPAPU");
            EntityManager em = emf.createEntityManager();
            Query requete = em.createNamedQuery("Evaluation.findByIdLivre");
            requete.setParameter("idLivre", this.monLivre );
            maListeDesCommentaires = requete.getResultList();
           
            /*
            maListeDesCommentaires = new ArrayList<Evaluation>();
            maListeDesCommentaires.add(new Evaluation(1, new User("adupont"), new Livre("978-1-4302-2889-9"), (short)8, "Très bon livre couvrant une bonne partie de la technologie Java-EE avec une étude assez approfondie de JPA. Le livre couvre aussi le framework JSF ainsi que les services web (SOAP et Restful).Le seul reproche que je peux lui faire est qu'il ne couvre pas les fondements de la programmation web (servlets et JSP)."));
            */
            return SUCCESS;
        }
        
        public String submitEvaluation() {
            
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("Struts2AndJPAPU");
            EntityManager em = emf.createEntityManager();
            try {
                em.getTransaction().begin();
                Evaluation temp = new Evaluation();
                temp.setIdProf( (User)this.session.get("idProf") );
                temp.setIdLivre(monLivre);
                temp.setNote( (short)this.uneNote );
                temp.setCommentaire( this.unCommentaire );
                System.out.println( temp );
                em.persist( temp );
                em.getTransaction().commit();
            } catch(Exception e) {
                em.getTransaction().rollback();
                return INPUT;
            } finally {                
                em.close();               
            }            
            return SUCCESS;
        }
        
        @Override
        public void validate()
        {
            if (!session.containsKey("connecte")) {
                this.addActionError("Vous devez vous connecter pour accéder aux infos sur les livres");
            }
            if( (this.uneNote < 0) || (this.uneNote > 10) ) {
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
        public List<Evaluation> getMaListeDesCommentaires() {
            return maListeDesCommentaires;
        }
        public void setMaListeDesCommentaires(List<Evaluation> maListeDesCommentaires) {
            this.maListeDesCommentaires = maListeDesCommentaires;
        }
        public Exemplaire getMonExemplaire() {
            return monExemplaire;
        }
        public void setMonExemplaire(Exemplaire monExemplaire) {
            this.monExemplaire = monExemplaire;
        }
}