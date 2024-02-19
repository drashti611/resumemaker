// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:resumemaker/allscreen/login_Screen.dart';
import 'package:resumemaker/utils/text.dart';
import 'package:get/get.dart';
import 'package:resumemaker/utils/widget/allwidgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(String option, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 237, 238, 239),
                Color.fromARGB(255, 46, 197, 220),
                Color.fromARGB(255, 72, 127, 231),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width / 1,
                child: Image.asset(
                  "assets/image/original-65622830ef5b442aa9922cb4cc442813.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    AllText().name,
                    style: TextStyle(
                        letterSpacing: 2,
                        // wordSpacing: 1,
                        color: Colors.black,
                        fontFamily: "Spectral",
                        fontSize: 36,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    AllText().wbestem,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Colors.black,
                        letterSpacing: 1),
                  ),
                  Text(
                    AllText().weltxt,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Spectral",
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Containers(
                        txt: AllText().sign,
                        colour: Colors.white,
                        ontap: () {
                          Get.to(LoginScreen_login(option: "signup"));
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      Containers(
                        txt: AllText().login,
                        colour: Colors.white,
                        ontap: () {
                          Get.to(LoginScreen_login(option: "login"));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
