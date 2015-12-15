package com.samnangalex.jpa;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "evaluationcours")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Evaluationcours.findAll", query = "SELECT e FROM Evaluationcours e"),
    @NamedQuery(name = "Evaluationcours.findById", query = "SELECT e FROM Evaluationcours e WHERE e.id = :id"),
    @NamedQuery(name = "Evaluationcours.findByNote", query = "SELECT e FROM Evaluationcours e WHERE e.note = :note"),
    @NamedQuery(name = "Evaluationcours.findByCommentaire", query = "SELECT e FROM Evaluationcours e WHERE e.commentaire = :commentaire")})
public class Evaluationcours implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "note")
    private short note;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "commentaire")
    private String commentaire;
    @JoinColumn(name = "idLivre", referencedColumnName = "ISBN")
    @ManyToOne(optional = false)
    private Livre idLivre;
    @JoinColumn(name = "idProf", referencedColumnName = "username")
    @ManyToOne(optional = false)
    private User idProf;
    @JoinColumn(name = "idCours", referencedColumnName = "numero")
    @ManyToOne(optional = false)
    private Cours idCours;

    public Evaluationcours() {
    }

    public Evaluationcours(Integer id) {
        this.id = id;
    }

    public Evaluationcours(Integer id, short note, String commentaire) {
        this.id = id;
        this.note = note;
        this.commentaire = commentaire;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public short getNote() {
        return note;
    }

    public void setNote(short note) {
        this.note = note;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    public Livre getIdLivre() {
        return idLivre;
    }

    public void setIdLivre(Livre idLivre) {
        this.idLivre = idLivre;
    }

    public User getIdProf() {
        return idProf;
    }

    public void setIdProf(User idProf) {
        this.idProf = idProf;
    }

    public Cours getIdCours() {
        return idCours;
    }

    public void setIdCours(Cours idCours) {
        this.idCours = idCours;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Evaluationcours)) {
            return false;
        }
        Evaluationcours other = (Evaluationcours) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.samnangalex.jpa.Evaluationcours[ id=" + id + " ]";
    }
    
}
