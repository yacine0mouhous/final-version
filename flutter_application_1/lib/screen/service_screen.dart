import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/Calaendar.dart';
import 'package:flutter_application_1/models/service_model.dart';

class ServiceScreen extends StatelessWidget {
  DateTime selected_appoitement = DateTime.now();
  final Service service;
  ServiceScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.highlight_remove,
                        size: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(service.link),
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
              // service information
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 280,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: SafeArea(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 20, top: 15),
                            child: Text(
                              service.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'special',
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Icon(
                            Icons.medical_services_outlined,
                            size: 40,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 20, top: 10),
                        child: Text(
                          service.subTitle,
                          style: TextStyle(fontSize: 18, fontFamily: 'special'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('notice: ' + service.notice,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'special',
                              color: const Color.fromARGB(255, 153, 41, 33),
                            )),
                      ),
                    ],
                  )),
                ),
              ),
              // calendar and take appoitement buttom
              Container(
                height: 400,
                width: 350,
                child: Calendar(service.workingDay), // 1
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
