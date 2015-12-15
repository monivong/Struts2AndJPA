package com.samnangalex.jpa;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "cours")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cours.findAll", query = "SELECT c FROM Cours c"),
    @NamedQuery(name = "Cours.findByNumero", query = "SELECT c FROM Cours c WHERE c.numero = :numero"),
    @NamedQuery(name = "Cours.findByNom", query = "SELECT c FROM Cours c WHERE c.nom = :nom"),
    @NamedQuery(name = "Cours.findByDuree", query = "SELECT c FROM Cours c WHERE c.duree = :duree")})
public class Cours implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "numero")
    private String numero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nom")
    private String nom;
    @Basic(optional = false)
    @NotNull
    @Column(name = "duree")
    private int duree;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idCours")
    private Collection<Evaluationcours> evaluationcoursCollection;

    public Cours() {
    }

    public Cours(String numero) {
        this.numero = numero;
    }

    public Cours(String numero, String nom, int duree) {
        this.numero = numero;
        this.nom = nom;
        this.duree = duree;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getDuree() {
        return duree;
    }

    public void setDuree(int duree) {
        this.duree = duree;
    }

    @XmlTransient
    public Collection<Evaluationcours> getEvaluationcoursCollection() {
        return evaluationcoursCollection;
    }

    public void setEvaluationcoursCollection(Collection<Evaluationcours> evaluationcoursCollection) {
        this.evaluationcoursCollection = evaluationcoursCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (numero != null ? numero.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cours)) {
            return false;
        }
        Cours other = (Cours) object;
        if ((this.numero == null && other.numero != null) || (this.numero != null && !this.numero.equals(other.numero))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.samnangalex.jpa.Cours[ numero=" + numero + " ]";
    }
    
}
