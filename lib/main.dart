import 'package:demo/helpexs/post_api_helper.dart';
import 'package:demo/post.dart';
import 'package:demo/weather.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'weather',
      routes: {
        '/': (context) => home(),
        'sreen': (context) => sreen(),
        'weather': (context) => weather(),
      },
    ),
  );
}

List<Post>? data;
int number = 0;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

final TextEditingController search = TextEditingController();

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _widht = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("API"), centerTitle: true),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextFormField(
                controller: search,
                onSaved: (val) {
                  setState(() {
                    PostAPIHelper.postAPIHelper.fetchMultidata(
                        API:
                            "https://pixabay.com/api/?key=30579047-59d4d724d23235f6f0ffdf3de&q=${search.text}&per_page=100");
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "EX. red+yellow"),
              ),
              FutureBuilder(
                future: PostAPIHelper.postAPIHelper.fetchMultidata(
                    API:
                        "https://pixabay.com/api/?key=30579047-59d4d724d23235f6f0ffdf3de&q=${search.text}&per_page=100"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error is ${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    data = snapshot.data;
                    return SizedBox(
                      height: _height * 0.82,
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemBuilder: (context, i) {
                            print(data);
                            return Card(
                              elevation: 3,
                              child: ListTile(
                                trailing: Text(
                                    "Height : ${data![i].previewHeight}\nWidth : ${data![i].previewWidth}"),
                                onTap: () {
                                  setState(() {
                                    number = i;
                                    Navigator.of(context).pushNamed('sreen');
                                  });
                                },
                                leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        "${data![i].largeImageURL}")),
                                title: Text("${data![i].tags}"),
                              ),
                            );
                          },
                          itemCount: data!.length),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ));
  }
}

class sreen extends StatefulWidget {
  const sreen({Key? key}) : super(key: key);

  @override
  State<sreen> createState() => _sreenState();
}

class _sreenState extends State<sreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${data![number].tags}"),
        ),
        body: Center(
          child: Image.network("${data![number].largeImageURL}",
              fit: BoxFit.fitWidth),
        ));
  }
}
