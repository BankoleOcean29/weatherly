import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;

const apiKey = '2946fdad69fc70f4e3a043f999e3981a';

double? longitude;
double? latitude;
//https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

void getWeatherData() async {
  http.Response response = (await Uri.https('https://api.openweathermap.org/data/2.5/weather?lat=${''}&lon={lon}&appid=${apiKey}')) as http.Response;
}