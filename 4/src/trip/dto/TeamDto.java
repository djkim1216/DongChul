package trip.dto;

public class TeamDto {
int t_id;
String t_name;
String t_leaderId;
String t_days;
String t_endDate;
String t_stage;
String t_flag;

public TeamDto() {
	
}
public TeamDto(int t_id, String t_name, String t_leaderId, String t_days, String t_endDate, String t_stage,
		String t_flag) {
	super();
	this.t_id = t_id;
	this.t_name = t_name;
	this.t_leaderId = t_leaderId;
	this.t_days = t_days;
	this.t_endDate = t_endDate;
	this.t_stage = t_stage;
	this.t_flag = t_flag;
}
public int getT_id() {
	return t_id;
}
public void setT_id(int t_id) {
	this.t_id = t_id;
}
public String getT_name() {
	return t_name;
}
public void setT_name(String t_name) {
	this.t_name = t_name;
}
public String getT_leaderId() {
	return t_leaderId;
}
public void setT_leaderId(String t_leaderId) {
	this.t_leaderId = t_leaderId;
}
public String getT_days() {
	return t_days;
}
public void setT_days(String t_days) {
	this.t_days = t_days;
}
public String getT_endDate() {
	return t_endDate;
}
public void setT_endDate(String t_endDate) {
	this.t_endDate = t_endDate;
}
public String getT_stage() {
	return t_stage;
}
public void setT_stage(String t_stage) {
	this.t_stage = t_stage;
}
public String getT_flag() {
	return t_flag;
}
public void setT_flag(String t_flag) {
	this.t_flag = t_flag;
}

}
