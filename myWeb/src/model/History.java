package model;

import java.util.ArrayList;

public class History {
	
	public static ArrayList HISTORY = getArr();
	public History() {
		
	}
	public static ArrayList<String> getArr (){
		ArrayList<String> s = new ArrayList<String>();
		s.add("");
		s.add("");
		s.add("");
		s.add("");
		s.add("");
		return s;
		
	}

	
}
