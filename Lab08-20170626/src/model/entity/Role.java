package model.entity;

import java.util.Date;




import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.repackaged.org.joda.time.DateTimeZone;
import com.google.appengine.repackaged.org.joda.time.LocalDateTime;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Role {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private String nombre;
	@Persistent private boolean estatus;
	@Persistent private Date made;
	
	public Role(String nombre){
		this.nombre=nombre;
		this.estatus=true;
		LocalDateTime ldt = LocalDateTime.now(DateTimeZone.forID("America/Lima"));
		made=ldt.toDate();
	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public boolean isEstatus() {
		return estatus;
	}

	public void setEstatus(boolean estatus) {
		this.estatus = estatus;
	}

	public Date getMade() {
		return made;
	}

	public void setMade(Date made) {
		this.made = made;
	}
	
	

}
