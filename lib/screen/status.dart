import 'package:demo/global.dart';
import 'package:flutter/material.dart';

class status_page extends StatefulWidget {
  const status_page({Key? key}) : super(key: key);

  @override
  State<status_page> createState() => _status_pageState();
}

class _status_pageState extends State<status_page> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, i) => Column(
              children: [
                SizedBox(height: 7),
                Divider(thickness: 3, color: Colors.grey)
              ],
            ),
        itemCount: global.chats.length,
        itemBuilder: (context, i) => ListTile(
              leading: FlutterLogo(size: 50),
              title: Text(
                " ${global.chats[i]}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                "5 PM",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ));
  }
}
