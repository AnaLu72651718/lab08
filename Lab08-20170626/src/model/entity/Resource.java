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
public class Resource {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private String url;
	@Persistent private boolean status;
	@Persistent private Date made;
	
	public Resource(String nombre){
		this.url=nombre;
		this.status=true;
		LocalDateTime ldt = LocalDateTime.now(DateTimeZone.forID("America/Lima"));
		made=ldt.toDate();
		
	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Date getMade() {
		return made;
	}

	public void setMade(Date made) {
		this.made = made;
	}

}
