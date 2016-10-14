package model;

import java.util.ArrayList;

public class City {
	private String id;
	private String name;
	private String country;
	private Map map;
	ArrayList<Forecast> list;

	public City() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "City [id=" + id + ", name=" + name + ", country=" + country
				+ ", map=" + map + ", list=" + list + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Map getMap() {
		return map;
	}

	public void setMap(Map map) {
		this.map = map;
	}

	public ArrayList<Forecast> getList() {
		return list;
	}

	public void setList(ArrayList<Forecast> list) {
		this.list = list;
	}

}
