// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resumemaker/utils/text.dart';

class Textfieldfordate extends StatelessWidget {
  final String hinttxt;
  final TextEditingController con;
  final TextInputType inputtype;

  const Textfieldfordate({
    super.key,
    required this.hinttxt,
    required this.con,
    required this.inputtype,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: TextFormField(
        controller: con,
        autofocus: true,
        keyboardType: inputtype,
        decoration: InputDecoration(
          hintText: hinttxt,
          hintTextDirection: TextDirection.ltr,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white)),
          contentPadding: EdgeInsets.all(10),
          fillColor: Color.fromARGB(255, 167, 222, 244),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromARGB(255, 1, 8, 15)),
          ),
          hintStyle: TextStyle(),
        ),
      ),
    );
  }
}

class PassWord_Textfield_widget extends StatelessWidget {
  const PassWord_Textfield_widget(
      {super.key,
      required this.txt,
      required this.hinttxt,
      required this.inputtype,
      required this.conpass,
      required this.obscureText,
      required this.btn,
      required this.icons,
      required this.inputFormatters,
      required this.validators});
  final String txt;
  final String hinttxt;
  final TextEditingController conpass;
  final TextInputType inputtype;
  final bool obscureText;
  final VoidCallback btn;
  final Icon icons;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validators;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AllText().pass,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: conpass,
            inputFormatters: inputFormatters,
            keyboardType: TextInputType.text,
            obscureText: obscureText,
            validator: validators,
            decoration: InputDecoration(
              fillColor: Color.fromARGB(255, 167, 222, 244),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white)),
              hintText: AllText().pass,
              filled: true,
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 1, 8, 15)),
                borderRadius: BorderRadius.circular(20),
              ),
              suffixIcon: IconButton(onPressed: btn, icon: icons),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFormField_widgte extends StatelessWidget {
  final String txt;
  final String hinttxt;
  final TextEditingController con;
  final TextInputType inputtype;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validators;
  const TextFormField_widgte({
    super.key,
    required this.txt,
    required this.hinttxt,
    required this.con,
    required this.inputtype,
    required this.inputFormatters,
    required this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: con,
            autofocus: true,
            keyboardType: inputtype,
            validator: validators,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: hinttxt,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white)),
              contentPadding: EdgeInsets.all(10),
              fillColor: Color.fromARGB(255, 167, 222, 244),
              filled: true,
              hintStyle: TextStyle(),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 230, 231, 233).withOpacity(0.1)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Textffield extends StatelessWidget {
  final String hinttxt;
  final TextEditingController con;
  final TextInputType inputtype;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validators;
  const Textffield({
    super.key,
    required this.hinttxt,
    required this.con,
    required this.inputtype,
    required this.inputFormatters,
    required this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: TextFormField(
        controller: con,
        autofocus: true,
        validator: validators,
        inputFormatters: inputFormatters,
        keyboardType: inputtype,
        decoration: InputDecoration(
          hintText: hinttxt,
          hintTextDirection: TextDirection.ltr,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white)),
          contentPadding: EdgeInsets.all(10),
          fillColor: Color.fromARGB(255, 167, 222, 244),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromARGB(255, 1, 8, 15)),
          ),
          hintStyle: TextStyle(),
        ),
      ),
    );
  }
}

class Textffieldfordate extends StatelessWidget {
  final String hinttxt;
  final TextEditingController con;
  final VoidCallback ontap;
  const Textffieldfordate({
    super.key,
    required this.hinttxt,
    required this.con,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: Container(
        height: 80,
        width: 165,
        child: TextFormField(
          controller: con,
          autofocus: true,
          decoration: InputDecoration(
            hintText: hinttxt,
            prefixIcon:
                IconButton(onPressed: ontap, icon: Icon(Icons.calendar_month)),
            hintTextDirection: TextDirection.ltr,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            contentPadding: EdgeInsets.all(10),
            fillColor: Color.fromARGB(255, 167, 222, 244),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color.fromARGB(255, 1, 8, 15)),
            ),
            hintStyle: TextStyle(),
          ),
        ),
      ),
    );
  }
}

class Textfield_multiline extends StatelessWidget {
  final TextEditingController con;

  const Textfield_multiline({
    super.key,
    required this.con,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height / 5.6,
        width: double.infinity,
        child: TextFormField(
          controller: con,
          maxLines: null,
          expands: true,
          autofocus: true,
          decoration: InputDecoration(
            hintTextDirection: TextDirection.ltr,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Color.fromARGB(255, 167, 222, 244),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color.fromARGB(255, 1, 8, 15)),
            ),
          ),
        ),
      ),
    );
  }
}

class Textffield_skill extends StatelessWidget {
  final String hinttxt;
  final TextEditingController con;
  final TextInputType inputtype;
  final VoidCallback ontap;

  const Textffield_skill({
    super.key,
    required this.hinttxt,
    required this.con,
    required this.inputtype,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10, right: 20),
      child: TextFormField(
        controller: con,
        autofocus: true,
        keyboardType: inputtype,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: ontap,
            icon: Icon(Icons.add_box_sharp),
          ),
          hintText: hinttxt,
          hintTextDirection: TextDirection.ltr,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white)),
          contentPadding: EdgeInsets.all(10),
          fillColor: Color.fromARGB(255, 167, 222, 244),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromARGB(255, 1, 8, 15)),
          ),
        ),
      ),
    );
  }
}
