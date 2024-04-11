import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/seetting.dart';

class custom_Appbar extends StatelessWidget {
  const custom_Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          IconButton(
              iconSize: 30,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 800,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: SafeArea(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    // the profil pic image
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2Q9ebPAZhKXHwTMHUywUugakJN749TUL7AawK8gFQuA&s',
                                              ),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                    //column for the name of patient and email
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "tony stark",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontFamily: 'special',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "stark_industry@gmail.com",
                                          style: TextStyle(
                                            fontFamily: 'special',
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // the seeting list now

                              Center(
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  child: ListTile(
                                    leading:
                                        Icon(Icons.home, color: Colors.black),
                                    title: Text('Home',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'special',
                                        )),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Container(
                                  height: 50,
                                  width: 170,
                                  child: ListTile(
                                    leading: Icon(Icons.settings,
                                        color: Colors.black),
                                    title: Text('Settings',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'special',
                                        )),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              seetting(),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            const begin = Offset(1.0, 0.0);
                                            const end = Offset.zero;
                                            const curve = Curves.ease;
                                            var tween = Tween(
                                                    begin: begin, end: end)
                                                .chain(
                                                    CurveTween(curve: curve));
                                            var offsetAnimation =
                                                animation.drive(tween);
                                            return SlideTransition(
                                              position: offsetAnimation,
                                              child: child,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  child: ListTile(
                                    leading:
                                        Icon(Icons.info, color: Colors.black),
                                    title: Text('About',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'special',
                                        )),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Credit',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontFamily: 'special'),
                                            ),
                                            content: Text(
                                              'team noobieezzz',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'special'),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Close'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.menu)),
          SizedBox(
            width: 270,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2Q9ebPAZhKXHwTMHUywUugakJN749TUL7AawK8gFQuA&s',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
