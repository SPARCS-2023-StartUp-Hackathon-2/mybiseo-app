import 'package:flutter/material.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';
import 'package:table_calendar/table_calendar.dart';

class CalTab extends StatefulWidget {
  const CalTab({Key? key}) : super(key: key);

  @override
  State<CalTab> createState() => _CalTabState();
}

class _CalTabState extends State<CalTab> {
  @override
  Widget build(BuildContext context) {
    return GeneralSafeArea(
      child: Scaffold(
        backgroundColor: Coloring.bg_color,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "1월",
                    style: Font.H1,
                  ),
                  Expanded(child: SizedBox.shrink()),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 30,
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14.5),
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: TableCalendar(
                headerVisible: false,
                focusedDay: DateTime.now(),
                firstDay: DateTime.now().subtract(Duration(days: 365 * 5)),
                lastDay: DateTime.now().add(
                  Duration(days: 365 * 5),
                ),
              ),
            ),
            Column(
              children: [CalendarListSection()],
            )
          ],
        ),
      ),
    );
  }
}

class CalendarListSection extends StatelessWidget {
  const CalendarListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Coloring.green[10],
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Text(
                  "20",
                  style: Font.H2,
                ),
                Text(
                  "금요일",
                  style: Font.Caption,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "정기 모임",
                  style: Font.Headline,
                ),
                Text(
                  "홍대 가기",
                  style: Font.Caption,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
