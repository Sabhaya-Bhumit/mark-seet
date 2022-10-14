import 'package:demo/global.dart';
import 'package:flutter/material.dart';

class calls_page extends StatefulWidget {
  const calls_page({Key? key}) : super(key: key);

  @override
  State<calls_page> createState() => _calls_pageState();
}

class _calls_pageState extends State<calls_page> {
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
            trailing: (i % 2 == 0)
                ? Icon(
                    Icons.call,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.video_call,
                    color: Colors.white,
                  )));
  }
}
