import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwork_assignment/app/common/values/app_colors.dart';
import 'package:snapwork_assignment/app/common/values/styles/app_text_style.dart';

class HomeController extends GetxController {
  List<int> yearList = [
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026
  ];
  List<Month> monthList = [
    Month(id: 1, desc: 'Jan'),
    Month(id: 2, desc: 'Feb'),
    Month(id: 3, desc: 'Mar'),
    Month(id: 4, desc: 'Apr'),
    Month(id: 5, desc: 'May'),
    Month(id: 6, desc: 'Jun'),
    Month(id: 7, desc: 'Jul'),
    Month(id: 8, desc: 'Aug'),
    Month(id: 9, desc: 'Sep'),
    Month(id: 10, desc: 'Oct'),
    Month(id: 11, desc: 'Nov'),
    Month(id: 12, desc: 'Dec'),
  ];

  late int selectedYear = yearList[0];
  late Month? selectedMonth = monthList[0];

  @override
  void onInit() {
    super.onInit();
    getAllDataForYearMonth();
  }

  void showYearBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.90,
                minChildSize: 0.90,
                maxChildSize: 0.90,
                builder: (_, controller) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        const Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: AppTextStyle.getNunitoRegular(
                                'Year', 20, AppColors.kPrimaryDark),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: ListView.separated(
                            controller: controller,
                            itemCount: yearList.length,
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () {
                                  selectedYear = yearList[index];
                                  getAllDataForYearMonth();
                                  Navigator.pop(context);
                                  update();
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30),
                                      child: Center(
                                        child: AppTextStyle.getNunitoRegular(
                                            yearList[index].toString(),
                                            20,
                                            AppColors.kPrimaryDark),
                                      )),
                                ),
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const Divider(
                                height: 2,
                                color: Colors.black,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void showMonthBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.90,
                minChildSize: 0.90,
                maxChildSize: 0.90,
                builder: (_, controller) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        const Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: AppTextStyle.getNunitoRegular(
                                'Month', 20, AppColors.kPrimaryDark),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: ListView.separated(
                            controller: controller,
                            itemCount: monthList.length,
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () {
                                  selectedMonth = monthList[index];
                                  getAllDataForYearMonth();
                                  Navigator.pop(context);
                                  update();
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30),
                                      child: Center(
                                        child: AppTextStyle.getNunitoRegular(
                                            Get.find<HomeController>()
                                                .monthList[index]
                                                .desc,
                                            20,
                                            AppColors.kPrimaryDark),
                                      )),
                                ),
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const Divider(
                                height: 2,
                                color: Colors.black,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  int getDaysOfMonth() {
    if (selectedMonth != null && selectedYear != null) {
      var firstDayThisMonth = DateTime(selectedYear!, selectedMonth!.id, 1);
      var firstDayNextMonth = DateTime(firstDayThisMonth.year,
          firstDayThisMonth.month + 1, firstDayThisMonth.day);
      print("Days ${firstDayNextMonth.difference(firstDayThisMonth).inDays} ");
      return firstDayNextMonth.difference(firstDayThisMonth).inDays;
    } else {
      return 0;
    }
  }

  void getAllDataForYearMonth() {
    // dynamic allKeys = Storage.getAllKeys();
    // List<String> keyOfMonth = List.empty(growable: true);
    // print("allKeys ${allKeys.toList()} ${allKeys.runtimeType}");
    // List tempList = allKeys.toList();
    // tempList.forEach((key) {
    //   if (key.startsWith('${selectedYear.toString()}-${selectedMonth!.id}')) {
    //     keyOfMonth.add(key);
    //   }
    // });
    //
    // print(keyOfMonth.length);
    // getDataForMonth(keyOfMonth);
  }
  //
  // void getDataForMonth(List<String> keyOfMonth) {}
}

class Month {
  final int id;
  final String desc;
  Month({required this.id, required this.desc});
}
