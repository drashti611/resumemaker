// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resumemaker/allscreen/home_screen.dart';

import '../../secresume.dart';
import '../../utils/image.dart';
import '../../utils/text.dart';
import '../../utils/widget/allwidgets.dart';
import '../../utils/widget/textwidgets.dart';

class Secound_Template extends StatefulWidget {
  const Secound_Template({
    super.key,
  });

  @override
  State<Secound_Template> createState() => _Secound_TemplateState();
}

class _Secound_TemplateState extends State<Secound_Template> {
  File? image;
  Future<void> pickimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        this.image = imagetemp;
      });
    } on PlatformException catch (e) {
      debugPrint("Failed to load image:$e");
    }
  }

  final firestore = FirebaseFirestore.instance;
  get data => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Get.to(HomeScreen_Templates());
              },
            ),
            backgroundColor: Color.fromARGB(255, 78, 195, 241),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(Sec_Pdf());
                    },
                    child: Text(
                      "Getnrate PDF",
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          ),
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 188, 186, 186),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 2.2,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 58, 76, 84),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Center(
                                //   child: InkWell(
                                //     onTap: () {
                                //       pickimage();
                                //     },
                                //     child: CircleAvatar(
                                //       child: Icon(Icons.add),
                                //       radius: 40,
                                //     ),
                                //   ),
                                // ),
                                // Center(
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     child: Image.asset(
                                //       "assets/image/mm.jpeg",
                                //       fit: BoxFit.fill,
                                //     ),
                                //   ),
                                // ),
                                sized4(),
                                FutureBuilder<QuerySnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection("Basics")
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final List<DocumentSnapshot>?
                                            documents = snapshot.data?.docs;
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  documents?.first["First Name"]
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(width: 3),
                                                Text(
                                                    documents
                                                        ?.first["Last Name"]
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                            Text(documents?.first["Job Type"],
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                          ],
                                        );
                                      }
                                      return Container();
                                    }),
                                sized4(),
                                textwidget(
                                  txt: AllText().aboutme,
                                  colors: Colors.white,
                                ),
                                dv(
                                  colors: Colors.white,
                                ),
                                FutureBuilder<QuerySnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection("Basics")
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final List<DocumentSnapshot>?
                                            documents = snapshot.data?.docs;
                                        return Column(children: [
                                          Text(documents?.first["About me"],
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white)),
                                        ]);
                                      }
                                      return Container();
                                    }),
                                sized4(),
                                textwidget(
                                  txt: AllText().contect,
                                  colors: Colors.white,
                                ),
                                dv(
                                  colors: Colors.white,
                                ),
                                sized4(),
                                FutureBuilder<QuerySnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection("Basics")
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final List<DocumentSnapshot>?
                                            documents = snapshot.data?.docs;
                                        return Column(children: [
                                          contact(
                                            icon: Icon(
                                              Icons.phone,
                                              size: 15,
                                            ),
                                            txt: documents?.first["Number"],
                                            colors: Colors.white,
                                          ),
                                          sized4(),
                                          contact(
                                            icon: Icon(
                                              Icons.mail,
                                              size: 15,
                                            ),
                                            txt: documents?.first["E-mail"],
                                            colors: Colors.white,
                                          ),
                                        ]);
                                      }
                                      return Container();
                                    }),
                                FutureBuilder<QuerySnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection("Basics")
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final List<DocumentSnapshot>?
                                            documents = snapshot.data?.docs;
                                        return Column(children: [
                                          sized4(),
                                          contact(
                                            icon: Image.asset(
                                              AllImage().gitimg,
                                              height: 15,
                                              fit: BoxFit.fill,
                                            ),
                                            txt: documents?.first["Github"],
                                            colors: Colors.white,
                                          ),
                                          sized4(),
                                          contact(
                                            icon: Image.asset(
                                              AllImage().webimg,
                                              height: 15,
                                              fit: BoxFit.fill,
                                            ),
                                            txt: documents?.first["Website"],
                                            colors: Colors.white,
                                          ),
                                          sized4(),
                                          contact(
                                            icon: Image.asset(
                                              AllImage().linkdinimge,
                                              height: 15,
                                              fit: BoxFit.fill,
                                            ),
                                            txt: documents?.first["Linkedin"],
                                            colors: Colors.white,
                                          ),
                                          sized4(),
                                          contact(
                                            icon: Image.asset(
                                              AllImage().twit,
                                              height: 15,
                                              fit: BoxFit.fill,
                                            ),
                                            txt: documents?.first["Twitter"],
                                            colors: Colors.white,
                                          ),
                                        ]);
                                      }
                                      return Container();
                                    }),
                                sized4(),
                                sized4(),
                                textwidget(
                                  txt: AllText().skil,
                                  colors: Colors.white,
                                ),
                                dv(
                                  colors: Colors.white,
                                ),
                                FutureBuilder<QuerySnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection("Basics")
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final List<DocumentSnapshot>?
                                            documents = snapshot.data?.docs;
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              documents?.first["Skil1"],
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                            Text(documents?.first["Skil2"],
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                            Text(documents?.first["Skil3"],
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                            Text(documents?.first["Skil4"],
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                          ],
                                        );
                                      }
                                      return Container();
                                    }),
                                sized4(),
                                sized4(),
                                textwidget(
                                  txt: AllText().lang,
                                  colors: Colors.white,
                                ),
                                dv(
                                  colors: Colors.white,
                                ),
                                FutureBuilder<QuerySnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection("Basics")
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final List<DocumentSnapshot>?
                                            documents = snapshot.data?.docs;
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              documents?.first["Lang1"],
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                            Text(documents?.first["Lang2"],
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                            Text(documents?.first["Lang3"],
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                            Text(documents?.first["Lang4"],
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                          ],
                                        );
                                      }
                                      return Container();
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 2,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sized4(),
                                textwidget(
                                    txt: AllText().workexp,
                                    colors: Colors.black),
                                dv(
                                  colors: Colors.black,
                                ),
                                FutureBuilder<QuerySnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection("Basics")
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final List<DocumentSnapshot>?
                                            documents = snapshot.data?.docs;
                                        return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              sized4(),
                                              Text(
                                                  documents?.first["Job Title"],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                              Row(
                                                children: [
                                                  Text(
                                                      documents?.first[
                                                          "Compnay Name"],
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black)),
                                                  Text(","),
                                                  Text(
                                                      documents
                                                          ?.first["Loaction"],
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      documents
                                                          ?.first["StartDate"],
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.black)),
                                                  Text(","),
                                                  Text(
                                                      documents
                                                          ?.first["EndDate"],
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.black)),
                                                ],
                                              ),
                                              Text(
                                                  documents
                                                      ?.first["Description"],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                              sized4(),
                                            ]);
                                      }
                                      return Container();
                                    }),
                                FutureBuilder<QuerySnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection("Basics")
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final List<DocumentSnapshot>?
                                            documents = snapshot.data?.docs;
                                        return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              textwidget(
                                                  txt: AllText().proje,
                                                  colors: Colors.black),
                                              dv(
                                                colors: Colors.black,
                                              ),
                                              sized4(),
                                              Text(
                                                  documents
                                                      ?.first["Project Title"],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                              Row(
                                                children: [
                                                  Text(
                                                      documents?.first[
                                                          "InstituteCompany"],
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black)),
                                                  Text(","),
                                                  Text(
                                                      documents
                                                          ?.first["Location"],
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      documents
                                                          ?.first["StartDate"],
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.black)),
                                                  Text(","),
                                                  Text(
                                                      documents
                                                          ?.first["EndDate"],
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.black)),
                                                ],
                                              ),
                                              Text(
                                                  documents
                                                      ?.first["Description"],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                              sized4(),
                                            ]);
                                      }
                                      return CircularProgressIndicator();
                                    }),
                                textwidget(
                                    txt: AllText().certi, colors: Colors.black),
                                dv(
                                  colors: Colors.black,
                                ),
                                FutureBuilder<QuerySnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection("Basics")
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final List<DocumentSnapshot>?
                                            documents = snapshot.data?.docs;
                                        return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  documents
                                                      ?.first["Course Name"],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                              Text(
                                                  documents
                                                      ?.first["Organisation"],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                              Row(
                                                children: [
                                                  Text(
                                                      documents
                                                          ?.first["StartDate"],
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.black)),
                                                  Text(","),
                                                  Text(
                                                      documents
                                                          ?.first["EndDate"],
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.black)),
                                                ],
                                              ),
                                              sized4(),
                                            ]);
                                      }
                                      return CircularProgressIndicator();
                                    }),
                                textwidget(
                                  txt: "Achiverments",
                                  colors: Colors.black,
                                ),
                                dv(
                                  colors: Colors.black,
                                ),
                                FutureBuilder<QuerySnapshot>(
                                    future: FirebaseFirestore.instance
                                        .collection("Basics")
                                        .get(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final List<DocumentSnapshot>?
                                            documents = snapshot.data?.docs;
                                        return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  documents
                                                      ?.first["Schoolclg Name"],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                              Text(documents?.first["Loaction"],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 150,
                                                    child: Text(
                                                        documents?.first[
                                                            "Description"],
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            fontSize: 8,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                ],
                                              ),
                                              sized4(),
                                            ]);
                                      }
                                      return CircularProgressIndicator();
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
