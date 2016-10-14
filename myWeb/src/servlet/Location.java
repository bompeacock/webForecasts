package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import model.City;
import model.Forecast;
import model.History;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import sun.rmi.server.Dispatcher;
import sun.swing.SwingUtilities2.Section;

/**
 * Servlet implementation class location
 */
@WebServlet("/Location")
public class Location extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Location() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			todo(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


	private void todo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String location = request.getParameter("location");
		location=formatURL(location);
		String url = "http://api.openweathermap.org/data/2.5/forecast/daily?q="+location+"&mode=json&units=metric&cnt=7&appid=cc4d77589e94fa2e5662fd6ff865aab6";
		String json = readJsonFromUrl(url);
		System.out.println(json);
		City city = getWeather(json);
		
		//xu ly history
		String  check = city.getName();
		for(int i =0;i< History.HISTORY.size();i++){
			if(check.equalsIgnoreCase( (String) History.HISTORY.get(i))){
				History.HISTORY.remove(i);
			}
		}
		History.HISTORY.add(city.getName());
		request.setAttribute("city", city);
		ArrayList<String> l  = History.HISTORY;
		System.out.println(l.get(5));
		request.setAttribute("history", l);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
		
	}
	private String getIcon(String s){
		return "http://openweathermap.org/img/w/"+s+".png";
	}
	private City getWeather(String json) throws Exception {
		City city = new City();
		ArrayList<Forecast> listFocast =  new ArrayList<>();
		JSONParser parser = new JSONParser();
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		
		try{
			JSONObject object =  (JSONObject) parser.parse(json);
			
			JSONObject oj1  = (JSONObject) object.get("city");
			String name =  oj1.get("name").toString();
			String country =  oj1.get("country").toString();
			city.setName(name);
			city.setCountry(country);
			
			JSONArray forecast = (JSONArray) object.get("list");
			for (int i = 0; i < forecast.size(); i++) {
				Forecast fcast= new Forecast();
				JSONObject ojF = (JSONObject) forecast.get(i);
				long  time  = Long.parseLong(ojF.get("dt").toString());
				Date d = new Date(time*1000);
				long humidity = Long.parseLong(ojF.get("humidity").toString());
				double speed = Double.parseDouble(ojF.get("speed").toString());
				fcast.setDate(format.format(d));
				fcast.setHumidity(humidity);
				fcast.setWind(speed);
				
				JSONObject temp = (JSONObject) ojF.get("temp");
				double temperature = Double.parseDouble(temp.get("day").toString());
				double temperatureMax = Double.parseDouble(temp.get("max").toString());
				double temperatureMin = Double.parseDouble(temp.get("min").toString());
				fcast.setTemperature(temperature);
				fcast.setTemperatureMax(temperatureMax);
				fcast.setTemperatureMin(temperatureMin);
				
				
				
				
				JSONArray arrWeather = (JSONArray) ojF.get("weather");
				JSONObject weather = (JSONObject) arrWeather.get(0);
				String icon = getIcon(weather.get("icon").toString());
				String description = weather.get("description").toString();
				fcast.setScript(description);
				fcast.setIcon(icon);
				
				listFocast.add(fcast);
			}
			
			
			
		}
		catch(ParseException pe){
			
	         System.out.println("position: " + pe.getLocation());
	         System.out.println(pe);
		}
		city.setList(listFocast);
		return city;
		
	}


	private static String readAll(Reader rd) throws IOException {
	    StringBuilder sb = new StringBuilder();
	    int cp;
	    while ((cp = rd.read()) != -1) {
	      sb.append((char) cp);
	    }
	    rd.close();
	    return sb.toString();
	  }
	
	  public static String readJsonFromUrl(String l) throws IOException {
//	    InputStream is = new URL(url).openStream();
//	    try {
//	      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
//	      String jsonText = readAll(rd);
//	     
//	      return jsonText;
//	    } finally {
//	      is.close();
//	    }
//	  }
		
		  
	  URL net = new URL(l);
	    HttpURLConnection conn = (HttpURLConnection) net.openConnection();
	    conn.connect();
	    InputStreamReader in = new InputStreamReader((InputStream) conn.getContent());
	    BufferedReader buff = new BufferedReader(in);
	   return readAll(buff);
	  }
//		  BufferedReader reader = null;
//	        try {
//	            URL url = new URL(l);
//	            reader = new BufferedReader(new InputStreamReader(url.openStream()));
//	            StringBuffer buffer = new StringBuffer();
//	            int read;
//	            char[] chars = new char[1024];
//	            while ((read = reader.read(chars)) != -1)
//	                buffer.append(chars, 0, read); 
//
//	            return buffer.toString();
//	        } finally {
//	            if (reader != null)
//	                reader.close();
//	        }
//
//	  }


	private static String formatURL(String l) {
		String result="";
		String d="%20";
		l = l.trim();
		StringTokenizer token = new StringTokenizer(l," ");
		int count = token.countTokens();
		result =token.nextToken();
		if(count>1){
			while(token.hasMoreElements()){
				result += d+ token.nextToken();
			}
		}
		
		return result;
	}
	public static void main(String[] args) {
		
	}
}
