// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumemaker/allscreen/home_screen.dart';
import 'package:resumemaker/allscreen/templates/firsttemplates_screen.dart';
import 'package:resumemaker/allscreen/templates/secoundtemplate_screen.dart';
import 'package:resumemaker/allscreen/templates/thirdtemplate_Screen.dart';
import 'package:resumemaker/utils/widget/allwidgets.dart';

class Templates_Screen extends StatefulWidget {
  const Templates_Screen({
    super.key,
  });

  @override
  State<Templates_Screen> createState() => _Templates_ScreenState();
}

class _Templates_ScreenState extends State<Templates_Screen> {
  bool isselectred = false;
  List datalistadd = [];

  List img = [
    "assets/image/templatesimg/thirdtemp.jpg",
    "assets/image/templatesimg/firsttemp.jpg",
    "assets/image/templatesimg/sectemp.jpg",
  ];
  List name = ["Free", "Premium", "Premium", "Premium"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(
                HomeScreen_Templates(),
              );
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 78, 195, 241),
        title: Text("Choose a template"),
      ),
      body: PageView.builder(
          itemCount: img.length,
          allowImplicitScrolling: true,
          scrollBehavior: MaterialScrollBehavior(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sized4(),
                InkWell(
                  onTap: () {
                    setState(() {
                      isselectred = true;
                    });
                    if (index == 0) {
                      Get.to(Third_templatescreen());
                    } else if (index == 1) {
                      Get.to(AllTemplates_screen());
                    } else {
                      Get.to(Secound_Template());
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      Container(
                          height: MediaQuery.of(context).size.height / 1.5,
                          width: double.infinity,
                          child: Image.asset(
                            img[index],
                            fit: BoxFit.fill,
                          )),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
