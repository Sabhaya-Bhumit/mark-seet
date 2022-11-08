import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:vivve_2/global.dart';

class pdf_page extends StatefulWidget {
  const pdf_page({Key? key}) : super(key: key);

  @override
  State<pdf_page> createState() => _pdf_pageState();
}

final pdf = pw.Document();

List subject = ["English", "Maths", "History", "Biology", "Science"];
List mark = ["100", "100", "100", "100", "100"];

class _pdf_pageState extends State<pdf_page> {
  final pdf = pw.Document();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildandsavepdf();
    mark.clear();
    mark.add("100");
    mark.add("100");
    mark.add("100");
    mark.add("100");
    mark.add("100");
    for (int i = 0; i < global.mark2[global.page].length; i++) {
      mark.add("100");
    }
  }

  buildandsavepdf() async {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(height: 20),
            pw.Text("   Name : ${global.all_students[global.page].name}"),
            pw.SizedBox(height: 10),
            pw.Divider(thickness: 5),
            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Text("\n    Subject Name\n"),
                ),
                pw.Expanded(
                  child: pw.Text("\n  Subject Total Mark\n"),
                ),
                pw.Expanded(
                  child: pw.Text("\n     Subject Mark\n"),
                ),
              ],
            ),
            pw.Divider(thickness: 5),
            pw.SizedBox(height: 10),
            pw.Row(
              children: [
                pw.Expanded(
                    child: pw.Column(children: [
                  pw.Column(
                    children: subject.map((e) => pw.Text("${e}\n\n")).toList(),
                  ),
                  ...global.all_students[global.page].add_sub_name!
                      .map((e) => pw.Text("${e.text}\n\n"))
                ])),
                pw.Expanded(
                    child: pw.Column(
                  children: mark.map((e) => pw.Text("${e}\n\n")).toList(),
                )),
                pw.Expanded(
                    child: pw.Column(
                  children: [
                    pw.Text("${global.all_students[global.page].sub1}\n\n"),
                    pw.Text("${global.all_students[global.page].sub2}\n\n"),
                    pw.Text("${global.all_students[global.page].sub3}\n\n"),
                    pw.Text("${global.all_students[global.page].sub4}\n\n"),
                    pw.Text("${global.all_students[global.page].sub5}\n\n"),
                    ...global.all_students[global.page].add_subject!
                        .map((e) => pw.Text("${int.parse(e.text)}\n\n"))
                        .toList(),
                  ],
                )),
              ],
            ),
            pw.Divider(thickness: 5),
            pw.SizedBox(height: 10),
            pw.Row(
              children: [
                pw.Expanded(
                    flex: 4,
                    child: pw.Text(
                        " Achieved Marks = ${global.all_students[global.page].total}")),
                pw.Expanded(
                    flex: 3,
                    child: pw.Text(
                        "  percentage=${global.all_students[global.page].percentage}")),
                pw.Expanded(
                    flex: 3,
                    child: pw.Text(
                        "Total Mark=${global.all_students[global.page].total_mark}")),
              ],
            ),
            pw.Align(
              alignment: pw.Alignment.center,
              child:
                  pw.Text("\nGreat= ${global.all_students[global.page].grad}"),
            ),
            pw.SizedBox(height: 10),
            pw.Divider(thickness: 5),
          ],
        ),
      ),
    );
    Directory dir = await getTemporaryDirectory();

    File file =
        File("${dir.path}/resume${DateTime.now().microsecondsSinceEpoch}.pdf");
    print(file.path);
    file.writeAsBytes(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("${global.all_students[res].name} Marksheet"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  await Printing.layoutPdf(onLayout: (format) => pdf.save());
                } catch (e) {}
              },
              icon: Icon(Icons.print))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text("   Name : ${global.all_students[res].name}"),
            SizedBox(height: 10),
            Divider(thickness: 5, color: Colors.black),
            Row(
              children: [
                Expanded(
                  child: Text("\n    Subject Name\n"),
                ),
                Expanded(
                  child: Text("\n  Subject Total Mark\n"),
                ),
                Expanded(
                  child: Text("\n     Subject Mark\n"),
                ),
              ],
            ),
            Divider(thickness: 5, color: Colors.black),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Column(
                      children: subject.map((e) => Text("${e}\n\n")).toList(),
                    ),
                    ...global.all_students[res].add_sub_name!
                        .map((e) => Text("${e.text}\n\n"))
                  ],
                )),
                Expanded(
                    child: Column(
                  children: mark.map((e) => Text("${e}\n\n")).toList(),
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text("${global.all_students[res].sub1}\n\n"),
                    Text("${global.all_students[res].sub2}\n\n"),
                    Text("${global.all_students[res].sub3}\n\n"),
                    Text("${global.all_students[res].sub4}\n\n"),
                    Text("${global.all_students[res].sub5}\n\n"),
                    ...global.all_students[res].add_subject!
                        .map((e) => Text("${int.parse(e.text)}\n\n"))
                        .toList(),
                  ],
                )),
              ],
            ),
            Divider(thickness: 5, color: Colors.black),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Text(
                        " Achieved Marks = ${global.all_students[res].total}")),
                Expanded(
                    flex: 3,
                    child: Text(
                        "  percentage=${global.all_students[res].percentage}")),
                Expanded(
                    flex: 3,
                    child: Text(
                        "Total Mark=${global.all_students[res].total_mark}")),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text("\nGreat= ${global.all_students[res].grad}"),
            ),
            SizedBox(height: 10),
            Divider(thickness: 5, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
