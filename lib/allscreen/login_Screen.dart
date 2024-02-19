// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, file_names, non_constant_identifier_names, body_might_complete_normally_nullable, unused_local_variable, unused_catch_clause

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resumemaker/allscreen/home_screen.dart';
import 'package:resumemaker/controller/loginscreen_controller.dart';
import 'package:resumemaker/allscreen/option_Screen.dart';
import 'package:resumemaker/utils/app_prefrence/prefrencekey.dart';
import 'package:resumemaker/utils/text.dart';
import 'package:resumemaker/utils/widget/textfieldwidget.dart';
import 'adddata_screen.dart';
import '../utils/widget/allwidgets.dart';

class LoginScreen_login extends StatefulWidget {
  final String option;
  const LoginScreen_login({super.key, required this.option});

  @override
  State<LoginScreen_login> createState() => _LoginScreen_loginState();
}

final obj = Get.put(Loginscreencontroller());
void updateStatus() {
  obj.isVisible.value = !obj.isVisible.value;
  obj.isVisiblee.value = !obj.isVisiblee.value;
}

class _LoginScreen_loginState extends State<LoginScreen_login> {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passcon = TextEditingController();
  TextEditingController uname = TextEditingController();
  TextEditingController emailaddcon = TextEditingController();
  TextEditingController phonenumcon = TextEditingController();
  TextEditingController passwordcon = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _signUpWithEmailAndPassword() async {
    try {
      final String email = emailaddcon.text.trim();
      final String password = passwordcon.text.trim();

      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;
      if (userCredential.user != null) {
        try {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
            "email": emailaddcon.text,
            "userName": uname.text,
            "password": passwordcon.text,
            "phonenumber": phonenumcon.text,
            "uid": FirebaseAuth.instance.currentUser!.uid
          });
          await PreferencesKey.instance.setBool(PreferencesKey.isLogin, true);
          await PreferencesKey.instance
              .setString(PreferencesKey.isuid, userCredential.user!.uid);
          await PreferencesKey.instance
              .setString(PreferencesKey.isEmail, emailaddcon.text);
          await PreferencesKey.instance
              .setString(PreferencesKey.ispass, passwordcon.text);
          await PreferencesKey.instance
              .setString(PreferencesKey.isnumber, phonenumcon.text);
          await PreferencesKey.instance
              .setString(PreferencesKey.isuname, uname.text);
        } catch (e) {
          log('$e');
        }
        // AppPrefrence().setIsLogin(user.emailVerified);
        // Successfully signed up
        log('Signed up: ${user!.email}');
        Get.to(HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'Weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.blue,
            content: Text("Password provided is too Weak",
                style: TextStyle(fontSize: 18))));
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              "Account Already exists",
              style: TextStyle(fontSize: 18, color: Colors.black),
            )));
      }
    }
  }

  String email = "", password = "";
  Future<UserCredential?> userSignin() async {
    try {
      final UserCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (UserCredential.user != null) {
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        DocumentSnapshot data = await firebaseFirestore
            .collection("users")
            .doc(UserCredential.user!.uid)
            .get();
        await PreferencesKey.instance.setBool(PreferencesKey.isLogin, true);
        await PreferencesKey.instance
            .setString(PreferencesKey.isEmail, emailcon.text);
        await PreferencesKey.instance
            .setString(PreferencesKey.isuid, UserCredential.user!.uid);
        await PreferencesKey.instance
            .setString(PreferencesKey.isnumber, data['mobile']);
        await PreferencesKey.instance
            .setString(PreferencesKey.isuname, data['userName']);
      }

      return UserCredential;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  var isLoading = false;
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.option == "signup"
          ? SingleChildScrollView(
              child: Container(
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          "assets/image/userlog-removebg-preview.png",
                          height: 200,
                        ),
                        TItles_And_Subtitle(
                            titles: AllText().subtitle,
                            subtitles: AllText().subsubtitle),
                        TextFormField_widgte(
                          txt: AllText().fname,
                          hinttxt: AllText().hintfname,
                          con: uname,
                          inputtype: TextInputType.name,
                          validators: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"[a-zA-Z]+|\s").hasMatch(value)) {
                              return 'Enter a valid Last Name!';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"),
                            )
                          ],
                        ),
                        TextFormField_widgte(
                          txt: AllText().emailsign,
                          hinttxt: AllText().hintemail,
                          con: emailaddcon,
                          inputtype: TextInputType.emailAddress,
                          inputFormatters: [],
                          validators: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                        TextFormField_widgte(
                          txt: AllText().phone,
                          hinttxt: AllText().hintphone,
                          con: phonenumcon,
                          inputtype: TextInputType.number,
                          validators: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"[0-9]").hasMatch(value)) {
                              return 'Enter a valid Phone Number!';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r"[0-9]"),
                            )
                          ],
                        ),
                        Obx(
                          () => PassWord_Textfield_widget(
                            txt: AllText().pass,
                            hinttxt: AllText().hintpass,
                            inputtype: TextInputType.visiblePassword,
                            conpass: passwordcon,
                            obscureText: obj.isVisiblee.value ? true : false,
                            btn: updateStatus,
                            icons: obj.isVisiblee.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            inputFormatters: [],
                            validators: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid password!';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Containers_widget(
                            txt: AllText().sign,
                            colour: Colors.white,
                            ontap: () {
                              if (_formKey.currentState!.validate()) {
                                _submit();
                                _signUpWithEmailAndPassword();
                              }
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AllText().haveacc,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(LoginScreen("login"));
                                },
                                child: Text(
                                  AllText().login,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
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
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                                "assets/image/Bussiness_Teamwork_Illustration-removebg-preview.png"),
                            TItles_And_Subtitle(
                              subtitles: AllText().logsub,
                              titles: AllText().logtitle,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 40,
                            ),
                            TextFormField_widgte(
                              con: emailcon,
                              hinttxt: 'enter email',
                              inputtype: TextInputType.emailAddress,
                              txt: 'Enter a email',
                              validators: (value) {
                                return null;
                              },
                              inputFormatters: [],
                            ),
                            Obx(
                              () => PassWord_Textfield_widget(
                                txt: AllText().pass,
                                hinttxt: AllText().hintpass,
                                inputtype: TextInputType.visiblePassword,
                                conpass: passwordcon,
                                obscureText: obj.isVisible.value ? true : false,
                                btn: updateStatus,
                                icons: obj.isVisible.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                inputFormatters: [],
                                validators: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a valid password!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Containers(
                                  txt: AllText().login,
                                  colour: Colors.white,
                                  ontap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _submit();
                                      userSignin();

                                      Get.to(HomeScreen_Templates());
                                    }
                                  }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AllText().dontacc,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.to(LoginScreen("signup"));
                                    },
                                    child: Text(
                                      AllText().sign,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
