import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:quickalert/quickalert.dart';

class Calendar extends StatefulWidget {
  late List<int> working_day;
  DateTime selected = DateTime.now();

  Calendar(this.working_day, {Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = widget.selected;
    _selectedDay = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: TableCalendar(
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            currentDay: DateTime.now(),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isWeekendDay(selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay =
                      selectedDay; // Update the focused day to the selected day
                });
              }
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Color.fromARGB(255, 9, 78, 53),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(color: Colors.red),
              holidayTextStyle: TextStyle(color: Colors.green),
              outsideDaysVisible: false,
            ),
            weekendDays: widget.working_day,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.black),
              weekendStyle: TextStyle(color: Colors.red),
            ),
            headerVisible: true,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.confirm,
              text: 'are u sure u wanna take appoitement on : ' +
                  _selectedDay.day.toString() +
                  "/" +
                  _selectedDay.month.toString() +
                  "/" +
                  _selectedDay.day.toString(),
              confirmBtnText: 'Yes',
              cancelBtnText: 'No',
              confirmBtnColor: Colors.green,
              onConfirmBtnTap: () {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'appoitement taken !',
                    onConfirmBtnTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
              },
            );
          },
          child: Container(
            height: 50,
            width: 240,
            child: Center(
                child: Text(
              'take appoitement!',
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'special'),
            )),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool isWeekendDay(DateTime day) {
    int dayOfWeek = day.weekday;

    return widget.working_day.contains(dayOfWeek);
  }
}
