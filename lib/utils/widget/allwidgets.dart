// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class TItles_And_Subtitle extends StatelessWidget {
  const TItles_And_Subtitle(
      {super.key, required this.titles, required this.subtitles});
  final String titles;
  final String subtitles;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      child: ListView.builder(
          itemCount: 2,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Column(
                children: [
                  Center(
                      child: Text(index == 0 ? titles : subtitles,
                          style: index == 0
                              ? TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  letterSpacing: 3,
                                  color: Colors.black)
                              : TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  letterSpacing: 1))),
                ],
              )),
    );
  }
}

class Containers extends StatelessWidget {
  final String txt;
  final Color colour;
  final VoidCallback ontap;

  const Containers({
    super.key,
    required this.txt,
    required this.colour,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 18,
        child: ElevatedButton(
          focusNode: FocusNode(canRequestFocus: true),
          style: ButtonStyle(
            elevation: MaterialStatePropertyAll(5),
            backgroundColor: MaterialStateProperty.all(colour),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          onPressed: ontap,
          child: Text(txt,
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 1, 40),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Spectral",
                  letterSpacing: 2,
                  fontSize: 18)),
        ));
  }
}

class Containerss extends StatelessWidget {
  final String txt;
  final Color colour;
  final VoidCallback ontap;

  const Containerss({
    super.key,
    required this.txt,
    required this.colour,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 18,
        child: ElevatedButton(
          focusNode: FocusNode(canRequestFocus: true),
          style: ButtonStyle(
            elevation: MaterialStatePropertyAll(5),
            backgroundColor: MaterialStateProperty.all(colour),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          onPressed: ontap,
          child: Text(txt,
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 1, 40),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Spectral",
                  letterSpacing: 2,
                  fontSize: 14.5)),
        ));
  }
}

class Containers_widget extends StatelessWidget {
  final String txt;
  final Color colour;
  final VoidCallback ontap;

  const Containers_widget({
    super.key,
    required this.txt,
    required this.colour,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 18,
        child: ElevatedButton(
          focusNode: FocusNode(canRequestFocus: true),
          style: ButtonStyle(
            elevation: MaterialStatePropertyAll(5),
            backgroundColor: MaterialStateProperty.all(colour),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          onPressed: ontap,
          child: Row(
            children: [
              Text(txt,
                  style: TextStyle(
                      color: Color.fromARGB(255, 5, 1, 40),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Spectral",
                      letterSpacing: 2,
                      fontSize: 18)),
              Icon(
                Icons.arrow_forward_outlined,
                size: 14,
                color: Colors.black,
              )
            ],
          ),
        ));
  }
}

class Containerssforadd extends StatelessWidget {
  final String txt;
  final Color colour;
  final VoidCallback ontap;

  const Containerssforadd({
    super.key,
    required this.txt,
    required this.colour,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 5),
      child: SizedBox(
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height / 18,
          child: ElevatedButton(
            focusNode: FocusNode(canRequestFocus: true),
            style: ButtonStyle(
              elevation: MaterialStatePropertyAll(5),
              backgroundColor: MaterialStateProperty.all(colour),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            onPressed: ontap,
            child: Text(txt,
                style: TextStyle(
                    color: Color.fromARGB(255, 5, 1, 40),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Spectral",
                    letterSpacing: 2,
                    fontSize: 18)),
          )),
    );
  }
}

class contact extends StatelessWidget {
  final String txt;
  final Widget icon;
  final Color colors;
  const contact({
    super.key,
    required this.txt,
    required this.icon,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(2)),
          child: icon,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 75,
        ),
        Text(
          txt,
          style: TextStyle(color: colors, fontSize: 7.4),
        ),
      ],
    );
  }
}

class dv extends StatelessWidget {
  final Color colors;
  const dv({
    super.key,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: colors,
    );
  }
}

class sized4 extends StatelessWidget {
  const sized4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 100,
    );
  }
}

class text extends StatelessWidget {
  final String txt;
  const text({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w200, color: Colors.black),
    );
  }
}
