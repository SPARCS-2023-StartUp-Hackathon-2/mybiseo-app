import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:mybiseo_app/assets/coloring.dart';
import 'package:mybiseo_app/assets/font.dart';
import 'package:mybiseo_app/widget/general_safe_area.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  int current_index = 0;

  @override
  Widget build(BuildContext context) {
    return GeneralSafeArea(
      child: Scaffold(
        backgroundColor: Coloring.bg_color,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 10, bottom: 30),
              color: Coloring.bg_color,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        size: 50,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 30),
                    child: Text(
                      "업적",
                      style: Font.H1,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [],
                ),
              ),
            ),
            Container(
              height: 80,
              margin: EdgeInsets.symmetric(vertical: 45),
              child: InfiniteCarousel.builder(
                  loop: false,
                  itemCount: 20,
                  itemExtent: 90,
                  axisDirection: Axis.horizontal,
                  onIndexChanged: (index) {
                    setState(() {
                      current_index = index;
                    });
                  },
                  itemBuilder: (context, itemIndex, realIndex) {
                    return Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: current_index == itemIndex
                            ? Coloring.blue[20]
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(99),
                          bottomRight: Radius.circular(99),
                          topLeft: Radius.circular(99),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
