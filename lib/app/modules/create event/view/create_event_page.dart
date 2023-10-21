import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snapwork_assignment/app/modules/create%20event/controller/create_event_controller.dart';
import 'package:snapwork_assignment/app/style/style.dart';

import '../../../common/values/app_colors.dart';
import '../../../common/values/styles/app_text_style.dart';

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Detail"),
        centerTitle: true,
        leading: Center(
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: AppTextStyle.getNunitoRegular(
                    'Back', 15, AppColors.white))),
      ),
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: GetBuilder<CreateEventController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      child: AppTextStyle.getNunitoRegular(
                          'Date & Time', 15, AppColors.black),
                    ),
                    InkWell(
                        onTap: () {
                          controller.selectTime(context);
                        },
                        child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.FFDBDBDB, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 15.0),
                              child: AppTextStyle.getNunitoRegular(
                                  "${controller.selectedTime?.hour} : ${controller.selectedTime?.minute}",
                                  15,
                                  AppColors.black),
                            ))),
                    SizedBox(
                      width: 20,
                    ),
                    AppTextStyle.getNunitoRegular(
                        (controller.selectedDate != null)
                            ? DateFormat('dd-MMM-yyyy')
                                .format(controller.selectedDate!)
                            : "",
                        15,
                        AppColors.black),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15.0),
                child: Row(
                  children: [
                    Container(
                        width: 100,
                        child: AppTextStyle.getNunitoRegular(
                            'Title', 15, AppColors.black)),
                    getTitleField()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 15.0, right: 15.0, bottom: 10),
                child: Row(
                  children: [
                    AppTextStyle.getNunitoRegular(
                        'Description', 15, AppColors.black),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: getDescriptionField(),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.onSaveClicked();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.kPrimaryDark)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: AppTextStyle.getNunitoRegular(
                          'Save', 20, AppColors.white),
                    )),
              )
            ],
          );
        }),
      ),
    );
  }
}

Widget getTitleField() {
  return Style.getInputTextField(
    'Enter Title',
    TextInputType.emailAddress,
    Get.find<CreateEventController>().titleController,
    200,
    leftMargin: 0,
    rightMargin: 0,
    onChanged: (value) {},
  );
}

Widget getDescriptionField() {
  return Style.getInputTextField(
    '',
    TextInputType.emailAddress,
    Get.find<CreateEventController>().descriptionController,
    double.infinity,
    leftMargin: 0,
    rightMargin: 0,
    minLines: 5,
    onChanged: (value) {},
  );
}
