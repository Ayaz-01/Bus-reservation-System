package com.masai.Dto;

public class Buss {
private int bid;
private String source;
private String destination;
private String arrival;
private String departure;
private String duration;
private String seats;
private String seatsBooked;
private int fare;
public Buss() {}
public Buss(int bid, String source, String destination, String arrival, String departure, String duration, String seats,
		String seatsBooked, int fare) {
	super();
	this.bid = bid;
	this.source = source;
	this.destination = destination;
	this.arrival = arrival;
	this.departure = departure;
	this.duration = duration;
	this.seats = seats;
	this.seatsBooked = seatsBooked;
	this.fare = fare;
}
public int getBid() {
	return bid;
}
public void setBid(int bid) {
	this.bid = bid;
}
public String getSource() {
	return source;
}
public void setSource(String source) {
	this.source = source;
}
public String getDestination() {
	return destination;
}
public void setDestination(String destination) {
	this.destination = destination;
}
public String getArrival() {
	return arrival;
}
public void setArrival(String arrival) {
	this.arrival = arrival;
}
public String getDeparture() {
	return departure;
}
public void setDeparture(String departure) {
	this.departure = departure;
}
public String getDuration() {
	return duration;
}
public void setDuration(String duration) {
	this.duration = duration;
}
public String getSeats() {
	return seats;
}
public void setSeats(String seats) {
	this.seats = seats;
}
public String getSeatsBooked() {
	return seatsBooked;
}
public void setSeatsBooked(String seatsBooked) {
	this.seatsBooked = seatsBooked;
}
public int getFare() {
	return fare;
}
public void setFare(int fare) {
	this.fare = fare;
}
@Override
public String toString() {
	return "bid=" + bid + ", source=" + source + ", destination=" + destination + ", arrival=" + arrival
			+ ", departure=" + departure + ", duration=" + duration + ", seats=" + seats + ", seatsBooked="
			+ seatsBooked + ", fare=" + fare + "";
}

}
