import 'dart:convert';

import 'package:demo/post.dart';
import 'package:http/http.dart' as http;

//onle is post API
class PostAPIHelper {
  PostAPIHelper._();
  static final PostAPIHelper postAPIHelper = PostAPIHelper._();

  Future<List<Post>?> fetchMultidata({required String API}) async {
    http.Response res = await http.get(Uri.parse(API));

    if (res.statusCode == 200) {
      Map map = jsonDecode(res.body);

      List decode_list = map['hits'];
      List<Post> Posts = decode_list.map((e) => Post.fromMap(data: e)).toList();

      return Posts;
    }
  }
}

//weather API Helper

class WeatherAIPHelper {
  WeatherAIPHelper._();
  static final WeatherAIPHelper weatherAIPHelper = WeatherAIPHelper._();

  Future<Weather?> fetchMultipaldata({required String city_name}) async {
    String API = "64c104cee4698540d32d3f36c0ea4e62";
    http.Response res = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city_name&appid=$API"));

    if (res.statusCode == 200) {
      Map<String, dynamic> Jsondata = jsonDecode(res.body);

      Weather weather = Weather.fromMap(data: Jsondata);

      return weather;
    }
  }
}
