import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwork_assignment/app/common/storage/storage.dart';
import 'package:snapwork_assignment/app/modules/home/controller/home_controller.dart';

class CreateEventController extends GetxController {
  TextEditingController selectedTimeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime? selectedDate;
  int? selectedDay;
  TimeOfDay? selectedTime = TimeOfDay.now();

  @override
  void onInit() {
    super.onInit();
    selectedDay = Get.arguments['selectedDay'] + 1;
    selectedDate = DateTime(
        Get.find<HomeController>().selectedYear!,
        Get.find<HomeController>().selectedMonth!.id,
        selectedDay!,
        selectedTime!.hour,
        selectedTime!.minute);
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (picked != null && picked != selectedTime) {
      selectedTime = picked;
      selectedDate = DateTime(
          Get.find<HomeController>().selectedYear!,
          Get.find<HomeController>().selectedMonth!.id,
          selectedDay!,
          picked.hour,
          picked.minute);
      update();
    }
  }

  onSaveClicked() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnDateWhole: selectedDate.toString(),
      DatabaseHelper.columnTitle: titleController.text,
      DatabaseHelper.columnDescription: descriptionController.text,
      DatabaseHelper.columnDay: selectedDate!.day,
      DatabaseHelper.columnMonth: selectedDate!.month,
      DatabaseHelper.columnYear: selectedDate!.year,
    };

    DatabaseHelper().insert(row);

    Get.back();
  }

  String getKey() {
    return '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}';
  }
}

class SaveEventModel {
  String? title;
  String? description;
  DateTime? selectedDateTime;

  SaveEventModel({this.title, this.description, this.selectedDateTime});

  SaveEventModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    selectedDateTime = json['selectedDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['selectedDateTime'] = selectedDateTime;
    return data;
  }
}
