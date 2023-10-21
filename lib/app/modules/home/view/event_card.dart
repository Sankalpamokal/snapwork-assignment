import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwork_assignment/app/common/values/app_colors.dart';
import 'package:snapwork_assignment/app/common/values/styles/app_text_style.dart';

import '../controller/home_controller.dart';

class EventCard extends StatelessWidget {
  final int? index;
  const EventCard({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextStyle.getNunitoRegular(
                (index! + 1).toString(), 20, AppColors.black),
            AppTextStyle.getNunitoRegular(
                Get.find<HomeController>().selectedMonth?.desc ?? "",
                20,
                AppColors.black),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 2,
          height: 60,
          color: AppColors.black,
        )
      ],
    );
  }
}
