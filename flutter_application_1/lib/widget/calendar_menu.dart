import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar_menu extends StatefulWidget {
  late List<int> working_day;
  late DateTime? Next_Appoitement;
  Calendar_menu(this.working_day, this.Next_Appoitement, {Key? key})
      : super(key: key);

  @override
  State<Calendar_menu> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar_menu> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = widget.Next_Appoitement!;
    _selectedDay = widget.Next_Appoitement!;
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
              //  _selectedDay = selectedDay;
            });
          }
        },
        onPageChanged: (focusedDay) {
          setState(() {
            //   _focusedDay = focusedDay;
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
          weekendTextStyle: TextStyle().copyWith(color: Colors.red),
          holidayTextStyle: TextStyle().copyWith(color: Colors.green),
          outsideDaysVisible: false,
        ),
        weekendDays: widget.working_day,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle().copyWith(color: Colors.black),
          weekendStyle: TextStyle().copyWith(color: Colors.red),
        ),
        headerVisible: true,
      ),
    );
  }

  bool isWeekendDay(DateTime day) {
    int dayOfWeek = day.weekday; // Get the weekday (1 = Monday, 7 = Sunday)
    // Check if the day of week corresponds to a weekend day based on widget.working_day
    return widget.working_day.contains(dayOfWeek);
  }

  String _formattedSelectedDay() {
    return '${_selectedDay.year}-${_selectedDay.month}-${_selectedDay.day}';
  }
}
