// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class textwidget extends StatelessWidget {
  final String txt;
  final Color colors;
  const textwidget({
    super.key,
    required this.txt,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        letterSpacing: 1,
        color: colors,
        wordSpacing: 1,
        fontWeight: FontWeight.w600,
        fontSize: MediaQuery.of(context).size.height / 60,
      ),
    );
  }
}

class listtilewidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color colors;
  const listtilewidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Center(
          child: Text(
            title,
            style: TextStyle(
                color: colors,
                wordSpacing: 1,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height / 59),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 130,
        ),
        Text(
          subtitle,
          style: TextStyle(
              wordSpacing: 1,
              letterSpacing: 1,
              color: colors,
              fontWeight: FontWeight.w400,
              fontSize: MediaQuery.of(context).size.height / 75),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 60,
        ),
      ],
    );
  }
}
