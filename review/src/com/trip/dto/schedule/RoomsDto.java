package com.trip.dto.schedule;

public class RoomsDto {
int rooms_tid;
int rooms_id;
String rooms_day;
int rooms_cnt;

public RoomsDto() {
	super();
}
public RoomsDto(int rooms_tid, int rooms_id, String rooms_day) {
	super();
	this.rooms_tid = rooms_tid;
	this.rooms_id = rooms_id;
	this.rooms_day = rooms_day;
}


public RoomsDto(int rooms_tid, int rooms_id, String rooms_day, int rooms_cnt) {
	super();
	this.rooms_tid = rooms_tid;
	this.rooms_id = rooms_id;
	this.rooms_day = rooms_day;
	this.rooms_cnt = rooms_cnt;
}

public int getRooms_tid() {
	return rooms_tid;
}
public void setRooms_tid(int rooms_tid) {
	this.rooms_tid = rooms_tid;
}
public int getRooms_id() {
	return rooms_id;
}
public void setRooms_id(int rooms_id) {
	this.rooms_id = rooms_id;
}
public String getRooms_day() {
	return rooms_day;
}
public void setRooms_day(String rooms_day) {
	this.rooms_day = rooms_day;
}
public int getRooms_cnt() {
	return rooms_cnt;
}
public void setRooms_cnt(int rooms_cnt) {
	this.rooms_cnt = rooms_cnt;
}
}
