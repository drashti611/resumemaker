// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumemaker/allscreen/templates/firsttemplates_screen.dart';
import 'package:resumemaker/allscreen/templates/secoundtemplate_screen.dart';
import 'package:resumemaker/allscreen/templates/thirdtemplate_Screen.dart';

class Download_screen extends StatefulWidget {
  const Download_screen({super.key});

  @override
  State<Download_screen> createState() => _Download_screenState();
}

class _Download_screenState extends State<Download_screen> {
  List img = [
    "assets/image/templatesimg/thirdtemp.jpg",
    "assets/image/templatesimg/firsttemp.jpg",
    "assets/image/templatesimg/sectemp.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 78, 195, 241),
        title: Text(
          "Select a template which you want \nto download",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        if (index == 1) {
                          Get.to(AllTemplates_screen());
                        } else if (index == 2) {
                          Get.to(Secound_Template());
                        } else {
                          Get.to(Third_templatescreen());
                        }
                      },
                      child: Image.asset(img[index]));
                }),
          )
        ],
      ),
    );
  }
}
