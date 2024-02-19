// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, unused_field, equal_keys_in_map

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:resumemaker/allscreen/home_screen.dart';
import 'package:resumemaker/allscreen/templates_screen.dart';
import 'package:resumemaker/utils/text.dart';
import 'package:resumemaker/utils/widget/allwidgets.dart';
import 'package:resumemaker/utils/widget/textfieldwidget.dart';

import '../utils/app_prefrence/prefrencekey.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  List<Map> listofdata = [];

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  TextEditingController dateinput = TextEditingController();
  TextEditingController dateeinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();
  TextEditingController dateeinput1 = TextEditingController();
  TextEditingController scholname = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonenum = TextEditingController();
  TextEditingController sjobfun = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController yearexp = TextEditingController();
  TextEditingController jobtit = TextEditingController();
  TextEditingController deg = TextEditingController();
  TextEditingController loc = TextEditingController();
  TextEditingController fieldstud = TextEditingController();
  TextEditingController strtdate = TextEditingController();
  TextEditingController enddate = TextEditingController();
  TextEditingController strtdate1 = TextEditingController();
  TextEditingController enddate1 = TextEditingController();
  TextEditingController jtile = TextEditingController();
  TextEditingController cname = TextEditingController();
  TextEditingController hobbies = TextEditingController();
  TextEditingController archiv = TextEditingController();
  TextEditingController datebirth = TextEditingController();
  TextEditingController locc = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController des1 = TextEditingController();
  TextEditingController enskill = TextEditingController();
  TextEditingController pttile = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController insitute = TextEditingController();
  TextEditingController locationp = TextEditingController();
  TextEditingController startp = TextEditingController();
  TextEditingController endp = TextEditingController();
  TextEditingController desp = TextEditingController();
  TextEditingController desa = TextEditingController();
  TextEditingController coursename = TextEditingController();
  TextEditingController organisation = TextEditingController();
  TextEditingController stt = TextEditingController();
  TextEditingController edd = TextEditingController();
  TextEditingController lang = TextEditingController();
  TextEditingController linkedin = TextEditingController();
  TextEditingController github = TextEditingController();
  TextEditingController websit = TextEditingController();
  TextEditingController twitter = TextEditingController();
  TextEditingController skilss1 = TextEditingController();
  TextEditingController skilss2 = TextEditingController();
  TextEditingController skilss3 = TextEditingController();
  TextEditingController skilss4 = TextEditingController();
  TextEditingController lang11 = TextEditingController();
  TextEditingController lang12 = TextEditingController();
  TextEditingController lang13 = TextEditingController();
  TextEditingController lang14 = TextEditingController();

  bool isChecked = false;
  bool isChecked1 = false;
  bool isCheckedp = false;
  bool isselected = false;
  bool isselectedff = false;
  bool isselectedp = false;
  bool isselectedffp = false;
  bool isselected1 = false;
  bool isselectedff1 = false;
  bool add = false;
  bool selectedc = false;
  bool selecedcc = false;
  bool selcforadditional = false;
  bool selcoffforadditonal = false;
  bool contact = false;
  bool selecforimage = false;

  @override
  void initState() {
    dateinput.text = "";
    dateeinput.text = "";
    dateeinput1.text = "";
    dateeinput1.text = "";
    endp.text = "";
    startp.text = "";
    stt.text = "";
    edd.text = "";
    fname.text =
        PreferencesKey.instance.getString(PreferencesKey.isfname) ?? "";
    lname.text =
        PreferencesKey.instance.getString(PreferencesKey.islname) ?? "";
    email.text =
        PreferencesKey.instance.getString(PreferencesKey.isemail) ?? "";
    phonenum.text =
        PreferencesKey.instance.getString(PreferencesKey.isphonenum) ?? "";
    location.text =
        PreferencesKey.instance.getString(PreferencesKey.islocation) ?? "";
    sjobfun.text =
        PreferencesKey.instance.getString(PreferencesKey.isjobfun) ?? "";
    yearexp.text =
        PreferencesKey.instance.getString(PreferencesKey.isyearexperi) ?? "";
    hobbies.text =
        PreferencesKey.instance.getString(PreferencesKey.ishobbi) ?? "";
    datebirth.text =
        PreferencesKey.instance.getString(PreferencesKey.isbirthdate) ?? "";
    jobtit.text =
        PreferencesKey.instance.getString(PreferencesKey.isjobtitle) ?? "";
    super.initState();
  }

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
      debugPrint("failed to load image:$e");
    }
  }

  final firestore = FirebaseFirestore.instance;
  get dataaaa => null;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 9,
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 78, 195, 241),
              leading: IconButton(
                  onPressed: () {
                    Get.to(HomeScreen_Templates());
                  },
                  icon: Icon(Icons.arrow_back)),
              title: Text(
                AllText().createresu,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
              bottom: TabBar(
                  unselectedLabelColor: Color.fromARGB(255, 3, 35, 61),
                  unselectedLabelStyle: TextStyle(fontSize: 12),
                  labelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorColor: Colors.black,
                  isScrollable: true,
                  tabs: [
                    Tab(text: AllText().bas),
                    Tab(text: AllText().edu),
                    Tab(text: AllText().expri),
                    Tab(text: AllText().skil),
                    Tab(text: AllText().aboutme),
                    Tab(text: AllText().proje),
                    Tab(text: AllText().certi),
                    Tab(text: AllText().lang),
                    Tab(text: AllText().contect),
                  ]),
            ),
            body: Form(
              key: _formKey,
              child: TabBarView(
                children: [
                  //--------------------------------------------basic---------------------------------------------------------------
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      child: Column(
                        children: [
                          // SizedBox(height: 30),
                          // Center(
                          //   child: InkWell(
                          //     onTap: () {
                          //       selecforimage = true;
                          //       pickimage();
                          //     },
                          //     child: Container(
                          //         height: 100,
                          //         width: 100,
                          //         color: Colors.blue,
                          //         child: image != null
                          //             ? Image.file(
                          //                 image!,
                          //                 fit: BoxFit.fill,
                          //               )
                          //             : Center(child: Text("Add Image"))),
                          //   ),
                          // ),
                          SizedBox(height: 30),
                          Textffield(
                              validators: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"[a-zA-Z]+|\s").hasMatch(value)) {
                                  return 'Enter a valid Name!';
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[a-zA-Z]+|\s"),
                                )
                              ],
                              hinttxt: AllText().nam,
                              con: fname,
                              inputtype: TextInputType.name),
                          Textffield(
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
                              hinttxt: AllText().lname,
                              con: lname,
                              inputtype: TextInputType.name),
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
                              con: email,
                              inputtype: TextInputType.emailAddress),
                          Textffield(
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
                              hinttxt: AllText().phone,
                              con: phonenum,
                              inputtype: TextInputType.phone),
                          Textffield(
                              validators: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"[a-zA-Z]+|\s").hasMatch(value)) {
                                  return 'Enter a job Name!';
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[a-zA-Z]+|\s"),
                                )
                              ],
                              hinttxt: AllText().ejobfun,
                              con: sjobfun,
                              inputtype: TextInputType.text),
                          Textffield(
                              validators: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"[a-zA-Z]+|\s").hasMatch(value)) {
                                  return 'Enter a LocationName!';
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[a-zA-Z]+|\s"),
                                )
                              ],
                              hinttxt: AllText().loc,
                              con: location,
                              inputtype: TextInputType.multiline),
                          Textffield(
                              validators: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"[0-9]").hasMatch(value)) {
                                  return 'Enter a Year of Experience!';
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                )
                              ],
                              hinttxt: AllText().yearofex,
                              con: yearexp,
                              inputtype: TextInputType.number),
                          Textffield(
                              validators: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"[a-zA-Z]+|\s").hasMatch(value)) {
                                  return 'Enter Hobbies';
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[a-zA-Z]+|\s"),
                                )
                              ],
                              hinttxt: "Hobbies",
                              con: hobbies,
                              inputtype: TextInputType.text),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10),
                            child: TextFormField(
                              controller: datebirth,
                              autofocus: true,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  onPressed: () async {
                                    DateTime? datepic = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1889),
                                        lastDate: DateTime(2041));
                                    if (datepic != null) {
                                      setState(() {
                                        String formatedate =
                                            DateFormat("LLLL yyyy")
                                                .format(datepic);
                                        datebirth.text = formatedate;
                                      });
                                    } else {
                                      debugPrint("Date not Found");
                                    }
                                  },
                                  icon: Icon(Icons.calendar_month),
                                ),
                                hintText: "Date Of The Birth",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                contentPadding: EdgeInsets.all(10),
                                fillColor: Color.fromARGB(255, 167, 222, 244),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 1, 8, 15)),
                                ),
                                hintStyle: TextStyle(),
                              ),
                            ),
                          ),
                          Textffield(
                              validators: (value) {
                                return null;
                              },
                              inputFormatters: [],
                              hinttxt: AllText().jobt,
                              con: jobtit,
                              inputtype: TextInputType.text),
                          SizedBox(
                            height: 20,
                          ),
                          Containerssforadd(
                              txt: AllText().add,
                              colour: Color.fromARGB(255, 78, 195, 241),
                              ontap: () async {
                                // var imageName = DateTime.now()
                                //     .millisecondsSinceEpoch
                                //     .toString();
                                // var storageRef = FirebaseStorage.instance
                                //     .ref()
                                //     .child('driver_images/$imageName.jpg');
                                // var uploadTask = storageRef.putFile(image!);
                                // var downloadUrl = await (await uploadTask)
                                //     .ref
                                //     .getDownloadURL();

                                if (_formKey.currentState!.validate()) {
                                  _submit();
                                  // CollectionReference collref =
                                  //     FirebaseFirestore.instance
                                  //         .collection("basic");
                                  // collref.add({
                                  //   "First Name": fname.text,
                                  //   "Last Name": lname.text,
                                  //   "E-mail": email.text,
                                  //   "Number": phonenum.text,
                                  //   "JobFn": sjobfun.text,
                                  //   "Location": location.text,
                                  //   "Expirence": yearexp.text,
                                  //   "hobbies": hobbies.text,
                                  //   "Birth date": datebirth.text,
                                  //   "Job Type": jobtit.text,
                                  //   // "Image": downloadUrl.toString()
                                  // });
                                  Get.snackbar("Your Information is saved",
                                      "Please swip the right");
                                }
                              }),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //--------------------------------------------education---------------------------------------------------------------
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      child: isselected == true
                          ? Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Textffield(
                                        validators: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r"[a-zA-Z]+|\s")
                                                  .hasMatch(value)) {
                                            return 'Enter a Scool or Collage Name!';
                                          }
                                          return null;
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(r"[a-zA-Z]+|\s"),
                                          )
                                        ],
                                        hinttxt: AllText().school,
                                        con: scholname,
                                        inputtype: TextInputType.text),
                                    Textffield(
                                        validators: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r"[a-zA-Z]+|\s")
                                                  .hasMatch(value)) {
                                            return 'Enter a Degree!';
                                          }
                                          return null;
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(r"[a-zA-Z]+|\s"),
                                          )
                                        ],
                                        hinttxt: AllText().enterdig,
                                        con: deg,
                                        inputtype: TextInputType.text),
                                    Textffield(
                                        validators: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r"[a-zA-Z]+|\s")
                                                  .hasMatch(value)) {
                                            return 'Enter a Field of Study!';
                                          }
                                          return null;
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(r"[a-zA-Z]+|\s"),
                                          )
                                        ],
                                        hinttxt: AllText().filledofsud,
                                        con: fieldstud,
                                        inputtype: TextInputType.text),
                                    Textffield(
                                        validators: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r"[a-zA-Z]+|\s")
                                                  .hasMatch(value)) {
                                            return 'Enter a Location';
                                          }
                                          return null;
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(r"[a-zA-Z]+|\s"),
                                          )
                                        ],
                                        hinttxt: AllText().loc,
                                        con: loc,
                                        inputtype: TextInputType.text),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Textffieldfordate(
                                          hinttxt: "Start Date",
                                          con: dateinput,
                                          ontap: () async {
                                            DateTime? datepic =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1889),
                                                    lastDate: DateTime(2041));
                                            if (datepic != null) {
                                              setState(() {
                                                String formatedate =
                                                    DateFormat("LLLL yyyy")
                                                        .format(datepic);
                                                dateinput.text = formatedate;
                                              });
                                            } else {
                                              debugPrint("Date not Found");
                                            }
                                          },
                                        ),
                                        Textffieldfordate(
                                          hinttxt: AllText().ed,
                                          con: dateeinput,
                                          ontap: () async {
                                            DateTime? datepic =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1889),
                                                    lastDate: DateTime(2041));
                                            if (datepic != null) {
                                              setState(() {
                                                String formatedate =
                                                    DateFormat("LLLL yyyy")
                                                        .format(datepic);
                                                dateeinput.text = formatedate;
                                              });
                                            } else {
                                              debugPrint("Date not Found");
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Add Education Description",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Textfield_multiline(
                                      con: des,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Checkbox(
                                          value: isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                        Text(AllText().check),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Containers(
                                        txt: AllText().save,
                                        colour:
                                            Color.fromARGB(255, 78, 195, 241),
                                        ontap: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _submit();
                                            // CollectionReference collref =
                                            //     FirebaseFirestore.instance
                                            //         .collection("Education");
                                            // collref.add({
                                            // "Schoolclg Name": scholname.text,
                                            // "Degree": deg.text,
                                            // "Studying Filed": fieldstud.text,
                                            // "Loaction": loc.text,
                                            // "StartDate": dateinput.text,
                                            // "EndDate": dateeinput.text,
                                            // "Description": des.text,
                                            // });
                                            Get.snackbar(
                                                "Your Information is saved",
                                                "Please swip the right");
                                          }

                                          setState(() {
                                            isselectedff = true;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                )
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: 300,
                                ),
                                Center(
                                    child: Text(
                                        "Please add Education Information")),
                                SizedBox(
                                  height: 300,
                                ),
                                Containerssforadd(
                                    txt: "Add",
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      setState(
                                        () {
                                          isselected = true;
                                        },
                                      );
                                    }),
                              ],
                            ),
                    ),
                  ),
                  //--------------------------------------------Experience---------------------------------------------------------------
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: isselected1 == true
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a Job TItle!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().jobtt,
                                    con: jtile,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a Company Name!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().cname,
                                    con: cname,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a Location!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().loc,
                                    con: locc,
                                    inputtype: TextInputType.text),
                                Row(
                                  children: [
                                    Textffieldfordate(
                                      hinttxt: AllText().st,
                                      con: dateinput1,
                                      ontap: () async {
                                        DateTime? datepic =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1000),
                                                lastDate: DateTime(2041));
                                        if (datepic != null) {
                                          setState(() {
                                            String formatedate =
                                                DateFormat("LLLL yyyy")
                                                    .format(datepic);
                                            dateinput1.text = formatedate;
                                          });
                                        } else {
                                          debugPrint("Date not Found");
                                        }
                                      },
                                    ),
                                    Textffieldfordate(
                                      hinttxt: AllText().ed,
                                      con: dateeinput1,
                                      ontap: () async {
                                        DateTime? datepic =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1889),
                                                lastDate: DateTime(2041));
                                        if (datepic != null) {
                                          setState(() {
                                            String formatedate =
                                                DateFormat("LLLL yyyy")
                                                    .format(datepic);
                                            dateeinput1.text = formatedate;
                                          });
                                        } else {
                                          debugPrint("Date not Found");
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Add Experience Description",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Textfield_multiline(
                                  con: des1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      value: isChecked1,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked1 = value!;
                                        });
                                      },
                                    ),
                                    Text(AllText().check2),
                                  ],
                                ),
                                Center(
                                  child: Containers(
                                    txt: AllText().save,
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      if (_formKey.currentState!.validate()) {
                                        _submit();
                                        // CollectionReference collref =
                                        //     FirebaseFirestore.instance
                                        //         .collection("Experiences");
                                        // collref.add({
                                        //   "Job Title": jtile.text,
                                        //   "Compnay Name": cname.text,
                                        //   "Loaction": loc.text,
                                        //   "StartDate": dateinput1.text,
                                        //   "EndDate": dateeinput1.text,
                                        //   "Description": des1.text,

                                        // });
                                        Get.snackbar(
                                            "Your Information is saved",
                                            "Please swip the right");
                                      }
                                    },
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: 300,
                                ),
                                Center(
                                    child: Text(
                                        "Please add Education Information")),
                                SizedBox(
                                  height: 300,
                                ),
                                Containerssforadd(
                                    txt: "Add",
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      setState(
                                        () {
                                          isselected1 = true;
                                        },
                                      );
                                    }),
                              ],
                            ),
                    ),
                  ),
                  //--------------------------------------------Skills---------------------------------------------------------------

                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      child: selectedc == true
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a skils!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().skil,
                                    con: skilss1,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a skils!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().skil,
                                    con: skilss2,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a skils!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().skil,
                                    con: skilss3,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a skils!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().skil,
                                    con: skilss4,
                                    inputtype: TextInputType.text),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Containers(
                                    txt: AllText().save,
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      if (_formKey.currentState!.validate()) {
                                        _submit();
                                        // CollectionReference collref =
                                        //     FirebaseFirestore.instance
                                        //         .collection("Skills");
                                        // collref.add({
                                        //   "Skil1": skilss1.text,
                                        //   "Skil2": skilss2.text,
                                        //   "Skil3": skilss3.text,
                                        //   "Skil4": skilss4.text,

                                        // });
                                        Get.snackbar(
                                            "Your Information is saved",
                                            "Please swip the right");
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: 300,
                                ),
                                Center(child: Text("Please add skills..")),
                                SizedBox(
                                  height: 300,
                                ),
                                Containerssforadd(
                                    txt: "Add",
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      setState(
                                        () {
                                          selectedc = true;
                                        },
                                      );
                                    }),
                              ],
                            ),
                    ),
                  ),

                  //--------------------------------------------About me---------------------------------------------------------------
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 30, right: 20),
                          child: Text(
                            "Add about your self",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 10),
                          child: Textfield_multiline(
                            con: desa,
                          ),
                        ),
                        SizedBox(height: 400),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 20),
                            child: Containerssforadd(
                              txt: AllText().save,
                              colour: Color.fromARGB(255, 78, 195, 241),
                              ontap: () {
                                // CollectionReference collref = FirebaseFirestore
                                //     .instance
                                //     .collection("AboutMe");
                                // collref.add(
                                //   {

                                // "About me": desa.text,
                                // },
                                // );
                                Get.snackbar("Your Information is saved",
                                    "Please swip the right");
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //--------------------------------------------Project---------------------------------------------------------------
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      child: isselectedp == true
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a Project TItle!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().projectt,
                                    con: pttile,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter Role!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().role,
                                    con: role,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter Institue/Company';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().institute,
                                    con: insitute,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter Location!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().loc,
                                    con: locationp,
                                    inputtype: TextInputType.text),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Textffieldfordate(
                                      hinttxt: "Start Date",
                                      con: startp,
                                      ontap: () async {
                                        DateTime? datepic =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1889),
                                                lastDate: DateTime(2041));
                                        if (datepic != null) {
                                          setState(() {
                                            String formatedate =
                                                DateFormat("LLLL yyyy")
                                                    .format(datepic);
                                            startp.text = formatedate;
                                          });
                                        } else {
                                          debugPrint("Date not Found");
                                        }
                                      },
                                    ),
                                    Textffieldfordate(
                                      hinttxt: AllText().ed,
                                      con: endp,
                                      ontap: () async {
                                        DateTime? datepic =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1889),
                                                lastDate: DateTime(2041));
                                        if (datepic != null) {
                                          setState(() {
                                            String formatedate =
                                                DateFormat("LLLL yyyy")
                                                    .format(datepic);
                                            endp.text = formatedate;
                                          });
                                        } else {
                                          debugPrint("Date not Found");
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Description",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Textfield_multiline(
                                  con: desp,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      value: isCheckedp,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheckedp = value!;
                                        });
                                      },
                                    ),
                                    Text(AllText().areyswork),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Containers(
                                    txt: AllText().save,
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      if (_formKey.currentState!.validate()) {
                                        _submit();
                                        // CollectionReference collref =
                                        //     FirebaseFirestore.instance
                                        //         .collection("Projects");
                                        // collref.add({

                                        // "Project Title": pttile.text,
                                        // "Role": role.text,
                                        // "InstituteCompany": insitute.text,
                                        // "Location": locationp.text,
                                        // "StartDate": startp.text,
                                        // "EndDate": endp.text,
                                        // "Description": desp.text,
                                        // });
                                        Get.snackbar(
                                            "Your Information is saved",
                                            "Please swip the right");
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: 300,
                                ),
                                Center(child: Text("Please add project info")),
                                SizedBox(
                                  height: 300,
                                ),
                                Containerssforadd(
                                    txt: "Add",
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      setState(
                                        () {
                                          isselectedp = true;
                                        },
                                      );
                                    }),
                              ],
                            ),
                    ),
                  ),
                  //--------------------------------------------certification---------------------------------------------------------------
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      child: selectedc == true
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter Course Name!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().coursename,
                                    con: coursename,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter Organisation!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().orga,
                                    con: organisation,
                                    inputtype: TextInputType.text),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Textffieldfordate(
                                      hinttxt: "Start Date",
                                      con: stt,
                                      ontap: () async {
                                        DateTime? datepic =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1889),
                                                lastDate: DateTime(2041));
                                        if (datepic != null) {
                                          setState(() {
                                            String formatedate =
                                                DateFormat("LLLL yyyy")
                                                    .format(datepic);
                                            stt.text = formatedate;
                                          });
                                        } else {
                                          debugPrint("Date not Found");
                                        }
                                      },
                                    ),
                                    Textffieldfordate(
                                      hinttxt: AllText().ed,
                                      con: edd,
                                      ontap: () async {
                                        DateTime? datepic =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1889),
                                                lastDate: DateTime(2041));
                                        if (datepic != null) {
                                          setState(() {
                                            String formatedate =
                                                DateFormat("LLLL yyyy")
                                                    .format(datepic);
                                            edd.text = formatedate;
                                          });
                                        } else {
                                          debugPrint("Date not Found");
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Containers(
                                    txt: AllText().save,
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      if (_formKey.currentState!.validate()) {
                                        _submit();
                                        // CollectionReference collref =
                                        //     FirebaseFirestore.instance
                                        //         .collection("Certification");
                                        // collref.add({

                                        //   "Course Name": coursename.text,
                                        //   "Organisation": organisation.text,
                                        //   "StartDate": stt.text,
                                        //   "EndDate": edd.text,
                                        // });
                                        Get.snackbar(
                                            "Your Information is saved",
                                            "Please swip the right");
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: 300,
                                ),
                                Center(
                                    child:
                                        Text("Please add Certification info.")),
                                SizedBox(
                                  height: 300,
                                ),
                                Containerssforadd(
                                    txt: "Add",
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      setState(
                                        () {
                                          selectedc = true;
                                        },
                                      );
                                    }),
                              ],
                            ),
                    ),
                  ),
                  //--------------------------------------------Languages---------------------------------------------------------------
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      child: selectedc == true
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a skils!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().lang,
                                    con: lang11,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a skils!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().lang,
                                    con: lang12,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a skils!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().lang,
                                    con: lang13,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter a skils!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: AllText().lang,
                                    con: lang14,
                                    inputtype: TextInputType.text),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Containers(
                                    txt: AllText().save,
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      if (_formKey.currentState!.validate()) {
                                        _submit();
                                        // CollectionReference collref =
                                        //     FirebaseFirestore.instance
                                        //         .collection("Languages");
                                        // collref.add({
                                        // CollectionReference collref =
                                        //     FirebaseFirestore.instance
                                        //         .collection("Certification");
                                        // collref.add({

                                        //   "Lang1": lang11.text,
                                        //   "Lang2": lang12.text,
                                        //   "Lang3": lang13.text,
                                        //   "Lang4": lang14.text,
                                        // });
                                        Get.snackbar(
                                            "Your Information is saved",
                                            "Please swip the right");
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: 300,
                                ),
                                Center(child: Text("Please add Languages..")),
                                SizedBox(
                                  height: 300,
                                ),
                                Containerssforadd(
                                    txt: "Add",
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      setState(
                                        () {
                                          selectedc = true;
                                        },
                                      );
                                    }),
                              ],
                            ),
                    ),
                  ),

                  //--------------------------------------------contect---------------------------------------------------------------
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      child: contact == true
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter Linkedin Link!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: "Linkedin",
                                    con: linkedin,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter Github Link!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: "Github",
                                    con: github,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter Website Link!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: "Website",
                                    con: websit,
                                    inputtype: TextInputType.text),
                                Textffield(
                                    validators: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r"[a-zA-Z]+|\s")
                                              .hasMatch(value)) {
                                        return 'Enter Twitter Link!';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[a-zA-Z]+|\s"),
                                      )
                                    ],
                                    hinttxt: "Twitter",
                                    con: twitter,
                                    inputtype: TextInputType.text),
                                SizedBox(
                                  height: 20,
                                ),
                                Containerssforadd(
                                    txt: "Save & Genrate a Pdf",
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      if (_formKey.currentState!.validate()) {
                                        _submit();
                                        CollectionReference collref =
                                            FirebaseFirestore.instance
                                                .collection("Basics");
                                        collref.add({
                                          "Skil1": skilss1.text,
                                          "Skil2": skilss2.text,
                                          "Skil3": skilss3.text,
                                          "Skil4": skilss4.text,
                                          "Job Title": jtile.text,
                                          "Compnay Name": cname.text,
                                          "Loaction": loc.text,
                                          "StartDate": dateinput1.text,
                                          "EndDate": dateeinput1.text,
                                          "Description": des1.text,
                                          "Schoolclg Name": scholname.text,
                                          "Degree": deg.text,
                                          "Studying Filed": fieldstud.text,
                                          "Loaction": loc.text,
                                          "StartDate": dateinput.text,
                                          "EndDate": dateeinput.text,
                                          "Description": des.text,
                                          "First Name": fname.text,
                                          "Last Name": lname.text,
                                          "E-mail": email.text,
                                          "Number": phonenum.text,
                                          "JobFn": sjobfun.text,
                                          "Location": location.text,
                                          "Expirence": yearexp.text,
                                          "hobbies": hobbies.text,
                                          "Birth date": datebirth.text,
                                          "Job Type": jobtit.text,
                                          "About me": desa.text,
                                          "Project Title": pttile.text,
                                          "Role": role.text,
                                          "InstituteCompany": insitute.text,
                                          "Location": locationp.text,
                                          "StartDate": startp.text,
                                          "EndDate": endp.text,
                                          "Description": desp.text,
                                          "Course Name": coursename.text,
                                          "Organisation": organisation.text,
                                          "StartDate": stt.text,
                                          "EndDate": edd.text,
                                          "Lang1": lang11.text,
                                          "Lang2": lang12.text,
                                          "Lang3": lang13.text,
                                          "Lang4": lang14.text,
                                          "Linkedin": linkedin.text,
                                          "Github": github.text,
                                          "Website": websit.text,
                                          "Twitter": twitter.text,
                                        });
                                        Get.snackbar(
                                          "Your Information is saved",
                                          "",
                                        );

                                        Get.to(
                                          Templates_Screen(),
                                        );
                                      }
                                    })
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: 300,
                                ),
                                Center(
                                    child:
                                        Text("Please add Certification info.")),
                                SizedBox(
                                  height: 300,
                                ),
                                Containerssforadd(
                                    txt: "Add",
                                    colour: Color.fromARGB(255, 78, 195, 241),
                                    ontap: () {
                                      setState(
                                        () {
                                          contact = true;
                                        },
                                      );
                                    }),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
