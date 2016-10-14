function getForecast() {
	var xmlhttp = new XMLHttpRequest();
	var data_file = "http://api.openweathermap.org/data/2.5/forecast/daily?q=England&mode=xml&units=metric&cnt=7&appid=d15d036a3d385400afa5a57435cada0d";
	xmlhttp.onreadystatechange = function(){
		if(this.readyState == 4&& this.status ==200){
			myFunction(this);
		}
	}

}

function myFunction(xml){
	var date,i, xmlDoc, country;
	var thu2 = {};
	xmlDoc = xml.responseXML;
	x= xmlDoc.getElementsByTagName("");
	for(i; i < x.length;i++){
		
	}
}