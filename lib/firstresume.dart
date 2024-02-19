// // ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, prefer_const_literals_to_create_immutables

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});
//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   void initState() {
//     pdf.addPage(pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Center(child: pw.Text("hey its created"));
//         }));
//     super.initState();
//   }

// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resumemaker/utils/text.dart';
import 'package:resumemaker/utils/widget/allwidgets.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  Future<List<Map<String, dynamic>>> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Basics').get();
    List<Map<String, dynamic>> data = querySnapshot.docs
        .map((DocumentSnapshot document) =>
            document.data() as Map<String, dynamic>)
        .toList();
    return data;
  }

  Future<Uint8List> generatePdf(
    List<Map<String, dynamic>> firestoreData,
  ) async {
    final pdf = pw.Document();
    final ByteData bytes =
        await rootBundle.load('assets/image/templatesimg/phon.png');
    final Uint8List byteList = bytes.buffer.asUint8List();
    final ByteData email =
        await rootBundle.load('assets/image/templatesimg/email.png');
    final Uint8List emaillist = email.buffer.asUint8List();
    final ByteData linkdinimge =
        await rootBundle.load('assets/image/templatesimg/link.png');
    final Uint8List bytelinkdin = linkdinimge.buffer.asUint8List();
    final ByteData githubimg = await rootBundle.load('assets/image/images.png');
    final Uint8List bytegit = githubimg.buffer.asUint8List();
    final ByteData twitterimg = await rootBundle.load('assets/image/twit.png');
    final Uint8List bytetwitt = twitterimg.buffer.asUint8List();
    final ByteData webimg = await rootBundle.load('assets/image/web.png');
    final Uint8List byteweb = webimg.buffer.asUint8List();
    // final imageByteData =
    //     await rootBundle.load('assets/image/templatesimg/phone.png');
    // // Convert ByteData to Uint8List
    // final imageUint8List = imageByteData.buffer
    //     .asUint8List(imageByteData.offsetInBytes, imageByteData.lengthInBytes);

    // final image = pw.MemoryImage(imageUint8List);
    // Add content to the PDF based on Firestore data
    for (var item in firestoreData) {
      pdf.addPage(pw.Page(
        build: (context) {
          return pw.Container(
              height: 720,
              width: 470,
              // color: PdfColors.amber,
              child: pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Row(children: [
                  pw.Container(
                    height: 720,
                    width: 270,
                    child: pw.Padding(
                      padding: pw.EdgeInsets.all(10),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 30),
                          pw.Center(
                            child: pw.Row(
                              children: [
                                pw.SizedBox(width: 50),
                                pw.Text(item['First Name'].toUpperCase() ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 20,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.black)),
                                pw.SizedBox(width: 5),
                                pw.Text(item['Last Name'].toUpperCase() ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 20,
                                        fontWeight: pw.FontWeight.bold,
                                        color: PdfColors.black)),
                              ],
                            ),
                          ),
                          pw.SizedBox(
                            height: 15,
                          ),
                          pw.Center(
                            child: pw.Text(item['Job Title'] ?? '',
                                style: pw.TextStyle(
                                    fontSize: 15,
                                    fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.black)),
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(
                              AllText().aboutme,
                              style: pw.TextStyle(
                                  letterSpacing: 1,
                                  color: PdfColors.black,
                                  wordSpacing: 1,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          pw.Divider(
                              endIndent: 2, indent: 10, color: PdfColors.black),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(item['About me'] ?? '',
                                style: pw.TextStyle(
                                    fontSize: 15, color: PdfColors.black)),
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(
                              AllText().contect,
                              style: pw.TextStyle(
                                  letterSpacing: 1,
                                  color: PdfColors.black,
                                  wordSpacing: 1,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          pw.Divider(
                              endIndent: 2, indent: 10, color: PdfColors.black),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 5),
                            child: pw.Row(
                              children: [
                                pw.Container(
                                  decoration: pw.BoxDecoration(
                                      color: PdfColors.white,
                                      borderRadius:
                                          pw.BorderRadius.circular(2)),
                                  child: pw.Image(pw.MemoryImage(byteList),
                                      fit: pw.BoxFit.fill,
                                      height: 20,
                                      width: 20),
                                ),
                                pw.SizedBox(
                                  width: 30,
                                ),
                                pw.Text(item['Number'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 5),
                            child: pw.Row(
                              children: [
                                pw.Container(
                                  decoration: pw.BoxDecoration(
                                      color: PdfColors.white,
                                      borderRadius:
                                          pw.BorderRadius.circular(2)),
                                  child: pw.Image(pw.MemoryImage(emaillist),
                                      fit: pw.BoxFit.fill,
                                      height: 20,
                                      width: 20),
                                ),
                                pw.SizedBox(
                                  width: 20,
                                ),
                                pw.Text(item['E-mail'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 5),
                            child: pw.Row(
                              children: [
                                pw.Container(
                                  decoration: pw.BoxDecoration(
                                      color: PdfColors.white,
                                      borderRadius:
                                          pw.BorderRadius.circular(2)),
                                  child: pw.Image(pw.MemoryImage(bytegit),
                                      fit: pw.BoxFit.fill,
                                      height: 20,
                                      width: 20),
                                ),
                                pw.SizedBox(
                                  width: 20,
                                ),
                                pw.Text(item['Github'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 5),
                            child: pw.Row(
                              children: [
                                pw.Container(
                                  decoration: pw.BoxDecoration(
                                      color: PdfColors.white,
                                      borderRadius:
                                          pw.BorderRadius.circular(2)),
                                  child: pw.Image(pw.MemoryImage(bytetwitt),
                                      fit: pw.BoxFit.fill,
                                      height: 20,
                                      width: 20),
                                ),
                                pw.SizedBox(
                                  width: 20,
                                ),
                                pw.Text(item['Twitter'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 5),
                            child: pw.Row(
                              children: [
                                pw.Container(
                                  decoration: pw.BoxDecoration(
                                      color: PdfColors.white,
                                      borderRadius:
                                          pw.BorderRadius.circular(2)),
                                  child: pw.Image(pw.MemoryImage(bytelinkdin),
                                      fit: pw.BoxFit.fill,
                                      height: 20,
                                      width: 20),
                                ),
                                pw.SizedBox(
                                  width: 20,
                                ),
                                pw.Text(item['Linkedin'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(10),
                            child: pw.Row(
                              children: [
                                pw.Container(
                                  decoration: pw.BoxDecoration(
                                      color: PdfColors.white,
                                      borderRadius:
                                          pw.BorderRadius.circular(2)),
                                  child: pw.Image(pw.MemoryImage(byteweb),
                                      fit: pw.BoxFit.fill,
                                      height: 20,
                                      width: 20),
                                ),
                                pw.SizedBox(
                                  width: 20,
                                ),
                                pw.Text(item['Website'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(
                              AllText().skil,
                              style: pw.TextStyle(
                                  letterSpacing: 1,
                                  color: PdfColors.black,
                                  wordSpacing: 1,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          pw.Divider(
                              endIndent: 2, indent: 10, color: PdfColors.black),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                            ),
                            child: pw.Text(item['Skil1'] ?? '',
                                style: pw.TextStyle(
                                    fontSize: 15, color: PdfColors.black)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                            ),
                            child: pw.Text(item['Skil2'] ?? '',
                                style: pw.TextStyle(
                                    fontSize: 15, color: PdfColors.black)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                            ),
                            child: pw.Text(item['Skil3'] ?? '',
                                style: pw.TextStyle(
                                    fontSize: 15, color: PdfColors.black)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                            ),
                            child: pw.Text(item['Skil4'] ?? '',
                                style: pw.TextStyle(
                                    fontSize: 15, color: PdfColors.black)),
                          )
                        ],
                      ),
                    ),
                  ),
                  pw.Align(
                    alignment: pw.Alignment.topRight,
                    child: pw.Row(children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.all(20),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(
                                AllText().lang,
                                style: pw.TextStyle(
                                    // letterSpacing: 1,
                                    color: PdfColors.black,
                                    // wordSpacing: 1,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Lang1'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Lang2'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Lang3'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Lang4'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(
                                AllText().workexp,
                                style: pw.TextStyle(
                                    color: PdfColors.black,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Job Title'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Row(children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: pw.Text(item['Compnay Name'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ),
                              pw.Text(","),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: pw.Text(item['Loaction'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ),
                            ]),
                            pw.Row(children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: pw.Text(item['StartDate'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ),
                              pw.Text(","),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: pw.Text(item['EndDate'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ),
                            ]),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Description'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(
                                AllText().proje,
                                style: pw.TextStyle(
                                    color: PdfColors.black,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Project Title'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Row(children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: pw.Text(item['InstituteCompany'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ),
                              pw.Text(","),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: pw.Text(item['Location'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ),
                            ]),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Description'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(
                                AllText().certi,
                                style: pw.TextStyle(
                                    color: PdfColors.black,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Course Name'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Organisation'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Row(children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: pw.Text(item['StartDate'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ),
                              pw.Text(","),
                              pw.Padding(
                                padding: const pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: pw.Text(item['EndDate'] ?? '',
                                    style: pw.TextStyle(
                                        fontSize: 15, color: PdfColors.black)),
                              ),
                            ]),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(
                                "Achiverments",
                                style: pw.TextStyle(
                                    color: PdfColors.black,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Schoolclg Name'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Studying Filed'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: pw.Text(item['Loaction'] ?? '',
                                  style: pw.TextStyle(
                                      fontSize: 15, color: PdfColors.black)),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )
                ]),
              ));
        },
      ));

      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save());
      final output = await getTemporaryDirectory();
      final file = File('${output.path}/example1.pdf');
      await file.writeAsBytes(await pdf.save());
      log("$file");
    }

    return pdf.save();
  }

  Future<void> savePdf(Uint8List pdfBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_pdf.pdf');
    await file.writeAsBytes(pdfBytes);
  }
// Trigger PDF generation and saving

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 150,
              width: 340,
              child: Card(
                color: const Color.fromARGB(255, 175, 209, 236),
                child: Column(
                  children: [
                    sized4(),
                    sized4(),
                    sized4(),
                    sized4(),
                    Text(
                      "You can see the pdf of your resume",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    sized4(),
                    sized4(),
                    ElevatedButton(
                        onPressed: () async {
                          List<Map<String, dynamic>> firestoreData =
                              await fetchData();

                          Uint8List pdfBytes = await generatePdf(firestoreData);
                          await savePdf(pdfBytes);
                          // generatePdf(firestoreData);
                        },
                        child: Text("Display PDF")),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
