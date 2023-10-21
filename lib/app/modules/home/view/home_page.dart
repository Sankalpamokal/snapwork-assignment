import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwork_assignment/app/common/values/styles/app_text_style.dart';
import 'package:snapwork_assignment/app/modules/home/controller/home_controller.dart';
import 'package:snapwork_assignment/app/modules/home/view/event_card.dart';
import 'package:snapwork_assignment/app/routes/app_pages.dart';

import '../../../common/values/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
        centerTitle: true,
      ),
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: GetBuilder<HomeController>(builder: (controller) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            controller.showYearBottomSheet(context);
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.kPrimaryDark)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: AppTextStyle.getNunitoRegular(
                                controller.selectedYear != null
                                    ? controller.selectedYear.toString()
                                    : 'Year',
                                20,
                                AppColors.white),
                          )),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.showMonthBottomSheet(context);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.kPrimaryDark)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: AppTextStyle.getNunitoRegular(
                              controller.selectedMonth != null
                                  ? controller.selectedMonth!.desc
                                  : 'Month',
                              20,
                              AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: controller.getDaysOfMonth(),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.CREATE_EVENT,
                            arguments: {'selectedDay': index});
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 8),
                        child: EventCard(index: index),
                      ),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 8),
                      child: const Divider(
                        height: 2,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
