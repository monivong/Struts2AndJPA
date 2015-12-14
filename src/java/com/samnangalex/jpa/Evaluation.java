package com.samnangalex.jpa;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "evaluation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Evaluation.findAll", query = "SELECT e FROM Evaluation e"),
    @NamedQuery(name = "Evaluation.findById", query = "SELECT e FROM Evaluation e WHERE e.id = :id"),
    @NamedQuery(name = "Evaluation.findByNote", query = "SELECT e FROM Evaluation e WHERE e.note = :note"),
    @NamedQuery(name = "Evaluation.findByIdLivre", query = "SELECT e FROM Evaluation e WHERE e.idLivre = :idLivre")
})
public class Evaluation implements Serializable {

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
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "commentaire")
    private String commentaire;
    @JoinColumn(name = "idProf", referencedColumnName = "username")
    @ManyToOne(optional = false)
    private User idProf;
    @JoinColumn(name = "idLivre", referencedColumnName = "ISBN")
    @ManyToOne(optional = false)
    private Livre idLivre;

    public Evaluation() {
    }

    public Evaluation(Integer id) {
        this.id = id;
    }

    public Evaluation(Integer id, short note, String commentaire) {
        this.id = id;
        this.note = note;
        this.commentaire = commentaire;
    }
    
    public Evaluation(Integer id, User idProf, Livre idLivre, short note, String commentaire) {
        this.id = id;
        this.idProf = idProf;
        this.idLivre = idLivre;
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

    public User getIdProf() {
        return idProf;
    }

    public void setIdProf(User idProf) {
        this.idProf = idProf;
    }

    public Livre getIdLivre() {
        return idLivre;
    }

    public void setIdLivre(Livre idLivre) {
        this.idLivre = idLivre;
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
        if (!(object instanceof Evaluation)) {
            return false;
        }
        Evaluation other = (Evaluation) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.samnangalex.jpa.Evaluation[ id=" + id + " ]";
    }
    
}