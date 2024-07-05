package com.store.sotre.model;
import jakarta.persistence.*;

@Entity
@Table(name = "adresses")
public class Adresse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String description;
    private String name;
    private String adresse;
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	public Adresse() {
		super();
	}
	public Adresse(Integer id, String description, String name, String adresse) {
		super();
		this.id = id;
		this.description = description;
		this.name = name;
		this.adresse = adresse;
		
	}
	@Override
	public String toString() {
		return "Adresse [id=" + id + ", description=" + description + ", name=" + name + ", adresse=" + adresse
				 + "]";
	}
	public Adresse(String name,String description,  String adresse) {
	    this.description = description;
	    this.name = name;
	    this.adresse = adresse;
	    
	}
   

}