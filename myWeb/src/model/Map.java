package model;

public class Map {
	private double lon;
	private double lat;
	public Map(double lon, double lat) {
		super();
		this.lon = lon;
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	
}
