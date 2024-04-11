import 'package:flutter/material.dart';

import 'package:flutter_application_1/widget/custom_Appbar.dart';
import 'package:flutter_application_1/widget/home_body.dart';
import 'package:flutter_application_1/widget/serach_body.dart';

class home_screen extends StatefulWidget {
  home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime next_appoitement = DateTime(2024, 4, 21);
  bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                custom_Appbar(),
                const Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5, bottom: 15),
                  child: Text(
                    "hello,tony stark ",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'special',
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // search bar

                Center(
                    child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.green, // Specify the color here
                      width: 3, // Specify the width of the border
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          this.isEmpty = value.isEmpty;
                        });
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "search service",
                        suffixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      ),
                    ),
                  ),
                )),

                const SizedBox(
                  height: 15,
                ),
                //screen that show ur next appointement
                ...((isEmpty)
                    ? homeBody(context, next_appoitement)
                    : searchBody(searchController.text, context)),

                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
