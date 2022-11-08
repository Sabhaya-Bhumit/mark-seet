import 'package:flutter/material.dart';
import 'package:vivve_2/global.dart';
import 'package:vivve_2/student_detail.dart';

class add_student extends StatefulWidget {
  const add_student({Key? key}) : super(key: key);

  @override
  State<add_student> createState() => _add_studentState();
}

final TextEditingController student_name = TextEditingController();
final TextEditingController subject1 = TextEditingController();
final TextEditingController subject2 = TextEditingController();
final TextEditingController subject3 = TextEditingController();
final TextEditingController subject4 = TextEditingController();
final TextEditingController subject5 = TextEditingController();

final GlobalKey<FormState> controller = GlobalKey<FormState>();

class _add_studentState extends State<add_student> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    student_name.clear();
    subject1.clear();
    subject2.clear();
    subject3.clear();
    subject4.clear();
    subject5.clear();
    total_page = 0;

    percentage = 0;
    grading = "";
    global.mark2.add(global.mark);
    global.subject_add.add(global.mark);
  }

  double total_page = 0;
  int pp = 0;
  double percentage = 0;
  int uu = 0;
  String grading = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Achieved Marks"),
        centerTitle: true,
      ),
      body: Scrollbar(
        thickness: 10,
        interactive: true,
        trackVisibility: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Enter You Student Name"),
                  TextFormField(
                    controller: student_name,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter you Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Enter You English Mark"),
                  TextFormField(
                    controller: subject1,
                    maxLength: 4,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: (val) {
                      if (double.parse(val!) >= 100) {
                        return "You Mark Is Invalid";
                      }
                      if (val!.isEmpty) {
                        return "Enter you English Mark";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Enter You Maths Mark"),
                  TextFormField(
                    controller: subject2,
                    maxLength: 4,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: (val) {
                      if (double.parse(val!) >= 100) {
                        return "You Mark Is Invalid";
                      }
                      if (val!.isEmpty) {
                        return "Enter you Maths Mark";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Enter You History Mark"),
                  TextFormField(
                    controller: subject3,
                    maxLength: 4,

                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter you History Mark";
                      }
                      if (double.parse(val!) >= 100) {
                        return "You Mark Is Invalid";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Enter You Biology Mark"),
                  TextFormField(
                    controller: subject4,
                    maxLength: 4,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter you Biology Mark";
                      }
                      if (double.parse(val!) >= 100) {
                        return "You Mark Is Invalid";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Enter You Science Mark"),
                  TextFormField(
                    controller: subject5,
                    maxLength: 4,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter you Science Mark";
                      }
                      if (double.parse(val!) >= 100) {
                        return "You Mark Is Invalid";
                      }
                      return null;
                    },
                  ),
                  ...global.subject_add[global.like]
                      .map((e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Enter You Subject Name"),
                              TextFormField(
                                controller: e,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter You Subject Name";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      global.subject_add[global.like].remove(e);
                                    });
                                  },
                                  icon: Icon(Icons.delete)),
                              SizedBox(height: 10),
                            ],
                          ))
                      .toList(),
                  ...global.mark2[global.like]
                      .map((e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Enter You Subject Mark"),
                              TextFormField(
                                controller: e,
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter You Subject Mark";
                                  }
                                  if (double.parse(val!) >= 100) {
                                    return "You Mark Is Invalid";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      global.mark2[global.like].remove(e);
                                    });
                                  },
                                  icon: Icon(Icons.delete)),
                              SizedBox(height: 10),
                            ],
                          ))
                      .toList(),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 200,
                        child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                global.mark2[global.like]
                                    .add(TextEditingController());
                                global.subject_add[global.like]
                                    .add(TextEditingController());
                              });
                            },
                            child: Text("ADD IS SUBJECT"))),
                  ),
                  Align(
                    child: SizedBox(
                        width: 100,
                        child: ElevatedButton(
                            child: Text("Save"),
                            onPressed: () {
                              pp = 0;
                              uu = 0;
                              if (controller.currentState!.validate()) {
                                if (global.subject_add[global.like].length ==
                                    global.mark2[global.like].length) {
                                  global.mark2[global.like]
                                      .map((e) => setState(() {
                                            pp = pp + int.parse(e.text);
                                          }))
                                      .toList();
                                  total_page = double.parse(subject1.text) +
                                      double.parse(subject2.text) +
                                      double.parse(subject3.text) +
                                      double.parse(subject4.text) +
                                      double.parse(subject5.text) +
                                      pp;
                                  uu = 500 +
                                      (global.mark2[global.like].length * 100);
                                  print(uu);
                                  percentage = total_page * 100 / uu;
                                  if (percentage >= 81) {
                                    grading = " A+";
                                  } else if (percentage >= 71) {
                                    grading = "A";
                                  } else if (percentage >= 61) {
                                    grading = "B+";
                                  } else if (percentage >= 51) {
                                    grading = "B";
                                  } else if (percentage >= 50) {
                                    grading = "C";
                                  } else {
                                    grading = "D";
                                  }

                                  Student student = Student(
                                    name: student_name.text,
                                    sub1: subject1.text,
                                    sub2: subject2.text,
                                    sub3: subject3.text,
                                    sub4: subject4.text,
                                    sub5: subject5.text,
                                    total: total_page,
                                    percentage: percentage,
                                    total_mark: uu,
                                    grad: grading,
                                    add_subject: global.mark2[global.like],
                                    add_sub_name:
                                        global.subject_add[global.like],
                                  );
                                  global.all_students.add(student);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("You Data Is Save  "),
                                    backgroundColor: Colors.green,
                                  ));
                                  global.like++;

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/', (route) => false);
                                }
                              }
                            })),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
