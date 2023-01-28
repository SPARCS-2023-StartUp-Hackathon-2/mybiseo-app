import 'package:flutter/material.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({Key? key}) : super(key: key);

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  int current_index = 0;

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
                    "리포트",
                    style: Font.H1,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 19),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#칭호\n#닉네임",
                        style: Font.H3,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_right))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Coloring.blue[10],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReportSegment(),
                        Container(
                          width: 1,
                          height: 25,
                          color: Coloring.gray[50],
                        ),
                        ReportSegment(),
                        Container(
                          width: 1,
                          height: 25,
                          color: Coloring.gray[50],
                        ),
                        ReportSegment(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 19),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            current_index = 0;
                          });
                        },
                        child: Text(
                          "7일간 통계",
                          style: Font.Headline,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            current_index = 1;
                          });
                        },
                        child: Text(
                          "HACK",
                          style: Font.Headline,
                        ),
                      ),
                    ],
                  ),
                  if (current_index == 0)
                    Column(
                      children: [
                        Text(
                          "밸런스가 잘 맞네요!",
                          style: Font.Headline,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SemicircularIndicator(
                            contain: true,
                            progress: 0.5,
                            color: Coloring.violet[40]!,
                            backgroundColor: Coloring.gray[10]!,
                            child: Column(
                              children: [
                                Text("75%"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (current_index == 1)
                    Column(
                      children: [
                        Container(
                          child: Column(
                            children: [],
                          ),
                        )
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReportSegment extends StatefulWidget {
  const ReportSegment({Key? key}) : super(key: key);

  @override
  State<ReportSegment> createState() => _ReportSegmentState();
}

class _ReportSegmentState extends State<ReportSegment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("🏃‍"),
              Text(
                "#일",
                style: Font.Headline,
              ),
            ],
          ),
          Text(
            "진행중",
            style: TextStyle(color: Coloring.gray[50], fontSize: 9),
          )
        ],
      ),
    );
  }
}

class HackSegment extends StatefulWidget {
  const HackSegment({Key? key}) : super(key: key);

  @override
  State<HackSegment> createState() => _HackSegmentState();
}

class _HackSegmentState extends State<HackSegment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [StepProgressIndicator(totalSteps: 10)],
      ),
    );
  }
}
