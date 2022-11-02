class Post {
  String? userImageURL;
  String? largeImageURL;
  int? previewHeight;
  int? previewWidth;
  String? tags;

  Post(
      {required this.largeImageURL,
      required this.previewHeight,
      required this.previewWidth,
      required this.userImageURL,
      required this.tags});

  factory Post.fromMap({required Map<String, dynamic> data}) {
    return Post(
        largeImageURL: data['largeImageURL'],
        previewHeight: data['previewHeight'],
        previewWidth: data['previewWidth'],
        userImageURL: data['userImageURL'],
        tags: data['tags']);
  }
}

//Weather
class Weather {
  String? main;
  String? description;
  double? temp;
  num? humidity;
  num? speed;

  Weather(
      {required this.description,
      required this.humidity,
      required this.main,
      required this.speed,
      required this.temp});

  factory Weather.fromMap({required Map<dynamic, dynamic> data}) {
    return Weather(
        description: data['weather'][0]['description'],
        humidity: data['main']['humidity'],
        main: data['weather'][0]['main'],
        speed: data['wind']['speed'],
        temp: data['main']['temp']);
  }
}
