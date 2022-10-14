import 'package:demo/global.dart';
import 'package:flutter/material.dart';

class chars_page extends StatefulWidget {
  const chars_page({Key? key}) : super(key: key);

  @override
  State<chars_page> createState() => _chars_pageState();
}

class _chars_pageState extends State<chars_page> {
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
                "  ${global.chats[i]}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              trailing: Text(
                "5 PM",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ));
  }
}
