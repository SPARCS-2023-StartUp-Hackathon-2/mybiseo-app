import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/assets/strings.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloring.bg_color,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 32, horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("안녕", style: Font.H3),
                Text("오늘 중요한 일정이 1개 있어요"),
                Row(
                  children: [
                    SummaryBarSection(
                      color: Colors.redAccent,
                      size: 3,
                    ),
                    SummaryBarSection(
                      color: Colors.yellow,
                      size: 2,
                    ),
                    SummaryBarSection(
                      color: Colors.greenAccent,
                      size: 4,
                    ),
                    SummaryBarSection(
                      color: Colors.blueAccent,
                      size: 1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("0:00"),
                    Expanded(child: SizedBox.shrink()),
                    Text("24:00"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
            decoration: BoxDecoration(
                color: Coloring.blue[30],
                borderRadius: BorderRadius.circular(16)),
            alignment: Alignment.center,
            child: Text(
              "내일 일정 만들기",
              style: TextStyle(color: Colors.white),
            ),
          ),
          DailyCalendar(),
        ],
      ),
    );
  }
}

class SummaryBarSection extends StatelessWidget {
  const SummaryBarSection({Key? key, this.size = 1, this.color = Colors.black})
      : super(key: key);

  final size;
  final color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: size,
      child: Container(
        height: 25,
        color: color,
      ),
    );
  }
}

class DailyCalendar extends StatelessWidget {
  const DailyCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 27),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          // DailyCalendarSection(title: "잠자기", type: Strings.sleep, ),
          // DailyCalendarSection(title: "Hack", type: Strings.hack, ),
          DailyCalendarSection(
            title: "hacker~",
            type: Strings.hack,
            start: DateTime(2001, 12, 3, 12, 30),
            end: DateTime(2001, 12, 3, 14, 30),
          ),
        ],
      ),
    );
  }
}

class DailyCalendarSection extends StatefulWidget {
  const DailyCalendarSection(
      {Key? key,
      this.title = '',
      this.type,
      required this.start,
      required this.end})
      : super(key: key);

  final String title;
  final String? type;
  final DateTime start;
  final DateTime end;

  @override
  State<DailyCalendarSection> createState() => _DailyCalendarSectionState();
}

class _DailyCalendarSectionState extends State<DailyCalendarSection> {
  bool is_blank = false;
  int length = 0;

  @override
  void initState() {
    super.initState();
    if (widget.type == null) {
      is_blank = true;
    }
    Duration duration = widget.end.difference(widget.start);
    length = duration.inHours;
    print(length);
  }

  final Map<String, Color> colorMap = {
    Strings.sleep: Coloring.gray[10]!,
    Strings.meal: Coloring.green[10]!,
    Strings.workout: Coloring.blue[40]!,
    Strings.hack: Coloring.red[30]!,
    Strings.etc: Coloring.violet[20]!
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: is_blank ? 4 : 12,
            height: (length + 2) * 12,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                color: colorMap[widget.type],
                borderRadius: BorderRadius.circular(99)),
          ),
          Text(
            widget.title,
            style: Font.Headline,
          ),
          Expanded(child: SizedBox.shrink()),
          if (!is_blank)
            Text(DateFormat('HH:mm').format(widget.start) +
                "-" +
                DateFormat('HH:mm').format(widget.end)),
        ],
      ),
    );
  }
}
