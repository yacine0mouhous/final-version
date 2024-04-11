import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/service_model.dart';
import 'package:flutter_application_1/screen/service_screen.dart';

List<Widget> searchBody(String text, BuildContext context) {
  return [
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Container(
    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    //       child: Text(
    //         text,
    //         style: TextStyle(color: Colors.black, fontSize: 17),
    //       ),
    //     )
    //   ],
    // ),
    SizedBox(
      height: 15,
    ),
    ...services
        .where((element) =>
            (element.title.toLowerCase().contains(text.toLowerCase()) ||
                element.name.toLowerCase().contains(text.toLowerCase())))
        .map((e) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      ServiceScreen(service: e),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              style: ListTileStyle.list,
              subtitle: Text(
                e.subTitle,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
              ),
              leading: Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      10), // Half of width/height for circular border
                  child: Image.network(
                    e.link,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: Text(
                e.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            )))
        .toList(),
  ];
}
