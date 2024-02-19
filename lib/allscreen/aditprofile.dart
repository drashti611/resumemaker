// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../utils/text.dart';
import '../utils/widget/allwidgets.dart';
import '../utils/widget/textfieldwidget.dart';
import 'login_Screen.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  TextEditingController naaame = TextEditingController();
  TextEditingController emailll = TextEditingController();
  TextEditingController nummmber = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void updateStatus() {
    obj.isVisible.value = !obj.isVisible.value;
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  // void userData() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   await firebaseFirestore.collection("users").doc(uid).update({
  //     "userName": naaame.text,
  //     "email": emailll.text,
  //     "mobile": nummmber.text,
  //     "password": pass.text,
  //      "uid": FirebaseAuth.instance.currentUser!.uid
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "User Name",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Textffield(
                        validators: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"[a-zA-Z]+|\s").hasMatch(value)) {
                            return 'Enter new user name!';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z]+|\s"),
                          )
                        ],
                        hinttxt: AllText().name,
                        con: naaame,
                        inputtype: TextInputType.text),
                    sized4(),
                    sized4(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Textffield(
                        validators: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"[a-zA-Z]+|\s").hasMatch(value)) {
                            return 'Enter a phone number!';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z]+|\s"),
                          )
                        ],
                        hinttxt: AllText().phone,
                        con: nummmber,
                        inputtype: TextInputType.text),
                    sized4(),
                    sized4(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "E-mail",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Textffield(
                        inputFormatters: [],
                        validators: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                        hinttxt: AllText().emailsign,
                        con: emailll,
                        inputtype: TextInputType.emailAddress),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => PassWord_Textfield_widget(
                        txt: AllText().pass,
                        hinttxt: AllText().hintpass,
                        inputtype: TextInputType.visiblePassword,
                        conpass: pass,
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
                    sized4(),
                    sized4(),
                    sized4(),
                    sized4(),
                    Center(
                      child: Containers(
                        txt: "Update",
                        colour: Color.fromARGB(255, 78, 195, 241),
                        ontap: () {},
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )),
          ),
        ));
  }
}
