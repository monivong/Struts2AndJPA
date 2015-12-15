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
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findByUsername", query = "SELECT u FROM User u WHERE u.username = :username"),
    @NamedQuery(name = "User.findByNomPrenom", query = "SELECT u FROM User u WHERE u.nomPrenom = :nomPrenom"),
    @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password")})
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "nom_prenom")
    private String nomPrenom;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "password")
    private String password;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idProf")
    private Collection<Evaluation> evaluationCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idProf")
    private Collection<Evaluationcours> evaluationcoursCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "proprietaire")
    private Collection<Exemplaire> exemplaireCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "detenteur")
    private Collection<Exemplaire> exemplaireCollection1;

    public User() {
    }

    public User(String username) {
        this.username = username;
    }

    public User(String username, String nomPrenom, String password) {
        this.username = username;
        this.nomPrenom = nomPrenom;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNomPrenom() {
        return nomPrenom;
    }

    public void setNomPrenom(String nomPrenom) {
        this.nomPrenom = nomPrenom;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @XmlTransient
    public Collection<Evaluation> getEvaluationCollection() {
        return evaluationCollection;
    }

    public void setEvaluationCollection(Collection<Evaluation> evaluationCollection) {
        this.evaluationCollection = evaluationCollection;
    }

    @XmlTransient
    public Collection<Evaluationcours> getEvaluationcoursCollection() {
        return evaluationcoursCollection;
    }

    public void setEvaluationcoursCollection(Collection<Evaluationcours> evaluationcoursCollection) {
        this.evaluationcoursCollection = evaluationcoursCollection;
    }

    @XmlTransient
    public Collection<Exemplaire> getExemplaireCollection() {
        return exemplaireCollection;
    }

    public void setExemplaireCollection(Collection<Exemplaire> exemplaireCollection) {
        this.exemplaireCollection = exemplaireCollection;
    }

    @XmlTransient
    public Collection<Exemplaire> getExemplaireCollection1() {
        return exemplaireCollection1;
    }

    public void setExemplaireCollection1(Collection<Exemplaire> exemplaireCollection1) {
        this.exemplaireCollection1 = exemplaireCollection1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (username != null ? username.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.username == null && other.username != null) || (this.username != null && !this.username.equals(other.username))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.samnangalex.jpa.User[ username=" + username + " ]";
    }
    
}
