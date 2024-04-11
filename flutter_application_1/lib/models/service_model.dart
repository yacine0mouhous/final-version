class Service {
  final String name, link, title, subTitle, notice;
  final List<int> workingDay;
  Service(
      {required this.name,
      required this.link,
      required this.title,
      required this.subTitle,
      required this.workingDay,
      required this.notice});
}

final List<Service> services = [
  Service(
    name: 'Visite médicale',
    link:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlzNLXQmGUYUyCBigZNTB2yH_J76ohvdmhy7QOl-sRdw&s',
    title: "Service 1",
    subTitle: "this service work on the current days : monday friday  ",
    workingDay: [1],
    notice: 'dont forget to drink water',
  ),
  Service(
    name: 'Opération',
    link:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKGmQG2E3Ew5JhjVHrvQuY9O-VA0YbMlMZFbCdvy02_g&s',
    title: "Service 2",
    subTitle: "this service work on the current days : Sunday friday  ",
    workingDay: [3],
    notice: 'dont forget to drink water',
  ),
  Service(
    name: 'Correction de vision',
    link:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE40cr-pX2m4D4oDDlEh9UWx0W00vhIvR0swBWukjfvw&s',
    title: "Service 3",
    subTitle: "this service work on the current days : monday Left me broken  ",
    workingDay: [4],
    notice: 'dont forget to drink water',
  ),
  Service(
    name: 'Cataracte',
    link:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPlk2cY4qlR8mvfeZnMR3Z6wk_RBdJLcdpmX5PgmeufQ&s',
    title: "Service 4",
    subTitle: "this service work on the current days : monday friday  ",
    workingDay: [2],
    notice: 'dont forget to drink water',
  ),
];
