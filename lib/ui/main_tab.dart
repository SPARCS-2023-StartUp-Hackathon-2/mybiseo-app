import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/assets/strings.dart';
import 'package:mybiseo_app/components/button.dart';
import 'package:mybiseo_app/ui/evaluation_screen.dart';

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
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "데일리",
                  style: Font.H1,
                ),
                Expanded(child: SizedBox.shrink()),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
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
                      type: Strings.hack,
                      start: DateTime(2000, 1, 1, 3, 20),
                      end: DateTime(2000, 1, 1, 4, 20),
                    ),
                    SummaryBarSection(
                      type: Strings.etc,
                      start: DateTime(2000, 1, 1, 4, 20),
                      end: DateTime(2000, 1, 1, 5, 20),
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
          Button(
            title: "내일 일정 만들기",
            onTap: () {
              Get.to(EvaluationScreen());
            },
          ),
          DailyCalendar(),
        ],
      ),
    );
  }
}

class SummaryBarSection extends StatefulWidget {
  const SummaryBarSection(
      {Key? key, required this.type, required this.start, required this.end})
      : super(key: key);

  final String type;
  final DateTime start;
  final DateTime end;

  @override
  State<SummaryBarSection> createState() => _SummaryBarSectionState();
}

class _SummaryBarSectionState extends State<SummaryBarSection> {
  final Map<String, Color> colorMap = {
    'null': Colors.white,
    Strings.sleep: Coloring.gray[10]!,
    Strings.meal: Coloring.green[10]!,
    Strings.workout: Coloring.blue[40]!,
    Strings.hack: Coloring.red[30]!,
    Strings.etc: Coloring.violet[20]!
  };

  int length = 0;

  @override
  void initState() {
    super.initState();

    Duration duration = widget.end.difference(widget.start);
    length = duration.inHours;
    print(length);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: length,
      child: Container(
        height: 25,
        color: colorMap[widget.type],
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
