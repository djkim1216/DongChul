package com.trip.member.dto;

public class MemberLoginDto {
	private int m_no;
	private String m_id;
	private String m_nick;
	private String m_pass;
	private String m_name;
	private String m_email;
	private String m_phone;
	private String m_flag;
	private String m_grade;
	private String platform;
	
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_flag() {
		return m_flag;
	}
	public void setM_flag(String m_flag) {
		this.m_flag = m_flag;
	}
	public String getM_grade() {
		return m_grade;
	}
	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}
	@Override
	public String toString() {
		return "MemberLoginDto [m_no=" + m_no + ", m_id=" + m_id + ", m_nick=" + m_nick + ", m_pass=" + m_pass + ", m_name=" + m_name
				+ ", m_email=" + m_email + ", m_phone=" + m_phone + ", m_flag=" + m_flag + ", m_grade=" + m_grade + "]";
	}

	
}
