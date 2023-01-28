import 'package:flutter/material.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({Key? key}) : super(key: key);

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  @override
  Widget build(BuildContext context) {
    return GeneralSafeArea(
      child: Scaffold(
        backgroundColor: Coloring.bg_color,
      ),
    );
  }
}
