import 'package:demo/helpexs/post_api_helper.dart';
import 'package:demo/post.dart';
import 'package:flutter/material.dart';

class weather extends StatefulWidget {
  const weather({Key? key}) : super(key: key);

  @override
  State<weather> createState() => _weatherState();
}

late Future myAPI;

class _weatherState extends State<weather> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myAPI =
        WeatherAIPHelper.weatherAIPHelper.fetchMultipaldata(city_name: "surat");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather API"), centerTitle: true),
      body: FutureBuilder(
        future: myAPI,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error is ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Weather? data = snapshot.data;
            return Card(
              elevation: 3,
              color: Colors.red,
              child: ListTile(
                leading: Text("${data!.temp}"),
                title: Text("${data.main}\n${data.description}\n${data.speed}"),
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
