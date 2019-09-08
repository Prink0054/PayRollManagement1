package com.java.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class MessageRecord {

	@Id
	@GeneratedValue
	@Column(name="Id")
	private Integer id;
	
	
	//@Column(name="FROM_MSG")
	@OneToOne()
	private User from; 
	
	//@Column(name="TO_MSG")
	@OneToOne
	private User to;
	
	@Column(name="MSG_BODY")
	private String msgBody;
	
	@Column(name="MSG_DATE")
	private String date;
	



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	

	public User getFrom() {
		return from;
	}

	public void setFrom(User from) {
		this.from = from;
	}

	public User getTo() {
		return to;
	}

	public void setTo(User to) {
		this.to = to;
	}

	public String getMsgBody() {
		return msgBody;
	}

	public void setMsgBody(String msgBody) {
		this.msgBody = msgBody;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
