import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwork_assignment/app/common/storage/storage.dart';

import 'app/common/values/strings.dart';
import 'app/common/values/styles/theme.dart';
import 'app/routes/app_pages.dart';

final dbHelper = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: 1,
          ),
          child: child!,
        );
      },
      theme: AppTheme.theme,
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.HOME_PAGE,
      defaultTransition: Transition.rightToLeft,
    );
  }
}
