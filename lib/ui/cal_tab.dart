import 'package:flutter/material.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:table_calendar/table_calendar.dart';

class CalTab extends StatefulWidget {
  const CalTab({Key? key}) : super(key: key);

  @override
  State<CalTab> createState() => _CalTabState();
}

class _CalTabState extends State<CalTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloring.bg_color,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(color: Colors.white),
            child: TableCalendar(
                headerVisible: false,
                focusedDay: DateTime.now(),
                firstDay: DateTime.now().subtract(Duration(days: 365 * 5)),
                lastDay: DateTime.now().add(
                  Duration(days: 365 * 5),
                )),
          )
        ],
      ),
    );
  }
}
