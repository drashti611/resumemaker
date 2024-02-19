// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resumemaker/allscreen/templates/firsttemplates_screen.dart';
import 'package:resumemaker/allscreen/templates/secoundtemplate_screen.dart';
import 'package:resumemaker/allscreen/templates/thirdtemplate_Screen.dart';
import 'package:resumemaker/utils/widget/allwidgets.dart';

import 'adddata_screen.dart';
import 'download.dart';
import 'option_Screen.dart';

class HomeScreen_Templates extends StatefulWidget {
  const HomeScreen_Templates({
    super.key,
  });

  @override
  State<HomeScreen_Templates> createState() => _HomeScreen_TemplatesState();
}

class _HomeScreen_TemplatesState extends State<HomeScreen_Templates> {
  bool isclicked = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future getData() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("demo").get();
    return qn.docs;
  }

  List img = [
    "assets/image/templatesimg/thirdtemp.jpg",
    "assets/image/templatesimg/firsttemp.jpg",
    "assets/image/templatesimg/sectemp.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection("users").get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<DocumentSnapshot>? documents = snapshot.data?.docs;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      sized4(),
                      sized4(),
                      sized4(),
                      sized4(),
                      sized4(),
                      Center(
                        child: Text(
                          "About your self",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      sized4(),
                      sized4(),
                      sized4(),
                      sized4(),
                      sized4(),
                      Row(
                        children: [
                          Text(
                            "Username: ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            documents?.first["userName"],
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            "E-mail: ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          Text(documents?.first["email"],
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black)),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      sized4(),
                      Row(
                        children: [
                          Text(
                            "PhoneNumber: ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          Text(documents?.first["phonenumber"],
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black)),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            "Password: ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          Text(documents?.first["password"],
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black)),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(height: 400),
                      TextButton(
                          onPressed: () async {
                            try {
                              await _auth.signOut();
                              Get.to(LoginScreen('signin'));
                            } catch (e) {
                              log('$e');
                            }
                          },
                          child: Row(
                            children: [
                              Icon(Icons.exit_to_app),
                              Text("LogOut"),
                            ],
                          ))
                    ],
                  );
                }
                return Container();
              }),
        ),
      ),
      appBar: AppBar(
        title: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection("Basics").get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<DocumentSnapshot>? documents = snapshot.data?.docs;
                return Row(
                  children: [
                    Text("Hey. "),
                    Text(
                      documents?.first["First Name"].toUpperCase(),
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                );
              }
              return Container();
            }),
        backgroundColor: Color.fromARGB(255, 78, 195, 241),
      ),
      backgroundColor: Color.fromARGB(255, 215, 240, 250),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Resume Template",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: img.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 300,
                                width: 200,
                                child: InkWell(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(Third_templatescreen());
                                    } else if (index == 1) {
                                      Get.to(AllTemplates_screen());
                                    } else {
                                      Get.to(Secound_Template());
                                    }
                                  },
                                  child: Image.asset(
                                    img[index],
                                    fit: BoxFit.fill,
                                  ),
                                )),
                          )
                        ],
                      );
                    }),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 23,
            ),
            isclicked == false
                ? Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.1,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Card(
                        elevation: 10.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sized4(),
                            sized4(),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: FutureBuilder<QuerySnapshot>(
                                  future: FirebaseFirestore.instance
                                      .collection("Basics")
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final List<DocumentSnapshot>? documents =
                                          snapshot.data?.docs;
                                      return Row(
                                        children: [
                                          Text(
                                            documents?.first["First Name"]
                                                .toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            documents?.first["Last Name"]
                                                .toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ],
                                      );
                                    }
                                    return Container();
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Your created resume is here....",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "You can show update and edit your resume par you requirements",
                                textAlign: TextAlign.start,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10),
                              child: dv(colors: Colors.black),
                            ),
                            Center(
                              child: Card(
                                child: Container(
                                  height: 110,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            sized4(),
                                            IconButton(
                                                onPressed: () {
                                                  Get.to(HomeScreen());
                                                },
                                                icon: Icon(Icons.edit)),
                                            Text("Edit Resume")
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            sized4(),
                                            IconButton(
                                                onPressed: () {
                                                  Get.to(Download_screen());
                                                },
                                                icon: Icon(Icons.download)),
                                            Text("Download")
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            sized4(),
                                            IconButton(
                                                onPressed: () {
                                                  Get.snackbar("Delete",
                                                      "Delete all the data which you enterd..");
                                                  setState(() {
                                                    isclicked = true;
                                                  });
                                                },
                                                icon: Icon(Icons.delete)),
                                            Text("Delete")
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(HomeScreen());
                        },
                        child:
                            Text("Fill all the information about your resume")),
                  )
          ],
        ),
      ),
    );
  }
}
