package model;

import java.text.DecimalFormat;

public class Forecast {
	private String date;
	private double temperature;
	private double temperatureMax;
	private double temperatureMin;
	private double wind;
	private double pressure;
	private long humidity;
	private String script;
	private String icon;
	
	
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Forecast() {
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public double getTemperature() {
		return temperature;
	}

	public void setTemperature(double temperature) {
		DecimalFormat df = new DecimalFormat("#.#");
		double tmp =Double.parseDouble( df.format(temperature));
		this.temperature = tmp;
	}

	public double getTemperatureMax() {
		return temperatureMax;
	}

	public void setTemperatureMax(double temperatureMax) {
		DecimalFormat df = new DecimalFormat("#.#");
		double tmp =Double.parseDouble( df.format(temperatureMax));
		this.temperatureMax = tmp;
	}

	public double getTemperatureMin() {
		return temperatureMin;
	}

	public void setTemperatureMin(double temperatureMin) {
		DecimalFormat df = new DecimalFormat("#.#");
		double tmp =Double.parseDouble( df.format(temperatureMin));
		this.temperatureMin = tmp;
	}

	public double getWind() {
		return wind;
	}

	public void setWind(double wind) {
		this.wind = wind;
	}

	public double getPressure() {
		return pressure;
	}

	public void setPressure(double pressure) {
		this.pressure = pressure;
	}

	public long getHumidity() {
		return humidity;
	}

	public void setHumidity(long humidity) {
		this.humidity = humidity;
	}

	public String getScript() {
		return script;
	}

	public void setScript(String script) {
		this.script = script;
	}
	
}
