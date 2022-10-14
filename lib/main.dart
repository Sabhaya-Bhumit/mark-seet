import 'package:demo/global.dart';
import 'package:demo/screen/call.dart';
import 'package:demo/screen/chats.dart';
import 'package:demo/screen/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(home());
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

int initvalue = 0;
bool ios = false;
late TabController tabController;
final PageController pageController = PageController();

class _homeState extends State<home> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        initvalue = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (ios == true)
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  // leading: Builder(
                  //   builder: (context) {
                  //     return GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             drawer();
                  //           });
                  //         },
                  //         child: Icon(Icons.list));
                  //   },
                  // ),
                  middle: Text("WhatsApp"),
                  trailing: CupertinoSwitch(
                      value: ios,
                      onChanged: (val) {
                        setState(() {
                          ios = val;
                        });
                      }),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      IndexedStack(
                        index: initvalue,
                        children: [
                          Column(
                            children: global.chats
                                .map((e) => Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 10),
                                            FlutterLogo(size: 50),
                                            SizedBox(width: 50),
                                            Text(
                                              "$e",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              "6 AM",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(width: 20),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Divider(thickness: 5, color: Colors.red)
                                      ],
                                    ))
                                .toList(),
                          ),
                          Column(
                            children: global.chats
                                .map((e) => Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 10),
                                            FlutterLogo(size: 50),
                                            SizedBox(width: 50),
                                            Text(
                                              "$e\n 6 AM",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Divider(thickness: 5, color: Colors.red)
                                      ],
                                    ))
                                .toList(),
                          ),
                          Column(
                            children: global.chats
                                .map((e) => Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 10),
                                            FlutterLogo(size: 50),
                                            SizedBox(width: 50),
                                            Text(
                                              "$e",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Icon(
                                              CupertinoIcons.video_camera,
                                              size: 50,
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Divider(thickness: 5, color: Colors.red)
                                      ],
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                      Spacer(),
                      CupertinoTabBar(
                          currentIndex: initvalue,
                          onTap: (val) {
                            setState(() {
                              initvalue = val;
                            });
                          },
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(CupertinoIcons.chat_bubble_2),
                                label: "chars"),
                            BottomNavigationBarItem(
                                icon: Icon(CupertinoIcons.house),
                                label: "Status"),
                            BottomNavigationBarItem(
                                icon: Icon(CupertinoIcons.phone),
                                label: "Calla"),
                          ])
                    ],
                  ),
                )),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Color(0xff085b53),
                title: Text("WhatsApp"),
                actions: [
                  Icon(Icons.search),
                  PopupMenuButton(itemBuilder: (context) => []),
                  Switch(
                      value: ios,
                      onChanged: (val) {
                        setState(() {
                          ios = val;
                        });
                      })
                ],
                bottom: TabBar(
                    onTap: (val) {
                      setState(() {
                        pageController.animateToPage(val,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceOut);
                      });
                    },
                    tabs: [
                      Tab(text: "Chats"),
                      Tab(text: "Status"),
                      Tab(text: "Calls"),
                    ],
                    controller: tabController),
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: (initvalue == 0)
                      ? Icon(Icons.add)
                      : (initvalue == 1)
                          ? Icon(Icons.camera)
                          : Icon(Icons.call)),
              body: PageView(
                onPageChanged: (val) {
                  tabController.animateTo(val);
                },
                physics: BouncingScrollPhysics(),
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: [chars_page(), status_page(), calls_page()],
              ),
            ),
          );
  }
}
