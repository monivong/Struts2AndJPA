package com.samnangalex.jpa;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "exemplaire")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Exemplaire.findAll", query = "SELECT e FROM Exemplaire e"),
    @NamedQuery(name = "Exemplaire.findByIsbn", query = "SELECT e FROM Exemplaire e WHERE e.exemplairePK.isbn = :isbn"),
    @NamedQuery(name = "Exemplaire.findByNumero", query = "SELECT e FROM Exemplaire e WHERE e.exemplairePK.numero = :numero")})
public class Exemplaire implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ExemplairePK exemplairePK;
    @JoinColumn(name = "isbn", referencedColumnName = "ISBN", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Livre livre;
    @JoinColumn(name = "proprietaire", referencedColumnName = "username")
    @ManyToOne(optional = false)
    private User proprietaire;
    @JoinColumn(name = "detenteur", referencedColumnName = "username")
    @ManyToOne(optional = false)
    private User detenteur;

    public Exemplaire() {
    }

    public Exemplaire(ExemplairePK exemplairePK) {
        this.exemplairePK = exemplairePK;
    }

    public Exemplaire(String isbn, short numero) {
        this.exemplairePK = new ExemplairePK(isbn, numero);
    }

    public ExemplairePK getExemplairePK() {
        return exemplairePK;
    }

    public void setExemplairePK(ExemplairePK exemplairePK) {
        this.exemplairePK = exemplairePK;
    }

    public Livre getLivre() {
        return livre;
    }

    public void setLivre(Livre livre) {
        this.livre = livre;
    }

    public User getProprietaire() {
        return proprietaire;
    }

    public void setProprietaire(User proprietaire) {
        this.proprietaire = proprietaire;
    }

    public User getDetenteur() {
        return detenteur;
    }

    public void setDetenteur(User detenteur) {
        this.detenteur = detenteur;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (exemplairePK != null ? exemplairePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Exemplaire)) {
            return false;
        }
        Exemplaire other = (Exemplaire) object;
        if ((this.exemplairePK == null && other.exemplairePK != null) || (this.exemplairePK != null && !this.exemplairePK.equals(other.exemplairePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.samnangalex.jpa.Exemplaire[ exemplairePK=" + exemplairePK + " ]";
    }
    
}
