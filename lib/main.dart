import 'package:flutter/material.dart';
import 'package:vivve_2/add_detai.dart';
import 'package:vivve_2/global.dart';
import 'package:vivve_2/pdf_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => home(),
        'add_student': (context) => add_student(),
        'pdf_page': (context) => pdf_page(),
      },
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("You Exit"),
                  content: Text("walcome back"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pop(true);
                          });
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(fontSize: 20),
                        )),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pop(false);
                          });
                        },
                        child: Text(
                          "No",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                )),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Marksheet"),
            centerTitle: true,
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed('add_student');
              });
            },
            child: Icon(Icons.add),
          ),
          body: (global.all_students.isEmpty)
              ? Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "add student",
                        style: TextStyle(fontSize: 50, color: Colors.grey),
                      ),
                    ],
                  ))
              : Scrollbar(
                  child: ListView.separated(
                      separatorBuilder: (context, i) => SizedBox(height: 10),
                      padding: EdgeInsets.all(20),
                      itemCount: global.all_students.length,
                      itemBuilder: (context, i) => InkWell(
                            onTap: () {
                              setState(() {
                                global.page = i;
                                Navigator.of(context)
                                    .pushNamed('pdf_page', arguments: i);
                              });
                            },
                            child: Container(
                              height: 150,
                              color: Colors.blue,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    overflow: TextOverflow.fade,
                                    " name: ${global.all_students[i].name} "
                                    "\n\n\n      Click In To You Marksheet ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ))),
        ));
  }
}
