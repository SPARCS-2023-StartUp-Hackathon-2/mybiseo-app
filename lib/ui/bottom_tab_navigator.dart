import 'package:flutter/material.dart';
import 'package:mybiseo_app/ui/cal_tab.dart';
import 'package:mybiseo_app/ui/main_tab.dart';
import 'package:mybiseo_app/ui/report_tab.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key}) : super(key: key);

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int page_idx = 0;
  List<StatefulWidget> pages = [
    MainTab(),
    CalTab(),
    ReportTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return GeneralSafeArea(
      child: Scaffold(
        body: pages[page_idx],
        bottomNavigationBar: Stack(
          children: [
            Wrap(
              children: [
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                page_idx = 0;
                              });
                            },
                            icon: Icon(Icons.add)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                page_idx = 1;
                              });
                            },
                            icon: Icon(Icons.add)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                page_idx = 2;
                              });
                            },
                            icon: Icon(Icons.add)),
                      ],
                    ),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
